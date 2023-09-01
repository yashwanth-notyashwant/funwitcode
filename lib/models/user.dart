import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class User {
  String mailId;
  String name;
  String password;
  int score;

  User({
    required this.name,
    required this.mailId,
    required this.password,
    required this.score,
  });

  Map<String, dynamic> toJson() {
    return {
      'mailId': mailId,
      'name': name,
      'password': password,
      'score': score,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      mailId: json['mailId'],
      name: json['name'],
      password: json['password'],
      score: json['score'],
    );
  }
}

class Users with ChangeNotifier {
  Future<bool> incrementUserScore(String userId) async {
    const databaseUrl = 'https://funwitcode-default-rtdb.firebaseio.com/';
    final url = Uri.parse('$databaseUrl/users/$userId.json');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final userData = json.decode(response.body);
        if (userData != null && userData['score'] != null) {
          final currentScore = userData['score'] as int;
          final newScore = currentScore + 1;

          final updateResponse = await http.patch(
            // Use patch to update a specific field without sending the entire object
            url,
            body: json.encode({"score": newScore}),
          );

          if (updateResponse.statusCode == 200) {
            // If the PATCH request is successful (status code 200), return true
            print(updateResponse.body);
            print(updateResponse.statusCode);
            return true;
          } else {
            print(updateResponse.body);
            print(updateResponse.statusCode);
            // If the PATCH request is not successful, return false
            return false;
          }
        }
      }
    } catch (error) {
      // If an error occurs during the request, return false
      print(error);
    }

    return false; // Default value if there was an error or no user data found
  }

  Future<List<User>> getUsersOrderedByScore() async {
    const databaseUrl = 'https://funwitcode-default-rtdb.firebaseio.com/';
    final url = Uri.parse('$databaseUrl/users.json');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> userData = json.decode(response.body);

        // Convert the JSON data to a list of User objects
        final List<User> userList =
            userData.values.map((userJson) => User.fromJson(userJson)).toList();

        // Sort the list by score in increasing order
        userList.sort((a, b) => b.score.compareTo(a.score));

        return userList;
      } else {
        // Handle the error when the GET request is not successful
        throw Exception('Failed to load users');
      }
    } catch (error) {
      // Handle any errors that occur during the request
      throw Exception('Error: $error');
    }
  }

  Future<bool> addUserToDatabase(User user) async {
    Future<bool> incrementUserScore(String userId, int incrementAmount) async {
      const databaseUrl = 'https://funwitcode-default-rtdb.firebaseio.com/';
      final url = Uri.parse('$databaseUrl/users/$userId.json');

      try {
        final response = await http.patch(
          // Use patch to update a specific field without sending the entire object
          url,
          body: json.encode({"score": incrementAmount}),
        );

        if (response.statusCode == 200) {
          // If the PATCH request is successful (status code 200), return true
          print(response.body);
          print(response.statusCode);
          return true;
        } else {
          print(response.body);
          print(response.statusCode);
          // If the PATCH request is not successful, return false
          return false;
        }
      } catch (error) {
        // If an error occurs during the request, return false
        print(error);
        return false;
      }
    }

    const databaseUrl = 'https://funwitcode-default-rtdb.firebaseio.com/';
    final url = Uri.parse('$databaseUrl/users/${user.mailId}.json');

    try {
      final response = await http.put(
        // Use put instead of post for updates
        url,
        body: json.encode(user.toJson()),
      );

      if (response.statusCode == 200) {
        // If the PUT request is successful (status code 200), return true
        print(response.body);
        print(response.statusCode);
        return true;
      } else {
        print(response.body);
        print(response.statusCode);
        // If the PUT request is not successful, return false
        return false;
      }
    } catch (error) {
      // If an error occurs during the request, return false
      print(error);
      return false;
    }
  }

  Future<List> isUserFoundInDatabase(String id, String password) async {
    const databaseUrl = 'https://funwitcode-default-rtdb.firebaseio.com/';
    final url = Uri.parse('$databaseUrl/users/$id.json');

    try {
      final response = await http.get(url);
      print(response.body);

      if (response.statusCode == 200) {
        // If the response is successful (status code 200), parse the data
        final data = json.decode(response.body);
        print(password);
        print(data['password']);
        if (data != null && data['password'] == password) {
          print("enterting block ");
          String mailId = data['mailId'];
          String name = data['name'];
          int score = data['score'];
          String password = data['password'];
          return [true, name, mailId, score, password];
        } else {
          // If the user is not found or the password doesn't match, return false
          return [false];
        }
      } else {
        // If the response is not successful, return false
        return [false];
      }
    } catch (error) {
      // If an error occurs during the request, return false

      return [false];
    }
  }

  // Future<List<User>> fetchPostsFromDatabase({
  //   String? id,
  //    String? password,

  // }) async {

  //   const databaseUrl =
  //       'https://announcements-19b1f-default-rtdb.firebaseio.com/';

  //   Map<String, String> queryParams = {};
  //   queryParams['YrSeBr'] = YrSeBr.toString();
  //   final url = Uri.parse('$databaseUrl/posts.json')
  //       .replace(queryParameters: queryParams);

  //   try {
  //     final response = await http.get(url);

  //     if (response.statusCode == 200) {
  //       // If the GET request is successful (status code 200), parse the data
  //       final Map<String, dynamic> data = json.decode(response.body);

  //       final List<User> posts = [];
  //       print(response.body);
  //       print(response.statusCode);
  //       print('gono');

  //       data.forEach((postId, postData) {
  //         // Filter the posts based on YrSeBr
  //         if (postData['YrSeBr'] == YrSeBr) {
  //           // Convert each entry to a Post object and add to the list
  //           posts.add(User.fromJson(postData));
  //         }
  //       });
  //       return posts;
  //     } else {
  //       print(response.body);
  //       print(response.statusCode);
  //       print('yono');
  //       // If the GET request is not successful, return an empty list
  //       return [];
  //     }
  //   } catch (error) {
  //     print(error);
  //     print('sono');

  //     // If an error occurs during the request, return an empty list
  //     return [];
  //   }
  // }

  Future<List<User>> fetchPostsFromDatabaseForAdmin(String postedBy) async {
    const databaseUrl = 'https://funwitcode-default-rtdb.firebaseio.com/';

    Map<String, String> queryParams = {};
    queryParams['postedBy'] = postedBy.toString();
    final url = Uri.parse('$databaseUrl/posts.json')
        .replace(queryParameters: queryParams);

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // If the GET request is successful (status code 200), parse the data
        final Map<String, dynamic> data = json.decode(response.body);

        final List<User> posts = [];
        print(response.body);
        print(response.statusCode);
        print('gono');

        data.forEach((postId, postData) {
          // Filter the posts based on YrSeBr
          if (postData['postedBy'] == postedBy) {
            // Convert each entry to a Post object and add to the list
            posts.add(User.fromJson(postData));
          }
        });
        return posts;
      } else {
        print(response.body);
        print(response.statusCode);
        print('yono');
        // If the GET request is not successful, return an empty list
        return [];
      }
    } catch (error) {
      print(error);
      print('sono');

      // If an error occurs during the request, return an empty list
      return [];
    }
  }

  // Future<bool> deletePostFromDatabase(String id) async {
  //   const databaseUrl =
  //       'https://announcements-19b1f-default-rtdb.firebaseio.com/';
  //   Map<String, String> queryParams = {};
  //   queryParams['id'] = id.toString();
  //   final url = Uri.parse('$databaseUrl/posts.json')
  //       .replace(queryParameters: queryParams);

  //   try {
  //     final response = await http.delete(url);

  //     if (response.statusCode == 200) {
  //       // If the DELETE request is successful (status code 200), return true
  //       print(response.body);
  //       print(response.statusCode);
  //       return true;
  //     } else {
  //       print(response.body);
  //       print(response.statusCode);
  //       // If the DELETE request is not successful, return false
  //       return false;
  //     }
  //   } catch (error) {
  //     // If an error occurs during the request, return false
  //     print(error);
  //     return false;
  //   }
  // }
  Future<bool> deletePostFromDatabase(String postId) async {
    const databaseUrl = 'https://funwitcode-default-rtdb.firebaseio.com/';
    final url = Uri.parse('$databaseUrl/posts.json');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        if (responseData is Map) {
          String? keyToDelete;
          responseData.forEach((key, value) {
            if (value['id'] == postId) {
              keyToDelete = key;
            }
          });

          if (keyToDelete != null) {
            final deleteUrl = Uri.parse('$databaseUrl/posts/$keyToDelete.json');
            final deleteResponse = await http.delete(deleteUrl);

            if (deleteResponse.statusCode == 200) {
              // If the DELETE request is successful (status code 200), return true
              print('Post deleted successfully.');
              return true;
            } else {
              print(
                  'Failed to delete the post. Status code: ${deleteResponse.statusCode}');
              return false;
            }
          } else {
            print('Post with ID $postId not found.');
            return false;
          }
        }
      }

      print('Failed to fetch posts. Status code: ${response.statusCode}');
      return false;
    } catch (error) {
      // If an error occurs during the request, return false
      print(error);
      return false;
    }
  }
}
