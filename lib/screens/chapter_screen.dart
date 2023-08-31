import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ChapterScreen extends StatefulWidget {
  int indexOfChapters;
  ChapterScreen(this.indexOfChapters);
  @override
  State<ChapterScreen> createState() => _ChapterScreenState();
}

class _ChapterScreenState extends State<ChapterScreen> {
  final List<String> chapters = [
    " 1.Variables",
    " 2.Functions",
    " 3.Conditionals",
    " 4.Loops",
    " 5.Lists",
    " 6.Dictionaries",
  ];

  final List<String> texts = [
    """ 

Example of Variable in Python
An Example of a Variable in Python is a representational name that serves as a pointer to an object. Once an object is assigned to a variable, it can be referred to by that name. In layman’s terms, we can say that Variable in Python is containers that store values.

Here we have stored “Geeksforgeeks”  in a var which is variable, and when we call its name the stored information will get printed.

Var = "Geeksforgeeks"
print(Var)

Rules for Python variables
A Python variable name must start with a letter or the underscore character.
A Python variable name cannot start with a number.
A Python variable name can only contain alpha-numeric characters and underscores (A-z, 0-9, and _ ).
Variable in Python names are case-sensitive (name, Name, and NAME are three different variables).
The reserved words(keywords) in Python cannot be used to name the variable in Python.

# valid variable name
geeks = 1
Geeks = 2
Ge_e_ks = 5
_geeks = 6
geeks_ = 7
_GEEKS_ = 8
 
print(geeks, Geeks, Ge_e_ks)
print(_geeks, geeks_, _GEEKS_)

Output:

1 2 5
6 7 8

Variables Assignment in Python
Here, we have assigned a number, a floating point number, and a string to a variable such as age, salary, and name.

# An integer assignment
age = 45
 
# A floating point
salary = 1456.8
 
# A string
name = "John"
 
print(age)
print(salary)
print(name)


Output:
45
1456.8
John

Declaration and Initialization of Variables
Let’s see how to declare the variable and print the variable.


# declaring the var
Number = 100
 
# display
print( Number)

Output:
100


Python Assign Values to Multiple Variables 
Also, Python allows assigning a single value to several variables simultaneously with “=” operators. 
For example: 

a = b = c = 10
 
print(a)
print(b)
print(c)


Output:

10
10
10


""",
    """ 
    Python Functions:
A function is a block of code that performs a specific task.

Suppose, you need to create a program to create a circle and color it. You can create two functions to solve this problem:

create a circle function
create a color function
Dividing a complex problem into smaller chunks makes our program easy to understand and reuse.


Types of function
There are two types of function in Python programming:

Standard library functions - These are built-in functions in Python that are available to use.
User-defined functions - We can create our own functions based on our requirements.


Python Function Declaration
The syntax to declare a function is:

def function_name(arguments):
    # function body 

    return

Here,

def - keyword used to declare a function
function_name - any name given to the function
arguments - any value passed to function
return (optional) - returns value from a function

Let's see an example,

def greet():
    print('Hello World!')

Calling a Function in Python
In the above example, we have declared a function named greet().

def greet():
    print('Hello World!')

# call the function
greet()

Example: Python Function
def greet():
    print('Hello World!')

# call the function
greet()

print('Outside function')


Here,

When the function is called, the control of the program goes to the function definition.
All codes inside the function are executed.
The control of the program jumps to the next statement after the function call.

Python Function Arguments
As mentioned earlier, a function can also have arguments. An argument is a value that is accepted by a function. For example,

# function with two arguments
def add_numbers(num1, num2):
    sum = num1 + num2
    print('Sum: ',sum)

# function with no argument
def add_numbers():
    # code

If we create a function with arguments, we need to pass the corresponding values while calling them. For example,
# function call with two values
add_numbers(5, 4)

# function call with no value
add_numbers()

Example 1: Python Function Arguments
# function with two arguments
def add_numbers(num1, num2):
    sum = num1 + num2
    print("Sum: ",sum)

# function call with two values
add_numbers(5, 4)

# Output: Sum: 9

    """,
    """
How to Use the if Statement in Python
The if statement allows you to execute a block of code if a certain condition is true. Here's the basic syntax:

if condition:
    # code to execute if condition is true
The condition can be any expression that evaluates to a Boolean value (True or False). If the condition is True, the code block indented below the if statement will be executed. If the condition is False, the code block will be skipped.

Here's an example of how to use an if statement to check if a number is positive:

num = 5

if num > 0:
    print("The number is positive.")
Output:

The number is positive.
In this example, we use the > operator to compare the value of num to 0. If num is greater than 0, the code block indented below the if statement will be executed, and the message "The number is positive." will be printed.

How to Use the else Statement in Python
The else statement allows you to execute a different block of code if the if condition is False. Here's the basic syntax:

if condition:
    # code to execute if condition is true
else:
    # code to execute if condition is false
If the condition is True, the code block indented below the if statement will be executed, and the code block indented below the else statement will be skipped.

If the condition is False, the code block indented below the else statement will be executed, and the code block indented below the if statement will be skipped.

Here's an example of how to use an if-else statement to check if a number is positive or negative:

num = -5

if num > 0:
    print("The number is positive.")
else:
    print("The number is negative.")
Output:

The number is negative.
In this example, we use an if-else statement to check if num is greater than 0. If it is, the message "The number is positive." is printed. If it is not (that is, num is negative or zero), the message "The number is negative." is printed.

How to Use the elif Statement in Python
The elif statement allows you to check multiple conditions in sequence, and execute different code blocks depending on which condition is true. Here's the basic syntax:

if condition1:
    # code to execute if condition1 is true
elif condition2:
    # code to execute if condition1 is false and condition2 is true
elif condition3:
    # code to execute if condition1 and condition2 are false, and condition3 is true
else:
    # code to execute if all conditions are false
The elif statement is short for "else if", and can be used multiple times to check additional conditions.

Here's an example of how to use an if-elif-else statement to check if a number is positive, negative, or zero:

num = 0

if num > 0:
    print("The number is positive.")
elif num < 
Use Cases For Conditional Statements
Example 1: Checking if a number is even or odd.
num = 4

if num % 2 == 0:
    print("The number is even.")
else:
    print("The number is odd.")
Output:

The number is even.
In this example, we use the modulus operator (%) to check if num is evenly divisible by 2.

If the remainder of num divided by 2 is 0, the condition num % 2 == 0 is True, and the code block indented below the if statement will be executed. It will print the message "The number is even."

If the remainder is not 0, the condition is False, and the code block indented below the else statement will be executed, printing the message "The number is odd."

Example 2: Assigning a letter grade based on a numerical score
score = 85

if score >= 90:
    grade = "A"
elif score >= 80:
    grade = "B"
elif score >= 70:
    grade = "C"
elif score >= 60:
    grade = "D"
else:
    grade = "F"

print("Your grade is:", grade)
Output:

Your grade is: B
In this example, we use an if-elif-else statement to assign a letter grade based on a numerical score.

The if statement checks if the score is greater than or equal to 90. If it is, the grade is set to "A". If not, the first elif statement checks if the score is greater than or equal to 80. If it is, the grade is set to "B". If not, the second elif statement checks if the score is greater than or equal to 70, and so on. If none of the conditions are met, the else statement assigns the grade "F".

Example 3: Checking if a year is a leap year
year = 2000

if year % 4 == 0:
    if year % 100 == 0:
        if year % 400 == 0:
            print(year, "is a leap year.")
        else:
            print(year, "is not a leap year.")
    else:
        print(year, "is a leap year.")
else:
    print(year, "is not a leap year.")
Output:

2000 is a leap year.
In this example, we use nested if statements to check if a year is a leap year. A year is a leap year if it is divisible by 4, except for years that are divisible by 100 but not divisible by 400.

The outer if statement checks if year is divisible by 4. If it is, the inner if statement checks if it is also divisible by 100. If it is, the innermost if statement checks if it is divisible by 400. If it is, the code block indented below that statement will be executed, printing the message "is a leap year."

If it is not, the code block indented below the else statement inside the inner if statement will be executed, printing the message "is not a leap year.".

If the year is not divisible by 4, the code block indented below the else statement of the outer if statement will be executed, printing the message "is not a leap year."

Example 4: Checking if a string contains a certain character
string = "hello, world"
char = "w"

if char in string:
    print("The string contains the character", char)
else:
    print("The string does not contain the character", char)
Outcome:

The string contains the character w
In this example, we use the in operator to check if the character char is present in the string string. If it is, the condition char in string is True, and the code block indented below the if statement will be executed, printing the message "The string contains the character" followed by the character itself.

If char is not present in string, the condition is False, and the code block indented below the else statement will be executed, printing the message "The string does not contain the character" followed by the character itself.

Conclusion
Conditional statements (if, else, and elif) are fundamental programming constructs that allow you to control the flow of your program based on conditions that you specify. They provide a way to make decisions in your program and execute different code based on those decisions.

In this article, we have seen several examples of how to use these statements in Python, including checking if a number is even or odd, assigning a letter grade based on a numerical score, checking if a year is a leap year, and checking if a string contains a certain character.

By mastering these statements, you can create more powerful and versatile programs that can handle a wider range of tasks and scenarios.

It is important to keep in mind that proper indentation is crucial when using conditional statements in Python, as it determines which code block is executed based on the condition.

With practice, you will become proficient in using these statements to create more complex and effective Python programs.
 """,
    """ 
    How to Use For Loops in Python
You'll use a for loop when you want to iterate over a collection of items or when you know the exact number of times you want to execute a block of code.

Here's the code for a for loop in Python:

for variable in iterable:
    # code to execute
variable is a variable that represents the current item in the iterable that we're iterating over.
iterable is a collection of items that we want to iterate over, such as a list, tuple, string, or range.
For example, let's say we have a list of numbers and we want to print each number:

numbers = [1, 2, 3, 4, 5]
for num in numbers:
    print(num)
Output

1
2
3
4
5
We can also use the range() function to specify a range of numbers to iterate over:

for num in range(1, 6):
    print(num)
Output:

1
2
3
4
5
The range() function takes two arguments: the starting number and the ending number (exclusive). In this case, the loop will iterate over the numbers from 1 to 5.

How to Use While Loops in Python
You'll use a while loop when you want to execute a block of code repeatedly based on a condition.

Here's the syntax for a while loop in Python:

while condition:
    # code to execute
condition is a boolean expression that determines whether the loop should continue or not.

For example, let's say we want to print the numbers from 1 to 5 using a while loop:

num = 1
while num <= 5:
    print(num)
    num += 1
In this example, we initialize the num variable to 1 and then execute the loop as long as num is less than or equal to 5. Inside the loop, we print the current value of num and then increment it by 1.

We can also use a while loop to keep asking the user for input until they enter a valid response:

valid_response = False
while not valid_response:
    response = input("Enter 'yes' or 'no': ")
    if response.lower() == 'yes' or response.lower() == 'no':
        valid_response = True
    else:
        print("Invalid response. Please enter 'yes' or 'no'.")
Let's take a look at some advanced uses of loops in Python.

How to Use Nested Loops in Python
Nested loops are loops that are contained inside other loops. They allow us to iterate over a collection of items multiple times and are useful for tasks such as generating all possible combinations of items.

Here's an example of how to use nested loops to generate all possible pairs of numbers from two lists:

list1 = [1, 2, 3]
list2 = [4, 5, 6]

for num1 in list1:
    for num2 in list2:
        print(num1, num2)
Output:

1 4
1 5
1 6
2 4
2 5
2 6
3 4
3 5
3 6
In this example, we use a nested for loop to iterate over each item in list1 and list2, and print out all possible pairs of numbers.

List Comprehension in Python
List comprehensions are a concise way to create lists based on existing lists or other iterable objects. They use a for loop and an optional conditional statement to generate the new list.

Here's an example of how to use list comprehension to create a new list of even numbers from an existing list:

numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
even_numbers = [num for num in numbers if num % 2 == 0]
print(even_numbers)
Output:

[2, 4, 6, 8, 10]
In this example, we use a list comprehension to iterate over each number in the numbers list and add it to the even_numbers list if it is even (that is, the remainder when divided by 2 is 0).

How to Iterate Over a Dictionary in Python
In Python, we can iterate over the keys, values, or items (key-value pairs) of a dictionary using a for a loop.

Here's an example of how to iterate over the items of a dictionary and print out the key-value pairs:

fruits = {'apple': 'red', 'banana': 'yellow', 'orange': 'orange'}

for fruit, color in fruits.items():
    print(f"The {fruit} is {color}.")
Output:

The apple is red.
The banana is yellow.
The orange is orange.
In this example, we use the items() method of the fruits dictionary to iterate over each key-value pair, and then print out a formatted string that includes the fruit and its corresponding color.

Conclusion
Loops are an essential part of programming in Python. They allow us to automate repetitive tasks and manipulate data in powerful ways.

By understanding the basics of for and while loops, as well as more advanced concepts such as nested loops and list comprehensions, you'll be able to write efficient and effective code in Python.
    
    """,
    """
Lists are one of the core data structures in Python. We use them for storing any data type, whether it's an integer, string, boolean, or even an object.

Because one list can store multiple types of data, lists are one of the most powerful and widely used tools for storing data in Python.

One of the notable features of lists is mutability. You can change a list after declaring it and build upon it.

In this article, you will not just learn how to declare a list – I will also show you several methods you can use to manipulate lists so you can get confident using them.

Basic Syntax of Lists in Python
To create a list in Python, declare a name for the list and place the individual data separated by commas inside square brackets:

listName = [value1, value2, value3, value4]
Remember the values you put in the square brackets can be of any data type.

It could be strings:

langs = ["HTML", "CSS", "Python", "JavaScript"]
It could be integers:

intList = [1, 5, 78, 76, 9, 0]
It could be a boolean:

boolList = [True, False]
It could be a mixture of different data types, including floats:

mixedList = [23, "JavaScript", True, 34.9, 19]
You can even duplicate the data in a list and things would still work fine:

duplicateList = [3, "Python", "Python", "JavaScript"]
print(duplicateList) 
# Output: [3, 'Python', 'Python', 'JavaScript']
How to Access the Elements in a List
To access the elements in a list, you can use the index operator ([]). Lists are zero-indexed, so we use 0 to get the first element, 1 for the second element, and so on.

langs = ["HTML", "CSS", "Python", "JavaScript", "C++", "Java", "Elixir", "R"]
firstElement = langs[0]
secondElement = langs[1]
thirdElement = langs[2]
fourthElement = langs[3]

print(firstElement) # HTML
print(secondElement) # CSS
print(thirdElement) # Python
print(fourthElement) # JavaScript

# Get the last element with negative indexing
lastElement = langs[-1]
print(lastElement) # R
Different Methods you can Use to Work with Lists
You can use the len() method to get the length of the list:

langs = ["HTML", "CSS", "Python", "JavaScript", "C++", "Java", "Elixir", "R"]
print(len(langs))
# Output: 8
You can add to the list by using the append() method:

langs = ["HTML", "CSS", "Python", "JavaScript", "C++", "Java", "Elixir", "R"]
langs.append("C#")
print(langs)
N.B.: You can only append one element at a time with the append() method, and the element gets pushed to the end.

Keep reading and I will show you how to add multiple elements to the list, and how you can add something to your desired position (index) in the list.

You can add to the position you like in the list by using the insert() method:

langs = ["HTML", "CSS", "Python", "JavaScript", "C++", "Java", "Elixir", "R"]
# Insert Golang at position 4
langs.insert(4, "Golang")

print(langs)
# OUtput: ['HTML', 'CSS', 'Python', 'JavaScript', 'Golang', 'C++', 'Java', 'Elixir', 'R']
Remember that lists are zero-indexed, so counting starts from 0 and not 1. Golang was not inserted at position 5, it was inserted at position 4.

You can add multiple elements to the list by using the extend() method:

langs = ["HTML", "CSS", "Python", "JavaScript", "C++", "Java", "Elixir", "R"]
langs.extend(["Golang", "F#", "COBOL"])

print(langs)
# Output: ['HTML', 'CSS', 'Python', 'JavaScript', 'C++', 'Java', 'Elixir', 'R', 'Golang', 'F#', 'COBOL']
You can remove an element from the list by using the remove() method:

langs = ["HTML", "CSS", "Python", "JavaScript", "C++", "Java", "Elixir", "R"]
langs.extend(["Golang", "F#", "COBOL"])

# Remove HTML
langs.remove("HTML")

print(langs)
# Output: ['CSS', 'Python', 'JavaScript', 'C++', 'Java', 'Elixir', 'R', 'Golang', 'F#', 'COBOL']
You can remove an element from the end of the list by using the pop() method:

langs = ["HTML", "CSS", "Python", "JavaScript", "C++", "Java", "Elixir", "R"]
# Remove R
langs.pop()

print(langs)
# Output: ['HTML', 'CSS', 'Python', 'JavaScript', 'C++', 'Java', 'Elixir']
You can also remove an element from certain position in the list by using the pop() method:

langs = ["HTML", "CSS", "Python", "JavaScript", "C++", "Java", "Elixir", "R"]
# Removes JavaScript
langs.pop(3)

print(langs)
# Output: ['HTML', 'CSS', 'Python', 'C++', 'Java', 'Elixir', 'R']
If the list only contains numbers, you can use the min() method to get the smallest number:

listOfNumbers = [3, 89, 8, 100, 2, 4, 1]
smallestNum = min(listOfNumbers)

print(smallestNum) # Output: 1

If the list only contains numbers, you can use the max() method to get the largest number:**

listOfNumbers = [3, 89, 8, 100, 2, 4, 1]
largestNum = max(listOfNumbers)

print(largestNum) # Output: 100
Conclusion
In this article, you learned about lists in Python, how to index them, and several methods you can use to get things done with them.

Lists are a powerful data structure you should get comfortable using because they are very dynamic and can help you get things done in multiple ways.

If you find this article helpful, please share it with your friends and family. """,
    """ 
    Python Dictionary Data Structure Explained
Dictionary is one of the most used data structures in Python. A dictionary is an unordered collection of items and we usually have keys and values stored in a dictionary. Let us look at a few examples for how the dictionary is usually used.

# dictionary declaration 1
dict1 = dict()

# dictionary declaration 2
dict2 = {}

# Add items to the dictionary
# The syntax to add and retrieve items is same for either of the two objects we defined above. 
key = "X"
value = "Y"
dict1[key] = value

# The dictionary doesn't have any specific data-type. 
# So, the values can be pretty diverse. 
dict1[key] = dict2
Let’s now look at some retrieval ways.

# Since "X" exists in our dictionary, this will retrieve the value
value = dict1[key]

# This key doesn't exist in the dictionary. 
# So, we will get a `KeyError`
value = dict1["random"]
Avoiding KeyError: Use .get function
In case the given key does not exist in the dictionary, Python will throw a KeyError. There is a simple workaround for this. Let’s look at how we can avoid KeyError using the in-built .get function for dictionaries.

dict_ = {}

# Some random key
random_key = "random"

# The most basic way of doing this is to check if the key 
# exists in the dictionary or not and only retrieve if the 
# key exists. Otherwise not. 
if random_key in dict_:
  print(dict_[random_key])
else:
  print("Key = {} doesn't exist in the dictionary".format(dict_))
A lot of times we are ok getting a default value when the key doesn’t exist. For e.g. when building a counter. There is a better way to get default values from the dictionary in case of missing keys rather than relying on standard if-else.

# Let's say we want to build a frequency counter for items in the following array
arr = [1,2,3,1,2,3,4,1,2,1,4,1,2,3,1]

freq = {}

for item in arr:
  # Fetch a value of 0 in case the key doesn't exist. Otherwise, fetch the stored value
  freq[item] = freq.get(item, 0) + 1
So, the get(<key>, <defaultval>) is a handy operation for retrieving the default value for any given key from the dictionary. The problem with this method comes when we want to deal with mutable data structures as values e.g. list or set.

dict_ = {}

# Some random key
random_key = "random"

dict_[random_key] = dict_.get(random_key, []).append("Hello World!")
print(dict_) # {'random': None}

dict_ = {}
dict_[random_key] = dict_.get(random_key, set()).add("Hello World!")
print(dict_) # {'random': None}
Did you see the problem?

The new set or the list doesn’t get assigned to the dictionary’s key. We should assign a new list or a set to the key in case of missing value and then append or add respectively. Ley’s look at an example for this.

dict_ = {}
dict_[random_key] = dict_.get(random_key, set())
dict_[random_key].add("Hello World!")
print(dict_) # {'random': set(['Hello World!'])}. Yay!
Avoiding KeyError: Use defaultdict
This works most of the times. However, there is a better way to do this. A more pythonic way. The defaultdict is a subclass of the built-in dict class. The defaultdict simply assigns the default value that we specify in case of a missing key. So, the two steps:

dict_[random_key] = dict_.get(random_key, set())
dict_[random_key].add("Hello World!")
can now be combined into one single step. For e.g.

from collections import defaultdict

# Yet another random key
random_key = "random_key"

# list defaultdict
list_dict_ = defaultdict(list)

# set defaultdict
set_dict_ = defaultdict(set)

# integer defaultdict
int_dict_ = defaultdict(int)

list_dict_[random_key].append("Hello World!")
set_dict_[random_key].add("Hello World!")
int_dict_[random_key] += 1
 
  defaultdict(<class 'list'>, {'random_key': ['Hello World!']}) 
  defaultdict(<class 'set'>, {'random_key': {'Hello World!'}}) 
  defaultdict(<class 'int'>, {'random_key': 1})
 
print(list_dict_, set_dict_, int_dict_)
    """,
  ];
  @override
  Widget build(BuildContext context) {
    // var hi = MediaQuery.of(context).size.height;
    var wi = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: BackButton(
            color: Colors.black,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: wi,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20, top: 30),
                  child: Text(
                    '${chapters[widget.indexOfChapters]}',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
                  child: Text(
                    texts[widget.indexOfChapters],
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
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
