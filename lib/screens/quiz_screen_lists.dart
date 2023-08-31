import 'package:flutter/material.dart';

class QuizPageLists extends StatefulWidget {
  @override
  _QuizPageListsState createState() => _QuizPageListsState();
}

class _QuizPageListsState extends State<QuizPageLists> {
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
      'hint':
          """ Explanation: A variable in Python is a named container that stores data values. It allows you to refer to data by a name rather than the actual value. This answer accurately describes the purpose of a variable in Python.""",
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
      'hint':
          """ Explanation: Variable names in Python can start with a letter (a-z, A-Z) or an underscore (_), followed by letters, digits (0-9), or underscores. The other options (`123variable`, `my-variable`, `class`) do not follow these rules for valid variable names. """,
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
      'hint':
          """ Explanation: The `type()` function in Python is used to determine the data type of a given object or variable. It returns the class type of an object, which helps in understanding the type of data being stored. """,
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
      'hint':
          """ Explanation: The scope of a variable in Python defines where the variable can be accessed or used. Variables can have local (limited to a specific function or block) or global (accessible throughout the entire program) scope.
 """,
    },
    {
      'question':
          'Which data type is used to store a single character in Python?',
      'options': ['a) char', 'b) string', 'c) character', 'd) charact'],
      'correctAnswerIndex': 1,
      'hint':
          """   Explanation: In Python, a single character is represented using a string with a length of 1. While there's no separate character data type like some other languages (e.g., C++), strings can be used to store individual characters.""",
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
      'hint':
          """Explanation: You can assign multiple values to multiple variables in one line by separating the values with commas and using the `=` operator for assignment. For example: `x, y, z = 1, 2, 3`.
 """,
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
      'hint':
          """  Explanation: If you try to access a variable that hasn't been assigned a value, Python raises a `NameError` indicating that the variable is not defined in the current scope.
 """,
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
      'hint':
          """  Explanation: The `id()` function in Python returns the memory address (a unique identifier) of an object, which can be useful to identify whether two variables refer to the same object in memory.
 """,
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
      'hint':
          """  Explanation: The `str()` function in Python is used to convert values to strings. So, `str(x)` converts an integer variable `x` to a string. """,
    },
    {
      'question': """Which of the following is a mutable data type in Python?
    "Last question , exit manually" 
      """,
      'options': ['a) int', 'b) str', 'c) tuple', 'd) list'],
      'correctAnswerIndex': 3,
      'hint':
          """  Explanation: A list is a mutable data type in Python. This means that you can modify its contents after it has been created. The other options (`int`, `str`, `tuple`) are immutable data types, meaning their values cannot be changed once they are created.

""",
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

  void _openBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 20, top: 30),
              color: const Color.fromARGB(255, 255, 247, 247),
              child: Text(
                'Hint : ',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                textAlign: TextAlign.start,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 50),
              color: const Color.fromARGB(255, 255, 247, 247),
              child: Text(
                '${variable[currentQuestionIndex]['hint']}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                textAlign: TextAlign.start,
              ),
            ),
          ],
        );
      },
    );
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
                _openBottomSheet(context);
              },
              child: const Row(
                mainAxisSize: MainAxisSize.min, // Align items in a row
                children: [
                  Text(
                    " Hint",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  Icon(
                    Icons.lightbulb,
                    color: Colors.black,
                    size: 20,
                  ),
                ],
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
