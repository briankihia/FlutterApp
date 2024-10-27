import 'package:flutter/material.dart';

void main() {
  // void main function usually means it is the first function to be run as soon as the app runs
  runApp(MyApp());
//   runApp is a function gotten from the import of material.dart above
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


//   flutter uses widgets to do all of its drawing and pretty much handling everything within the framework
// widget is something that has has properties and could be rendered to the screen
// eg. textwidget, row widget, column widget
// when building our application we are going to build like a widget tree
// ie. upper level widget that stores lower level widget
// ie. if you modify the upper level widget everything gets modified

//   this widget is the root of our application
// stateleswidget just means that the widget will not be changing based on our interaction with it in the program
// this means all we need to do when we make a statelesswidget is overide a method called build
// MyApp takes all the functionality from statelesswidget class and altering it very slightly
// statelesswidget has a bunch of functionality already defined
@override
  Widget build(BuildContext context) {
  // since this is the root widget of our application, what we are returning is our materiaApp
  // materialApp just sets up the actuall app for us and defines the homepage for our application
  return MaterialApp(
  //   first when we make an app the first thing we pass is a title
    title: 'Flutter App',
    theme: ThemeData(
      // primarySwatch sets the primary color of our app
      primarySwatch: Colors.orange,
      primaryColor: Colors.orange,
      // This makes the primary color yellow more broadly.
    //   visualdensity means do we change the actual look of our app depending on what platform we are on eg. ios, android
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    // home is going to be the homepage of your application

    home: MyHomePage(),
  //   upto here is defining the actuall app but we havent defined what is actually going to show up when we draw the application
  //    so we create a widget and place it here on the home to be our homepage


  );
}

}


class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  //    dart is a typed language so you need to define the types of all of your parameters, the return types of all of your functions and methods so we are going to be using classes and object oriented programming with generics
  // we must return a widget
  //   whenever we start making an app atleast for now we are going to be returning the scaffold widget
  //   this just setts up the basic structure of a page
  //   it can also hold other widgets inside of it
  //   you can also return a text widget
    //   return Text("hello");
    // inside scaffold we add a child widget
    // first we add a title
    // statelesswidget and scaffold are widgets and on them we have a build method that tells us what to display when the app gets built

    // we are going to have widgets inside of widgets
    //  we have a scaffold widget, that has an appBar, that appBar is equal to an AppBar widget that has a title which is equal to a Text widget
    return Scaffold(
        appBar: AppBar(title: Text("Hello Brian"),backgroundColor: Theme.of(context).primaryColor, ),
        // Set AppBar to primary color- that part for backgroundcolor
        body:  Column(children: <Widget>[TestWidget(), TestWidget(), TestWidget()],));
  //   you can also change above column into a row by just changing it to Row
  //   in above we make our body to have a column which is going to be displayed as a list of widgets within it
  //   children takes a list of widgets
  //   when you add the column widget , this doesn't show anything itself all it does is align the children of it inside a column so they are above and below each other


  //   also inside this scaffold widget we should also have a build method which tells us what should be displayed when we build the scaffold widget


  }
}


// the below is a text widget which can be re-used
class TestWidget extends StatelessWidget {
  const TestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Hello World');
  }
}
