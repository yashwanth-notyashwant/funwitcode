import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';

class QuizPageConditionals extends StatefulWidget {
  int score;
  String id;
  QuizPageConditionals(this.score, this.id);
  @override
  _QuizPageConditionalsState createState() => _QuizPageConditionalsState();
}

class _QuizPageConditionalsState extends State<QuizPageConditionals> {
  int currentQuestionIndex = 0;
  List<Map<String, dynamic>> variable = [
    {
      'question': 'What is a conditional statement in Python?',
      'options': [
        'a) A statement that always executes',
        'b) A statement that performs a specific task',
        'c) A statement that allows you to make decisions in your code',
        'd) A statement used for mathematical operations'
      ],
      'correctAnswerIndex': 2,
      'hint':
          """ Explanation: A conditional statement in Python is used to make decisions in your code based on certain conditions. It allows your program to take different paths and execute different code blocks depending on whether the specified condition is true or false.
 """,
    },
    {
      'question':
          'Which keyword is used to define a simple if statement in Python?',
      'options': ['a) for', 'b) if', 'c) while', 'd) else'],
      'correctAnswerIndex': 1,
      'hint':
          """ Explanation: In Python, you use the `if` keyword to define a simple conditional statement. The code block under the `if` statement is executed only if the specified condition is true.
 """,
    },
    {
      'question': 'What is the purpose of the else statement in Python?',
      'options': [
        'a) To define a loop',
        'b) To indicate the end of a function',
        'c) To provide an alternative code block when the if condition is false',
        'd) To create a new object of a class'
      ],
      'correctAnswerIndex': 2,
      'hint':
          """ Explanation: The `else` statement in Python is used to provide an alternative code block that is executed when the condition specified in the preceding `if` statement is false. It allows you to handle different scenarios in your code.
 """,
    },
    {
      'question':
          'Which of the following is a valid Python comparison operator?',
      'options': ['a) **', 'b) <>', 'c) !=', 'd) &='],
      'correctAnswerIndex': 2,
      'hint':
          """ Explanation: The `!=` operator is a valid Python comparison operator used to check if two values are not equal to each other. It is used in conditional expressions to compare values.
 """,
    },
    {
      'question': 'What is the purpose of the elif statement in Python?',
      'options': [
        'a) To define a loop',
        'b) To indicate the end of a function',
        'c) To provide an additional condition to check when the if condition is false',
        'd) To create a new object of a class'
      ],
      'correctAnswerIndex': 2,
      'hint':
          """ Explanation: The `elif` statement in Python is used to provide an additional condition to check when the preceding `if` condition is false. It allows you to handle multiple conditions and execute different code blocks based on the first true condition encountered.
 """,
    },
    {
      'question': 'What is a Boolean expression in Python?',
      'options': [
        'a) A type of loop',
        'b) An expression that evaluates to either True or False',
        'c) A built-in Python function',
        'd) A method to define class inheritance'
      ],
      'correctAnswerIndex': 1,
      'hint':
          """ Explanation: A Boolean expression in Python is an expression that evaluates to either `True` or `False`. It is commonly used in conditional statements to make decisions based on the truth value of the expression.
 """,
    },
    {
      'question':
          'Which keyword is used to check if a value is in a list in Python?',
      'options': ['a) include', 'b) in', 'c) exists', 'd) contains'],
      'correctAnswerIndex': 1,
      'hint':
          """ Explanation: In Python, you use the `in` keyword to check if a value is present in a list or other iterable. It is often used in conditional statements to perform actions based on the presence or absence of a value in a collection.
 """,
    },
    {
      'question':
          'What is the purpose of the ternary conditional expression in Python?',
      'options': [
        'a) To define a loop',
        'b) To provide an alternative code block when the if condition is false',
        'c) To create a new object of a class',
        'd) To write a one-line if-else statement'
      ],
      'correctAnswerIndex': 3,
      'hint':
          """ Explanation: The ternary conditional expression in Python is used to write a one-line if-else statement. It provides a compact way to assign a value to a variable based on a condition.
 """,
    },
    {
      'question': 'What is the purpose of the pass statement in Python?',
      'options': [
        'a) To define a loop',
        'b) To indicate the end of a function',
        'c) To provide a placeholder for code that does nothing',
        'd) To create a new object of a class'
      ],
      'correctAnswerIndex': 2,
      'hint':
          """ Explanation: The `pass` statement in Python is used to provide a placeholder for code that does nothing. It is often used when you need a syntactically correct block of code but don't want to add any functionality yet.
 """,
    },
    {
      'question': 'What is the purpose of the or operator (||) in Python?',
      'options': [
        'a) To combine two or more conditions and return True if at least one is true',
        'b) To perform a bitwise OR operation',
        'c) To check if two values are equal',
        'd) To create a new object of a class'
      ],
      'correctAnswerIndex': 0,
      'hint':
          """ Explanation: The `or` operator (`||` in some other programming languages) in Python is used to combine two or more conditions and return `True` if at least one of the conditions is true. It is often used in conditional expressions for logical OR operations.
 """,
    },
    // Add more questions and answers here
  ];

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
    void checkAnswer(int selectedOptionIndex, BuildContext context) async {
      int correctAnswerIndex =
          variable[currentQuestionIndex]['correctAnswerIndex'];
      if (selectedOptionIndex == correctAnswerIndex) {
        // Handle correct answer
        print('Correct answer!');
        // call the function if yes then go forward
        final isdone =
            await Provider.of<Users>(context, listen: false).incrementUserScore(
          widget.id,
        );
        if (isdone == true) {
          setState(() {
            if (currentQuestionIndex < variable.length - 1) {
              currentQuestionIndex++;
            }
          });
        } else
          return;
      } else {
        // Handle wrong answer
        print('Wrong answer!');
        _openBottomSheet(context);
        //open the scaffold bottom sheet
      }
      // Move to the next question
    }

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
                    onPressed: () => checkAnswer(index, context),
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
