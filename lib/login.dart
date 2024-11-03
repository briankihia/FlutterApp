import 'package:flutter/material.dart';
import 'package:myapp/myHomePage.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Hello Brian"),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: Body()

        // Text(this.text)
        );
  }
}

// let's make a class for body to make our code look clean
// we make body statefull not whole loginpage
// we make a statefull widget that is going to hold our login page
//why statefull, because user is going to type in a text and we want to save that text
//if they exit the app and come back in it will have the last thing they typed in

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String name = '';
  // we make a text editing controller here, text field that the user is going to type into
  TextEditingController controller = new TextEditingController();

  void click() {
    //   we are going to set that empty name to whatever the controller text is
    //   and then we are going to actually navigate to the next page
    //   controller.text is a getter that acquires the text that has een type by the user
    this.name = controller.text;
  //   so now we create a way to navigate over
  //   how the navigator works, think of it as a stack.
  //   push a page to the navigator it goes to the top of the stack, which means that is the page we are currently going to be viewing
  //   everytime you push a page to the navigator, everytime you press back you will go back in the order you came
  //   MaterialPageRoute tells us we are moving to the next page
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(this.name)));
  }

  @override
  Widget build(BuildContext context) {
    // align allows us to align our widget in the centre of the screen
    // for padding we want to make sure it is extended of the walls a little bit so it doesn't seem its expanding the whole screen

    return Align(
        alignment: Alignment.center,
        // below is the child of this allignment with a padding of 10px on all sides
        // and it has a textfield as a child
        // the below textField is going to be equal to the controller we have here
        child: Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: this.controller,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                labelText: "Type Your Name:",
                // border is for the whole text
                border: OutlineInputBorder(
                    borderSide: BorderSide(width: 5, color: Colors.black)),
                suffixIcon: IconButton(
                  icon: Icon(Icons.done, color: Colors.orange),
                  splashColor: Colors.blue,
                  tooltip: "Submit",
                  onPressed: this.click,
                ),
              ),
            )));
  }
}
