import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';

class QuizPageDict extends StatefulWidget {
  int score;
  String id;
  QuizPageDict(this.score, this.id);
  @override
  _QuizPageDictState createState() => _QuizPageDictState();
}

class _QuizPageDictState extends State<QuizPageDict> {
  int currentQuestionIndex = 0;
  List<Map<String, dynamic>> variable = [
    {
      'question': 'What is a dictionary in Python?',
      'options': [
        'a) A type of loop',
        'b) A collection of key-value pairs',
        'c) A mathematical operation',
        'd) A reserved keyword'
      ],
      'correctAnswerIndex': 1,
      'hint':
          """ Explanation: A dictionary in Python is a collection of key-value pairs. It allows you to store and retrieve data using unique keys, making it a versatile data structure for various tasks.
 """,
    },
    {
      'question': 'How do you define a dictionary in Python?',
      'options': [
        'a) dict dictionary_name = {}',
        'b) dictionary_name = []',
        'c) create dictionary_name()',
        'd) dictionary_name = {}'
      ],
      'correctAnswerIndex': 3,
      'hint':
          """ Explanation: To define a dictionary in Python, you use curly braces `{}` and specify key-value pairs inside them, separated by colons. For example, `my_dict = {'key1': 'value1', 'key2': 'value2'}`.
 """,
    },
    {
      'question': 'What is the purpose of keys in a dictionary?',
      'options': [
        'a) To define the dictionary',
        'b) To store values',
        'c) To provide a name for each item',
        'd) To exit the program'
      ],
      'correctAnswerIndex': 2,
      'hint':
          """ Explanation: Keys in a dictionary serve as unique identifiers for each item (value) stored in the dictionary. They provide a way to access and retrieve values based on their associated keys.
 """,
    },
    {
      'question': 'How can you access a value in a dictionary in Python?',
      'options': [
        'a) By using square brackets and the key',
        'b) By using the `value` keyword',
        'c) By using the index',
        'd) By using parentheses'
      ],
      'correctAnswerIndex': 0,
      'hint':
          """ Explanation: You can access a value in a dictionary in Python by using square brackets `[]` followed by the key associated with the value you want to retrieve. For example, `my_dict['key']` will return the value associated with 'key'.
 """,
    },
    {
      'question':
          'What happens if you try to access a key that does not exist in a dictionary?',
      'options': [
        'a) It raises a KeyError',
        'b) It returns a None value',
        'c) It creates a new key-value pair with the provided key',
        'd) It deletes the dictionary'
      ],
      'correctAnswerIndex': 0,
      'hint':
          """ Explanation: If you try to access a key that does not exist in a dictionary, it will raise a `KeyError` exception. To avoid this, you can use the `get()` method or check if the key exists using the `in` keyword.
 """,
    },
    {
      'question': 'What is the purpose of the values() method in a dictionary?',
      'options': [
        'a) To define the dictionary',
        'b) To access the keys of the dictionary',
        'c) To access the values of the dictionary',
        'd) To delete the dictionary'
      ],
      'correctAnswerIndex': 2,
      'hint':
          """ Explanation: The `values()` method in a dictionary is used to access the values stored in the dictionary. It returns a view of all the values in the dictionary.
 """,
    },
    {
      'question':
          'How can you add a new key-value pair to an existing dictionary?',
      'options': [
        'a) By using square brackets and assigning a value to a new key',
        'b) By using the `append()` method',
        'c) By using parentheses and a key-value pair',
        'd) By using the `add()` method'
      ],
      'correctAnswerIndex': 0,
      'hint':
          """ Explanation: You can add a new key-value pair to an existing dictionary in Python by using square brackets `[]` and assigning a value to a new key. For example, `my_dict['new_key'] = 'new_value'`.
 """,
    },
    {
      'question': 'What is the purpose of the items() method in a dictionary?',
      'options': [
        'a) To access the keys of the dictionary',
        'b) To access the values of the dictionary',
        'c) To access both keys and their corresponding values as tuples',
        'd) To define the dictionary'
      ],
      'correctAnswerIndex': 2,
      'hint':
          """ Explanation: The `items()` method in a dictionary is used to access both keys and their corresponding values as tuples. It returns a view of all key-value pairs in the dictionary.
 """,
    },
    {
      'question': 'What is the purpose of the del statement in Python?',
      'options': [
        'a) To access values in a dictionary',
        'b) To delete elements from a list',
        'c) To define a function',
        'd) To remove a key-value pair from a dictionary'
      ],
      'correctAnswerIndex': 3,
      'hint':
          """ Explanation: The `del` statement in Python is used to remove a key-value pair from a dictionary. You specify the key that you want to delete using the `del` statement.
 """,
    },
    {
      'question': 'What is a dictionary comprehension in Python?',
      'options': [
        'a) A way to create a dictionary with predefined keys',
        'b) A built-in Python function for dictionaries',
        'c) A compact way to create dictionaries using an expression',
        'd) A way to check if a dictionary is empty'
      ],
      'correctAnswerIndex': 2,
      'hint':
          """ Explanation: A dictionary comprehension in Python is a compact way to create dictionaries using an expression and an iterable. It allows you to create dictionaries with predefined keys and values based on a specific pattern.
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
