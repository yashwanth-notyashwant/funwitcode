import 'package:flutter/material.dart';

import '../models/user.dart';

class LeaderBoardScreen extends StatelessWidget {
  // final List<UserForLeaderBoard> users = [
  //   UserForLeaderBoard(name: 'John Doe', email: 'johndoe@gmail.com'),
  //   UserForLeaderBoard(name: 'Jane Doe', email: 'janedoe@gmail.com'),
  //   UserForLeaderBoard(name: 'Peter Smith', email: 'petersmith@gmail.com'),
  //   UserForLeaderBoard(name: 'Mary Johnson', email: 'maryjohnson@gmail.com'),
  //   UserForLeaderBoard(
  //       name: 'David Williams', email: 'davidwilliams@gmail.com'),
  // ];
  final List<User> allUsers;
  LeaderBoardScreen(this.allUsers);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          height: 500 + allUsers.length * 200,
          child: Column(
            children: [
              Image.asset('./lib/assets/prizeimage.png'),
              Expanded(
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: allUsers.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 70,
                      padding: EdgeInsets.only(top: 5, left: 10),
                      margin: EdgeInsets.all(
                          10.0), // Adding margin between ListTiles
                      decoration: BoxDecoration(
                        color: Colors.white, // Background color
                        borderRadius:
                            BorderRadius.circular(20.0), // Curved borders
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 3,
                            offset: Offset(0, 2), // Shadow offset
                          ),
                        ],
                      ),
                      child: ListTile(
                        trailing:
                            Text("Score :" + allUsers[index].score.toString()),
                        subtitle: Text(
                          allUsers[index].mailId,
                          key: Key(index.toString()),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w400),
                        ),
                        title: Text(
                          allUsers[index].name,
                          key: Key(index.toString()),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w400),
                        ),
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => ChapterScreen(index)),
                          // );
                          print(index + 1);
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserForLeaderBoard {
  final String name;
  final String email;

  const UserForLeaderBoard({required this.name, required this.email});
}
