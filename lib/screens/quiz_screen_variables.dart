import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentQuestionIndex = 0;
  List<Map<String, dynamic>> variable = [
    {
      'question': 'What is a variable in Python?',
      'options': [
        'a) A reserved keyword',
        'b) A named container for storing data values',
        'c) A mathematical operation',
        'd) A programming function'
      ],
      'correctAnswerIndex': 1,
    },
    {
      'question': 'Which of the following is a valid variable name in Python?',
      'options': [
        'a) 123variable',
        'b) my-variable',
        'c) _my_variable',
        'd) class'
      ],
      'correctAnswerIndex': 2,
    },
    {
      'question': 'What is the purpose of the type() function in Python?',
      'options': [
        'a) To declare a new variable',
        'b) To print the variable\'s value',
        'c) To check the data type of a variable',
        'd) To convert a variable to a string'
      ],
      'correctAnswerIndex': 2,
    },
    {
      'question': 'What is the scope of a variable in Python?',
      'options': [
        'a) The number of times a variable is used',
        'b) The area of code where a variable can be accessed',
        'c) The length of a variable\'s name',
        'd) The size of memory allocated to a variable'
      ],
      'correctAnswerIndex': 1,
    },
    {
      'question':
          'Which data type is used to store a single character in Python?',
      'options': ['a) char', 'b) string', 'c) character', 'd) charact'],
      'correctAnswerIndex': 1,
    },
    {
      'question':
          'In Python, how can you assign multiple values to multiple variables in one line?',
      'options': [
        'a) Use the multi_assign() function',
        'b) Use the assign keyword',
        'c) Use the = operator and separate values with commas',
        'd) It\'s not possible to assign multiple values in one line'
      ],
      'correctAnswerIndex': 2,
    },
    {
      'question':
          'What happens if you try to access a variable that hasn\'t been assigned a value?',
      'options': [
        'a) It raises a syntax error',
        'b) It returns an empty string',
        'c) It raises a NameError indicating the variable is not defined',
        'd) It returns the value None'
      ],
      'correctAnswerIndex': 2,
    },
    {
      'question': 'What does the id() function in Python return?',
      'options': [
        'a) The memory address of a variable',
        'b) The data type of a variable',
        'c) The value of a variable',
        'd) The name of a variable'
      ],
      'correctAnswerIndex': 0,
    },
    {
      'question':
          'What is the correct way to convert an integer variable x to a string in Python?',
      'options': [
        'a) str(x)',
        'b) string(x)',
        'c) convert(x, str)',
        'd) x.str()'
      ],
      'correctAnswerIndex': 0,
    },
    {
      'question': """Which of the following is a mutable data type in Python?
    "Last question , exit manually" 
      """,
      'options': ['a) int', 'b) str', 'c) tuple', 'd) list'],
      'correctAnswerIndex': 3,
    },
    // Add more questions and answers here
  ];

  void checkAnswer(int selectedOptionIndex) {
    int correctAnswerIndex =
        variable[currentQuestionIndex]['correctAnswerIndex'];
    if (selectedOptionIndex == correctAnswerIndex) {
      // Handle correct answer
      setState(() {
        if (currentQuestionIndex < variable.length - 1) {
          currentQuestionIndex++;
        }
      });
      print('Correct answer!');
    } else {
      // Handle wrong answer
      print('Wrong answer!');
      //open the scaffold bottom sheet
    }
    // Move to the next question
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 182, 222, 255),
              borderRadius: BorderRadius.circular(20),
            ),
            margin: EdgeInsets.only(right: 20, top: 10),
            child: TextButton(
              onPressed: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(builder: (context) => QuizPage()),
                // );
                // push to quiz page
              },
              child: Text(
                " Skip >>",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              margin: EdgeInsets.only(left: 7, right: 5),
              child: Text(
                variable[currentQuestionIndex]['question'],
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
              ),
            ),
            SizedBox(height: 30),
            Column(
              children: List.generate(
                variable[currentQuestionIndex]['options'].length,
                (index) => Container(
                  // height: 60,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 182, 222, 255),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(bottom: 5, left: 10, right: 10),
                  child: TextButton(
                    onPressed: () => checkAnswer(index),
                    child: Text(
                      variable[currentQuestionIndex]['options'][index],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          color: Colors.black),
                    ), //add some styles
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
