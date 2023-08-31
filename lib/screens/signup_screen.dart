import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController? usernameController1 = TextEditingController(); // name
  TextEditingController? usernameController2 = TextEditingController(); // mail
  TextEditingController? usernameController3 =
      TextEditingController(); // password

  @override
  void dispose() {
    usernameController1!.dispose();
    usernameController2!.dispose();
    usernameController3!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var hi = MediaQuery.of(context).size.height;
    var wi = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 60, left: 30),
                        height: 200,
                        width: wi,
                        color: const Color.fromARGB(255, 27, 67, 77),
                        child: Text(
                          'Hello,',
                          style: TextStyle(
                              fontSize: 45,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ),
                      Positioned(
                        top:
                            160, // Position the second container 150 pixels from the top

                        child: Container(
                          decoration: BoxDecoration(
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
                  Container(
                    height: hi * 0.15,
                  ),
                  Container(
                    height: hi * 0.1,
                    width: wi * 0.88,
                    margin: EdgeInsets.fromLTRB(wi * 0.05, 10, wi * 0.05, 0),
                    child: TextFormField(
                      controller: usernameController1,
                      decoration: InputDecoration(
                        labelText: 'Name',
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
                  Container(
                    height: hi * 0.1,
                    width: wi * 0.88,
                    margin: EdgeInsets.fromLTRB(wi * 0.05, 10, wi * 0.05, 0),
                    child: TextFormField(
                      controller: usernameController2,
                      decoration: InputDecoration(
                        labelText: 'Mail id',
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
                          return 'Please enter mail id .';
                        }
                        // Add additional validation rules as needed
                        return null; // Return null if the value is valid
                      },
                    ),
                  ),
                  Container(
                    height: hi * 0.1,
                    width: wi * 0.88,
                    margin: EdgeInsets.fromLTRB(wi * 0.05, 10, wi * 0.05, 0),
                    child: TextFormField(
                      controller: usernameController3,
                      decoration: InputDecoration(
                        labelText: 'Password',
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
                          return 'Please enter a password .';
                        }
                        // Add additional validation rules as needed
                        return null; // Return null if the value is valid
                      },
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.09,
                    width: MediaQuery.of(context).size.width * 0.82,
                    margin: const EdgeInsets.all(5),
                    child: ElevatedButton(
                      onPressed: () async {
                        // if user created pushreplacement the login or signup option page

                        // if (usernameController1?.text.toString().trim() ==
                        //         null ||
                        //     _selectedOptionForYear == null ||
                        //     _selectedOptionForBranch == null ||
                        //     _selectedOptionForSem == null) {
                        //   return;
                        // }

                        // int year =
                        //     optionsForYear.indexOf(_selectedOptionForYear!) + 1;
                        // int branch = optionsForBranch
                        //         .indexOf(_selectedOptionForBranch!) +
                        //     1;
                        // int sem =
                        //     optionsForSem.indexOf(_selectedOptionForSem!) + 1;
                        // print(year);

                        // print(branch);

                        // print(sem);
                        // List allPosts =
                        //     await Provider.of<Posts>(context, listen: false)
                        //         .fetchPostsFromDatabase(
                        //             brCode: branch, sem: sem, year: year);
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) =>
                        //           StudentPostsScreen(allPosts)),
                        // );
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
                      child: const Text(
                        'Proceed',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
