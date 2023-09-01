import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';

class QuizPageLoops extends StatefulWidget {
  int score;
  String id;
  QuizPageLoops(this.score, this.id);
  @override
  _QuizPageLoopsState createState() => _QuizPageLoopsState();
}

class _QuizPageLoopsState extends State<QuizPageLoops> {
  int currentQuestionIndex = 0;
  List<Map<String, dynamic>> variable = [
    {
      'question': 'What is a loop in Python?',
      'options': [
        'a) A reserved keyword',
        'b) A named block of code that performs a specific task',
        'c) A mathematical operation',
        'd) A programming construct for repeating tasks'
      ],
      'correctAnswerIndex': 3,
      'hint':
          """ Explanation: A loop in Python is a programming construct that allows you to repeat a block of code multiple times. It is used for automating repetitive tasks and iterating over data structures.
 """,
    },
    {
      'question': 'How do you define a "for" loop in Python?',
      'options': [
        'a) for loop_name:',
        'b) loop_name = for',
        'c) for variable in iterable:',
        'd) define loop_name():'
      ],
      'correctAnswerIndex': 2,
      'hint':
          """ Explanation: To define a "for" loop in Python, you use the `for` keyword followed by a variable, the `in` keyword, and an iterable (e.g., a list). The loop iterates over the elements of the iterable.
 """,
    },
    {
      'question': 'What is the purpose of a "while" loop?',
      'options': [
        'a) To define a function',
        'b) To print the loop\'s output',
        'c) To repeat a block of code as long as a condition is true',
        'd) To specify the loop\'s arguments'
      ],
      'correctAnswerIndex': 2,
      'hint':
          """ Explanation: A "while" loop in Python is used to repeat a block of code as long as a specified condition is true. It continues iterating as long as the condition remains true.
 """,
    },
    {
      'question': 'What is the syntax for a "for" loop?',
      'options': [
        'a) for (initialization; condition; increment):',
        'b) for variable in iterable:',
        'c) for loop_name:',
        'd) for variable from 1 to 10:'
      ],
      'correctAnswerIndex': 1,
      'hint':
          """ Explanation: The syntax for a "for" loop in Python is to use the `for` keyword followed by a variable, the `in` keyword, and an iterable. This iterable can be a list, tuple, string, or other iterable data structures.
 """,
    },
    {
      'question': 'What is the purpose of the "range()" function in loops?',
      'options': [
        'a) To create a new list with modified elements',
        'b) To print the elements of a list',
        'c) To generate a sequence of numbers for iterating in loops',
        'd) To remove elements from a list'
      ],
      'correctAnswerIndex': 2,
      'hint':
          """ Explanation: The "range()" function in Python is used to generate a sequence of numbers, typically used for iterating in loops. It allows you to create a range of numbers based on a start, stop, and step value.
 """,
    },
    {
      'question': 'What is an infinite loop?',
      'options': [
        'a) A loop that runs only once',
        'b) A loop that never stops executing',
        'c) A loop with multiple nested loops',
        'd) A loop that executes for a specific duration'
      ],
      'correctAnswerIndex': 1,
      'hint':
          """ Explanation: An infinite loop is a loop that never stops executing unless interrupted externally. It is typically caused by a condition that always evaluates to true.
 """,
    },
    {
      'question': 'What is the purpose of the "break" statement in a loop?',
      'options': [
        'a) To define the loop',
        'b) To exit the loop prematurely',
        'c) To continue to the next iteration of the loop',
        'd) To print the loop\'s output'
      ],
      'correctAnswerIndex': 1,
      'hint':
          """ Explanation: The "break" statement in a loop is used to exit the loop prematurely. It allows you to terminate the loop based on a certain condition, even if the loop's normal exit condition is not met.
 """,
    },
    {
      'question': 'What is the purpose of the "continue" statement in a loop?',
      'options': [
        'a) To define a function',
        'b) To exit the loop prematurely',
        'c) To skip the current iteration and continue to the next',
        'd) To specify the loop\'s arguments'
      ],
      'correctAnswerIndex': 2,
      'hint':
          """ Explanation: The "continue" statement in a loop is used to skip the current iteration and continue to the next iteration of the loop. It allows you to skip specific iterations based on a condition.
 """,
    },
    {
      'question': 'What is a nested loop?',
      'options': [
        'a) A loop with a complex condition',
        'b) A loop that only runs once',
        'c) A loop inside another loop',
        'd) A loop with a large number of iterations'
      ],
      'correctAnswerIndex': 2,
      'hint':
          """ Explanation: A nested loop is a loop that is placed inside another loop. It allows you to perform more complex iterations and is often used for working with multi-dimensional data structures.
 """,
    },
    {
      'question': 'What is the purpose of the "else" block in a "for" loop?',
      'options': [
        'a) To define the loop',
        'b) To execute when an exception occurs in the loop',
        'c) To execute after the loop has completed normally',
        'd) To specify the loop\'s arguments'
      ],
      'correctAnswerIndex': 2,
      'hint':
          """ Explanation: The "else" block in a "for" loop is executed after the loop has completed normally, without being interrupted by a "break" statement. It is used for code that should run after the loop has finished.
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
