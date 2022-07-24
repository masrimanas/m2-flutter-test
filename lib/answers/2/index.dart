import 'package:flutter/material.dart' show protected;

void main() {
  final printMe = meInAYear();
  print(printMe);
}

// 2. Please describe this:
//
// a. ? ==> It's called nullable-type operator, it is one of the null-safety
// operators in Dart language. We can use this to specify a variable that might
// be null.

// We can define a variable without its value with this operator since with this
// operator we tell our compiler this variable is nullable.
String? name;

// then assign its variable in the next line with a function
String giveName(givenName) {
  return name = givenName;
}

// On the other hand, We also can create a variable with this operator along with
// its initial value
int? age = 28;

//
// b. ! ==> It is post-fix operator. We can use this operator to tell compiler
// that a particular variable with nullable type has a value.
class Person {
  String name = 'Manas';
  String? job;
}

void printIt() {
  // Instantiate an object as a nullable
  Person? manas;

  // To access any properties of this object, we must put this operator after
  // object name or it would show an error if this operator not added.
  print(manas!.name);

  // Later, we don't need to write this operator if we want to access any
  // properties object.
  print(manas.job);

  // But, This line of code above will cause runtime error of unhandled exception
  // because, the 'job' property of this object is null but we tell compiler
  // this object's property has value by using post-fix operator.
}

//
// c. .. ==> It is cascade notation. It is kind of method chaining.
class Villager {
  String? name;
  int? age;

  void printVillager() {
    print(name);
    print(age);
  }
}

// By using cascade notation we can assign values to object's properties and
// call its method in one line of code. It makes our code simpler and shorter.
final anotherVillager = Villager()
  ..name = 'Masri'
  ..age = 28
  ..printVillager();

//
// d. … ==> It is spread operator. We can used this operator to insert multiple
// element in a list to another list. When using this operator, I feel like I am
// grabbing all elements in a list and put it into a bag, then place the bag of
// list's elements to another list. It can also be used in Set and Map, btw.

List<int> numbersLeft = [1, 2, 3];
List<int> numbersMid = [4, 5, 6];
List<int> numbersRight = [7, 8, 9];

// We can assign all elements of above list to a new variable of list using this
// cool operator.
List<int> numbers = [...numbersLeft, ...numbersMid, ...numbersRight];

// another one
List<int> addNewNumbers(List<int> numsToAdd) {
  // for (final num in numsToAdd) {
  //   nums.add(num);
  // }
  // return nums; ==> Big NOOO!
  return [...numbers, ...numsToAdd]; // ==> Yeah!!!!
}

//
// e. => ==> Arrow operator? It is used as shorthand to write a function, if only
// that function has single expression. It makes our code simpler.
// We rewrite 'addNewNumber'function using this operator
List<int> addNewNumber(int numToAdd) => [...numbers, numToAdd];

// In arrow function we can omit the 'return' keyword. Yeah, simpler.
//
// f. <T> ==> It is generic type. Honestly, I am not good at this one.
// A generic type can be whatever type we wanna be when we instantiate the class.
class Generyc<T> {
  T stringOrInt(T input) => input;
}

void printGeneryc() {
  // We can instantiate an object and define the generic type to String
  final genericString = Generyc<String>();
  genericString.stringOrInt('2');

  // or integer
  final genericInt = Generyc<int>();
  genericInt.stringOrInt(2);
}

// Btw, while I was learning about dart generic through youtube videos, I found
// List, Set, Map are also generic.
//
// g. <T>[] ==> I really don't know dart generic has this kind of stuff.
// So, I googled it :D
// Source: https://dart.dev/guides/language/type-system

class GenerycCollection<T> {
  List<T>? collection;

  List<T> addCollection(T item) => <T>[...collection!, item];
  void printCollection() => print([...collection!]);
}

void printGenerycCollection(List<String> item) {
  // This line will cause an runtime error, because we mix the type in our list.
  // final badGenCol = GenerycCollection()..collection = <int>[...item];

  // This code will working fine
  final goodGenCol = GenerycCollection()..collection = [...item];

  goodGenCol.printCollection();
}

//
// h. _ (underscore) ==> We use '_' to define a private variables, function or
// even a class.

// We can't instantiate an object of this class in another dart file.
// ignore: unused_element
class _PrivetClass {
  // We can't access this properties directly
  String? _privetProps;

  // we need a getter to access _privetProps properties
  String get privetProps => _privetProps!;

  // we need a setter to change _privetProps value.
  set privetProps(String value) => _privetProps = value;
}

//
// i. @protected ==> I have never used this annotation. So, I googled and found
// that this annotation is only found in Flutter(meta package).
// Source: https://stackoverflow.com/questions/61810306/what-does-protected-mean-in-dart
// This annotation is used to provide a hint when members are used outside of
// subclasses, by the Dart Analyzer.

abstract class Phone {
  final String vendor;
  final String type;
  final String imei;

  Phone({
    required this.vendor,
    required this.type,
    required this.imei,
  });
  // I guess the code will look like this, but I can't understand how this thing
  // works.
  @protected
  String imeiPrint();
}

//
// j. this ==> If I got to describe what 'this' keyword, I'd say it is a keyword
// that can be use to access a property or method of current instance.
// The I googled, this definition is better => The this keyword is used to refer
// the current class object. It indicates the current instance of the class,
// methods, or constructor (https://www.javatpoint.com/dart-this-keyword).

class Character {
  String? name;
  String? role;
  // Character({
  //   required this.name,
  //   required this.role,
  // });

  // These lines of code above are the shorthand of these lines
  Character({
    required String name,
    required String role,
  }) {
    // 'this' keyword refer to the properties of current class. When object of
    // this class is instantiated. The properties of this class will have the
    // given values to constructor's paramaters.

    this.name = name;
    this.role = role;
  }
}

//
// k. const ==> This keyword uses to define a variable that is immutable in
// compile time and runtime. Constructor can also use this keyword.

// immutable
const gender = 'male';

class Teacher {
  final String name;
  final String subject;

  // const define a immutable constructor for final properties/field
  const Teacher({
    required this.name,
    required this.subject,
  });
}

//
// l. library ==> The import and "library" directives can help you create a modular
// and shareable code base(https://dart.dev/guides/language/language-tour).
// I think it's a keyword for modularization stuff. I have tried to create a
// modular app in Dicoding course. There lines of code are from that project:

// library search;

// export 'domain/usecases/search_movies.dart';
// export 'domain/usecases/search_series.dart';

// export 'presentation/bloc/movies/search_movie/search_movie_bloc.dart';
// export 'presentation/bloc/series/search_series/search_series_bloc.dart';
// export 'presentation/pages/movies/search_page_movies.dart';
// export 'presentation/pages/series/search_page_series.dart';

//
// m. as => This keyword is for type casting.

final me = {
  'name': 'Manas',
  'umur': 28,
};

String meInAYear() {
  int myAge = me['umur'] as int;
  // we can't do math without a type casting on myAge variable
  return '${myAge + 1} my age';
}
