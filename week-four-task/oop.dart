/*  create a program that has the following features:

An object-oriented model that uses classes and inheritance
A class that implements an interface
A class that overrides an inherited method
An instance of a class that is initialized with data from a file
A method that demonstrates the use of a loop

*/

//Solution
import 'dart:io';

// Interface
abstract class Printable {
  void print();
}

// class
class Animal {
  String name;
  int age;

  Animal(this.name, this.age);

  void makeSound() {
    print("The animal makes a sound.");
  }
}

// Derived class
class Dog extends Animal implements Printable {
  String breed;

  Dog(String name, int age, this.breed) : super(name, age);

  @override
  void makeSound() {
    
    stdout.writeln("The dog barks.");
  }

  @override
  void print() {
    stdout.writeln("Name: $name, Age: $age, Breed: $breed");
  }
}

// Main function
void main() async {
  // Read data from file
  File file = File('dog_data.txt');
  String dogData = await file.readAsString();
  List<String> data = dogData.split(',');

  // Create instance from file data
  Dog myDog = Dog(data[0], int.parse(data[1]), data[2]);

  // Demonstrate loop
  List<Dog> dogs = [
    Dog("Buddy", 3, "Labrador"),
    Dog("Charlie", 5, "Poodle"),
    Dog("Max", 2, "Golden Retriever")
  ];

  for (Dog dog in dogs) {
    dog.print();
    dog.makeSound();
  }

  // Call overridden method
  myDog.makeSound();
}
