import 'package:flutter/material.dart';
import 'package:funwitcode/screens/authformstudent.dart';
import 'package:funwitcode/screens/profile.dart';

import 'chapter_screen.dart';
import 'leader_board_screen.dart';

// ignore: must_be_immutable
class PythonChaptersListScreen extends StatefulWidget {
  @override
  State<PythonChaptersListScreen> createState() =>
      _PythonChaptersListScreenState();
}

class _PythonChaptersListScreenState extends State<PythonChaptersListScreen> {
  GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  final List<String> texts = [
    " 1.Variables",
    " 2.Functions",
    " 3.Conditionals",
    " 4.Loops",
    " 5.Lists",
    " 6.Dictionaries",
  ];

  @override
  Widget build(BuildContext context) {
    // var hi = MediaQuery.of(context).size.height;a
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
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => AuthFormStudent()),
                  );
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.shield,
                ),
                title: const Text('LeaderBoard'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => LeaderBoardScreen()),
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
                    MaterialPageRoute(builder: (context) => ProfilePage()),
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
        //     // Navigator.push(
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
                            '  Chapters :',
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
                // InkWell(
                //   child: CardForPost(),
                //   onTap: () {
                //     //nothing is there maaaaa
                //   },
                // ),
                Container(
                  height: 700,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: texts.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 70,
                        padding: EdgeInsets.only(top: 10, left: 10),
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
                          title: Text(
                            texts[index],
                            key: Key(index.toString()),
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w400),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChapterScreen(index)),
                            );
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
      ),
    );
  }
}
