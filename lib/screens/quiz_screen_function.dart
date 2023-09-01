import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';

class QuizPageFunction extends StatefulWidget {
  int score;
  String id;
  QuizPageFunction(this.score, this.id);
  @override
  _QuizPageFunctionState createState() => _QuizPageFunctionState();
}

class _QuizPageFunctionState extends State<QuizPageFunction> {
  int currentQuestionIndex = 0;
  List<Map<String, dynamic>> variable = [
    {
      'question': 'What is a function in Python?',
      'options': [
        'a) A reserved keyword',
        'b) A named block of code that performs a specific task',
        'c) A mathematical operation',
        'd) A programming function'
      ],
      'correctAnswerIndex': 1,
      'hint':
          """ Explanation: A function in Python is a named block of code that performs a specific task. It allows you to organize code into reusable and modular components, making your code easier to understand and maintain.
 """,
    },
    {
      'question': 'How do you define a function in Python?',
      'options': [
        'a) def function_name:',
        'b) function_name:',
        'c) define function_name():',
        'd) create function_name():'
      ],
      'correctAnswerIndex': 0,
      'hint':
          """ Explanation: To define a function in Python, you use the `def` keyword followed by the function name and parentheses. The function name should follow valid variable naming rules, and the colon indicates the start of the function's block of code.
 """,
    },
    {
      'question': 'What is the purpose of the return statement in a function?',
      'options': [
        'a) To define the function',
        'b) To print the function\'s output',
        'c) To exit the function',
        'd) To specify the function\'s arguments'
      ],
      'correctAnswerIndex': 1,
      'hint':
          """ Explanation: The `return` statement in a function is used to specify the value that the function should provide as its output. When the function is called, the value specified in the `return` statement is returned to the caller, allowing you to use and manipulate the function's output.
 """,
    },
    {
      'question': 'How can you call (invoke) a function in Python?',
      'options': [
        'a) By using the function name directly',
        'b) By using the call keyword',
        'c) By using the invoke function_name() syntax',
        'd) By using parentheses after the function name'
      ],
      'correctAnswerIndex': 3,
      'hint':
          """ Explanation: You can call (invoke) a function in Python by using the function name followed by parentheses. The parentheses are used to pass arguments to the function (if required) and to execute the function's code.
 """,
    },
    {
      'question': 'What is the scope of a function variable in Python?',
      'options': [
        'a) The number of times the function is called',
        'b) The area of code where the function is defined',
        'c) The length of the variable\'s name',
        'd) The size of memory allocated to the variable'
      ],
      'correctAnswerIndex': 1,
      'hint':
          """ Explanation: The scope of a variable defined inside a function in Python is limited to the area of code where the function is defined. This variable is called a local variable, and it can only be accessed within the function's block of code.
 """,
    },
    {
      'question':
          'What is a docstring in Python, and how is it used with functions?',
      'options': [
        'a) A string that is automatically added to all variables',
        'b) A string that defines the function name',
        'c) A string that contains documentation for the function',
        'd) A string that declares the function\'s return type'
      ],
      'correctAnswerIndex': 2,
      'hint':
          """ Explanation: A docstring is a string that provides documentation for a function in Python. It is placed as the first statement inside the function's block and is used to describe the purpose and usage of the function. Docstrings are valuable for explaining how to use a function and its parameters.
 """,
    },
    {
      'question':
          'What are arguments and parameters in the context of function?',
      'options': [
        'a) Arguments are used when defining a function, and parameters are passed when invoking a function',
        'b) Parameters are used when defining a function, and arguments are passed when invoking a function',
        'c) Arguments and parameters are interchangeable terms',
        'd) Neither arguments nor parameters are used in functions'
      ],
      'correctAnswerIndex': 1,
      'hint':
          """ Explanation: Parameters are used when defining a function and are placeholders for the values that will be passed to the function when it's invoked. Arguments are the actual values that are passed to the function when it's called.
 """,
    },
    {
      'question': 'What is a lambda function in Python, and how is it defined?',
      'options': [
        'a) A function with multiple return statements',
        'b) A built-in function in Python',
        'c) A small anonymous function defined using the lambda keyword',
        'd) A function that doesn\'t require any parameters'
      ],
      'correctAnswerIndex': 2,
      'hint':
          """ Explanation: A lambda function in Python is a small, anonymous function defined using the `lambda` keyword. It can have any number of arguments but can only have one expression. Lambda functions are often used for short, simple operations that don't require a full function definition.
 """,
    },
    {
      'question': 'What is the purpose of the map() function in Python?',
      'options': [
        'a) To create a new list with modified elements',
        'b) To print the elements of a list',
        'c) To merge two lists into one',
        'd) To remove elements from a list'
      ],
      'correctAnswerIndex': 0,
      'hint':
          """ Explanation: The `map()` function in Python is used to apply a given function to each item in an iterable (e.g., a list) and returns a new iterable with the results. This can be useful for transforming the elements of a list without explicitly writing a loop.
 """,
    },
    {
      'question':
          'What is the difference between a function and a method in Python?',
      'options': [
        'a) There is no difference; the terms are interchangeable',
        'b) A function is used to define a class, while a method is used to define a module',
        'c) A function is a block of code that can be invoked independently, while a method is associated with an object and is invoked using dot notation',
        'd) A function is a type of data type, while a method is a keyword in Python'
      ],
      'correctAnswerIndex': 2,
      'hint':
          """ Explanation: In Python, a function is a block of code that performs a specific task and can be called independently. A method, on the other hand, is a function that is associated with an object and is called using dot notation (e.g., object.method()).
 """,
    },
    {
      'question':
          'What is the purpose of the __init__() method in a Python class?',
      'options': [
        'a) To define instance variables for the class',
        'b) To define class methods',
        'c) To create a new object of the class',
        'd) To initialize the attributes of an object when it is created'
      ],
      'correctAnswerIndex': 3,
      'hint':
          """ Explanation: The `__init__()` method is a special method in a Python class that is used to initialize the attributes of an object when it is created. It is called automatically when a new object of the class is instantiated.
 """,
    },
    {
      'question': 'What is recursion in Python?',
      'options': [
        'a) A type of loop',
        'b) A way to repeat a function call within the same function',
        'c) A built-in Python function',
        'd) A method to define class inheritance'
      ],
      'correctAnswerIndex': 1,
      'hint':
          """ Explanation: Recursion in Python refers to the process of a function calling itself within its own code. This can be a powerful technique for solving certain types of problems, but it must be used carefully to avoid infinite loops.
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
