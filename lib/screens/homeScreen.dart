import 'package:flutter/material.dart';
import 'package:funwitcode/models/user.dart';
import 'package:funwitcode/screens/authformstudent.dart';
import 'package:funwitcode/screens/profile.dart';
import 'package:provider/provider.dart';

import '../widgets.dart/card.dart';
import 'leader_board_screen.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  User user;
  HomeScreen(this.user);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    // var hi = MediaQuery.of(context).size.height;
    var wi = MediaQuery.of(context).size.width;

    return MaterialApp(
      home: Scaffold(
        key: _scaffoldState,
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 27, 67, 77),
                ),
                child: Text(' '),
              ),
              ListTile(
                leading: Icon(
                  Icons.logout,
                ),
                title: const Text('Logout'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => AuthFormStudent()),
                  );
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.shield,
                ),
                title: const Text('LeaderBoard'),
                onTap: () async {
                  final users = await Provider.of<Users>(context, listen: false)
                      .getUsersOrderedByScore();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => LeaderBoardScreen(users)),
                  );
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.person,
                ),
                title: const Text('Profile'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(
                        User(
                          mailId: widget.user.mailId,
                          name: widget.user.name,
                          password: widget.user.password,
                          score: widget.user.score,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        // floatingActionButton: FloatingActionButton.extended(
        //   icon: Icon(Icons.add),
        //   backgroundColor: const Color.fromARGB(255, 27, 67, 77),
        //   label: const Text(
        //     'New Post',
        //     style: TextStyle(color: Colors.white, fontSize: 20),
        //   ),
        //   onPressed: () {
        //     // Navigator.
        // (
        //     //   context,
        //     //   MaterialPageRoute(
        //     //       builder: (context) => NewPostsScreen(
        //     //           widget.postedBy, widget.role, widget.post)),
        //     // );
        //   },
        // ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 0, left: 10),
                      height: 180,
                      width: wi,
                      color: const Color.fromARGB(255, 27, 67, 77),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              _scaffoldState.currentState?.openDrawer();
                            },
                            child: const Tooltip(
                              message: 'Opens drawer',
                              child: Icon(
                                Icons.menu,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                          ),
                          const SizedBox(
                              width:
                                  10), // Add a small space between the icon and the text
                          const Text(
                            '  Courses',
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top:
                          150, // Position the second container 150 pixels from the top

                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25.0),
                            topRight: Radius.circular(25.0),
                          ),
                        ),
                        height: 50,
                        width: wi,
                        child: Center(child: Text(' ')),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                CardForPost(
                  User(
                    mailId: widget.user.mailId,
                    name: widget.user.name,
                    password: widget.user.password,
                    score: widget.user.score,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
