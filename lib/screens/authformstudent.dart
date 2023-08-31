import 'package:flutter/material.dart';

import 'homeScreen.dart';

class AuthFormStudent extends StatefulWidget {
  const AuthFormStudent({super.key});

  @override
  State<AuthFormStudent> createState() => _AuthFormStudentState();
}

class _AuthFormStudentState extends State<AuthFormStudent> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> formKey1 = GlobalKey<FormState>();

  TextEditingController usernameController1 = TextEditingController();
  TextEditingController usernameController2 = TextEditingController();

  @override
  void dispose() {
    usernameController1.dispose();
    usernameController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var hi = MediaQuery.of(context).size.height;
    var wi = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: hi * 0.1,
              ),
              Container(
                margin: EdgeInsets.only(left: 0),
                child: Text(
                  "Welcome,",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 0),
                child: Text(
                  "Learner",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                height: hi * 0.4,
              ),
              Container(
                height: hi * 0.1,
                width: wi * 0.8,
                margin: EdgeInsets.fromLTRB(wi * 0.1, 10, wi * 0.1, 0),
                child: Form(
                  key: formKey,
                  child: TextFormField(
                    controller: usernameController1,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      labelStyle: const TextStyle(
                        color: const Color.fromARGB(255, 27, 67, 77),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24.0),
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 27, 67, 77),
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a Username .';
                      }
                      // Add additional validation rules as needed
                      return null; // Return null if the value is valid
                    },
                  ),
                ),
              ),
              Container(
                height: hi * 0.1,
                width: wi * 0.8,
                margin: EdgeInsets.fromLTRB(wi * 0.1, 0, wi * 0.1, 0),
                child: Form(
                  key: formKey1,
                  child: TextFormField(
                    controller: usernameController2,
                    decoration: InputDecoration(
                      focusColor: const Color.fromARGB(255, 27, 67, 77),
                      prefixIconColor: Colors.black,
                      labelText: 'Password',
                      labelStyle: const TextStyle(
                        color: const Color.fromARGB(255, 27, 67, 77),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 27, 67, 77),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24.0),
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 27, 67, 77),
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a password.';
                      }
                      // Add additional validation rules as needed
                      return null; // Return null if the value is valid
                    },
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width * 0.8,
                margin: const EdgeInsets.all(5),
                child: ElevatedButton(
                  onPressed: () async {
                    // print(
                    //   usernameController1.text.trim() +
                    //       usernameController2.text.trim(),
                    // );
                    // List userObtainded =
                    //     await Provider.of<Admins>(context, listen: false)
                    //         .isUserFoundInDatabase(
                    //   usernameController1.text.trim().toString(),
                    //   usernameController2.text.trim().toString(),
                    // );
                    // print(userObtainded[0]);

                    // if (userObtainded[0] == true) {
                    //   //load all his posts and send to AdminPostsScreen
                    //   List allPosts =
                    //       await Provider.of<Posts>(context, listen: false)
                    //           .fetchPostsFromDatabaseForAdmin(userObtainded[1]);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                    //     // posted by and roles in order
                    //   );
                    // } else {
                    //   return;
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 27, 67, 77),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(25.0),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    textStyle: const TextStyle(fontSize: 20.0),
                  ),
                  child: const Text('Login'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
