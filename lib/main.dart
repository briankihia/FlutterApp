import 'package:flutter/material.dart';

// this time we are going to create a widget and a button for when clicked the text is stored in our new widget and where we typed it it is cleared


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

// we want to modify my homepage to be a stateful widget
// making it a stateful widget because we want to display dynamic content that changes in response to events
// we want to have a textfield in my homepage and when we click the button in the text input widget, it actually modifies the homepage

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String text = "";

  // we want to give the below method to the textInputwiget
  // changes empty text above to be whatever text we pass to it
  void changeText(String text) {
    // NB- we need to wrap this inside of set state
    // because if we don't, then it would modify the text but it wont rerender the widget, so we wont actually see any of these updates happening
    this.setState(() {
      this.text = text;
    //   this before text above helps to identify that we are not talking about the parameter text but the variable

    });

  }

  // we write a function in this homepage class and pass it as a constructor argument in TextInputWiget(widget in body) , it would save it as a callback in it's class and we would call the callback when the bbutton is clicked
  //  we make a method on my homepage state that we want called when the button is called.
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(title: Text("Hello Brian"),backgroundColor: Theme.of(context).primaryColor, ),
        // here in the body, we make a column and add a textInputWidget and also a textwidget
        body: Column(children: <Widget>[TextInputWiget(this.changeText),
          Text(this.text)
        ])
    );

  }
}



class TextInputWiget extends StatefulWidget {

  // what we are going to do, is we are going to make a constructor inside textInputwidget that takes one parameter, which is the method we wanna use as a callback
  // what the callback below is saying is that we will have the property of this class which is a callback, it is a function which takes a string as one of its arguments
  // this widget we are in an immutable wiget/class so we cant modify any of the properties on it so we need to change below to be final
  // final means once it is set we are not going to change it
  final Function(String) callback;
  // final function(String) callback;

  // now we make a constructor that is going to define what callback is
  //  to make it a constructor all we need to do to makeit a constructor is below
  TextInputWiget(this.callback);

  @override
  _TextInputWigetState createState() => _TextInputWigetState();
}

class _TextInputWigetState extends State<TextInputWiget> {
  final controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  // this is a function that is employed when our onPressed button is clicked
  // we want when the button is clicked Text widget is changed but the thing is it is located out of this function,
  // thus we use a callback
  // what a callback is , we pass a function to this TextInputWidget and when the button is pressed it will call the function that we passed in.
  void click() {
    widget.callback(controller.text);
    controller.clear();
  }



  @override
  Widget build(BuildContext context) {

    return
      TextField(
      //   we want we overlay the button over the textfield

      controller: this.controller,
      decoration: InputDecoration(
          // prefix means before , suffix mean after
          prefixIcon: Icon(Icons.message), labelText: "Type a message",
          suffixIcon: IconButton(icon: Icon(Icons.send,color: Colors.orange),
            // sometimes splashColor doesn’t work as expected on an IconButton due to the material design's limitations in certain themes
            splashColor: Colors.blue,
            // tooltip message is displayed when the user long presses on it
            tooltip: "Post Message",
            onPressed: this.click,
          )));


  }
}


