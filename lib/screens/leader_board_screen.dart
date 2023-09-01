import 'package:flutter/material.dart';

class LeaderBoardScreen extends StatelessWidget {
  final List<UserForLeaderBoard> users = [
    UserForLeaderBoard(name: 'John Doe', email: 'johndoe@gmail.com'),
    UserForLeaderBoard(name: 'Jane Doe', email: 'janedoe@gmail.com'),
    UserForLeaderBoard(name: 'Peter Smith', email: 'petersmith@gmail.com'),
    UserForLeaderBoard(name: 'Mary Johnson', email: 'maryjohnson@gmail.com'),
    UserForLeaderBoard(
        name: 'David Williams', email: 'davidwilliams@gmail.com'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          height: users.length * 200,
          child: Column(
            children: [
              Image.asset('./lib/assets/prizeimage.png'),
              Expanded(
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: users.length,
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
                        trailing: Text("Score 31"),
                        subtitle: Text(
                          users[index].email,
                          key: Key(index.toString()),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w400),
                        ),
                        title: Text(
                          users[index].name,
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
