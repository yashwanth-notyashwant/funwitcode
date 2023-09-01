import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';

class QuizPageLists extends StatefulWidget {
  int score;
  String id;
  QuizPageLists(this.score, this.id);
  @override
  _QuizPageListsState createState() => _QuizPageListsState();
}

class _QuizPageListsState extends State<QuizPageLists> {
  int currentQuestionIndex = 0;

  List<Map<String, dynamic>> variable = [
    {
      'question': 'What is a list in Python?',
      'options': [
        'a) A reserved keyword',
        'b) An ordered collection of elements',
        'c) A mathematical operation',
        'd) A data type for text'
      ],
      'correctAnswerIndex': 1,
      'hint':
          """ Explanation: A list in Python is an ordered collection of elements. It allows you to store and manipulate multiple values in a single data structure, making it versatile for various tasks.
 """,
    },
    {
      'question': 'How do you define a list in Python?',
      'options': [
        'a) list list_name = ()',
        'b) list_name = []',
        'c) create list_name()',
        'd) list_name = {}'
      ],
      'correctAnswerIndex': 1,
      'hint':
          """ Explanation: To define a list in Python, you use square brackets `[]` and specify the elements inside them, separated by commas. For example, `my_list = [1, 2, 3]`.
 """,
    },
    {
      'question': 'What is the purpose of indexing in a list?',
      'options': [
        'a) To define the list',
        'b) To access and retrieve elements',
        'c) To create a new list',
        'd) To exit the program'
      ],
      'correctAnswerIndex': 1,
      'hint':
          """ Explanation: Indexing in a list is used to access and retrieve elements from the list. Each element in a list is assigned an index, starting from 0 for the first element.
 """,
    },
    {
      'question': 'How can you add an element to the end of a list in Python?',
      'options': [
        'a) By using square brackets and assigning a value',
        'b) By using the `append()` method',
        'c) By using parentheses and a value',
        'd) By using the `add()` method'
      ],
      'correctAnswerIndex': 1,
      'hint':
          """ Explanation: You can add an element to the end of a list in Python by using the `append()` method. It allows you to add a single element to the end of the list.
 """,
    },
    {
      'question':
          'What happens if you try to access an index that does not exist in a list?',
      'options': [
        'a) It raises a ValueError',
        'b) It returns a None value',
        'c) It creates a new index with the provided value',
        'd) It raises an IndexError'
      ],
      'correctAnswerIndex': 3,
      'hint':
          """ Explanation: If you try to access an index that does not exist in a list, it will raise an `IndexError` exception. Lists in Python are zero-indexed, so valid indices range from 0 to (length - 1).
 """,
    },
    {
      'question': 'What is the purpose of the `len()` function in Python?',
      'options': [
        'a) To define the list',
        'b) To access the last element of a list',
        'c) To get the number of elements in a list',
        'd) To delete elements from a list'
      ],
      'correctAnswerIndex': 2,
      'hint':
          """ Explanation: The `len()` function in Python is used to get the number of elements in a list. It returns the length (number of elements) of the list.
 """,
    },
    {
      'question': 'How can you remove an element from a list by its value?',
      'options': [
        'a) By using the `remove()` method',
        'b) By using square brackets and assigning a value',
        'c) By using the `delete()` method',
        'd) By using the `pop()` method'
      ],
      'correctAnswerIndex': 0,
      'hint':
          """ Explanation: You can remove an element from a list by its value using the `remove()` method. This method searches for the specified value and removes the first occurrence.
 """,
    },
    {
      'question': 'What is the purpose of list slicing in Python?',
      'options': [
        'a) To define the list',
        'b) To create a new list with modified elements',
        'c) To print the elements of a list',
        'd) To merge two lists into one'
      ],
      'correctAnswerIndex': 1,
      'hint':
          """ Explanation: List slicing in Python allows you to create a new list with a subset of elements from an existing list. It is useful for extracting specific portions of a list.
 """,
    },
    {
      'question': 'How can you check if an element exists in a list?',
      'options': [
        'a) By using the `find()` method',
        'b) By using the `contains()` method',
        'c) By using the `in` keyword',
        'd) By using the `exists()` function'
      ],
      'correctAnswerIndex': 2,
      'hint':
          """ Explanation: You can check if an element exists in a list in Python by using the `in` keyword. For example, `element in my_list` returns `True` if the element is in the list.
 """,
    },
    {
      'question': 'What is a list comprehension in Python?',
      'options': [
        'a) A way to create a list with predefined values',
        'b) A built-in Python function for lists',
        'c) A compact way to create lists using an expression and an iterable',
        'd) A way to access the keys of a list'
      ],
      'correctAnswerIndex': 2,
      'hint':
          """ Explanation: A list comprehension in Python is a compact way to create lists using an expression and an iterable. It allows you to create lists with predefined values based on a specific pattern.
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
