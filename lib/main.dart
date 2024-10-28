import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

@override
  Widget build(BuildContext context) {
  return MaterialApp(

    title: 'Flutter App',
    theme: ThemeData(

      primarySwatch: Colors.orange,
      primaryColor: Colors.orange,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),


    home: MyHomePage(),



  );
}

}


class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(title: Text("Hello Brian"),backgroundColor: Theme.of(context).primaryColor, ),

        body: TextInputWiget()
    );

  }
}

// first we make that stateful widget that is going to hold that text field
// below we have 2 classes for 1 widget, how does that work??
// one class is responsible for handling all of the state and the rendering(2nd class)
// and other one is responsible for taking any constructor argument(1st class)
class TextInputWiget extends StatefulWidget {
  @override
  // arrow below returns an instance of the TextInputWigetState
  _TextInputWigetState createState() => _TextInputWigetState();
}
// below handles building and setups are done in the class above
class _TextInputWigetState extends State<TextInputWiget> {
  // below we are creating a controller to control text in the text box
  // below is an object that is simply going to allow us to attach it to this text field and we can use controller to actually modify the content and figure out the content of the textfield
  final controller = TextEditingController();
  // we create a variable to store the text being created
  String text = "";

  // we add a method dispose
  // we add @override because it is an override from the main class
  @override
  void dispose() {
  //   we make sure that when we dispose of this widget we dispose off this controller
  //   the below makes sure we call our parent dispose
  //   what dispose does is that it cleans up the widget when it is done being used

    super.dispose();
    controller.dispose();
  }


  // now we create a function that updates the text variable above
  void changeText(text) {
    // now we manipulate the type of text being kept
    if (text == "hello world") {
      controller.clear();
      text = "";
    }
    // to refresh the widget after making changes we wrap everything with setstate
    setState(() {
      this.text = text;
    });

  }


  @override
  Widget build(BuildContext context) {
    // below we want to return a text field
    // decoration is all about beauty eg, color, icons, text that shows up behind.
    // prefixIcon(a widget) just means the icon will go at the beginning.
    // inside of icon we pass an elum which specifies which icon we want to display
    // to control what is inside this text field we just need to create a text controller
    return Column(children: <Widget>[
      TextField(
      // the below is just a noting that below controller is equal to the controller we defined above so now we can use the controller to access the values of this field
      controller: this.controller,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.message), labelText: "Type a message"),
        // we create a function which handles storing the text whenever there is a change
        // we make a function with the parameter text and text is going to be passed from this field
        // below function
        // when the below onChanged function is called like onChanged(hey) the this.changeText is going to be called but with a hey
        onChanged: (text) => this.changeText(text),
      ),
      // below we are now getting the text above and displaying it below
      // Text(controller.text)   this alone will not work because we are not telling flutter to refresh this widget, we are not telling it to redraw
    //   so we need to find a way to force flutter to refresh everytime we type something there.
    //   Text(controller.text)
    //   so rather than controller.text we just use the variable we have defined above
      Text(this.text)
    ]);
  }
}


