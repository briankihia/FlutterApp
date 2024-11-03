import 'package:flutter/material.dart';


class TextInputWidget extends StatefulWidget {
  final Function(String) callback;

  TextInputWidget(this.callback);

  @override
  _TextInputWidgetState createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  final controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void click() {
    widget.callback(controller.text);
    controller.clear();
    // we add such that when a post is submitted, the texting place collapses
    //    so now the text gets cleared and keyboard collapses
    //   we use an existing function
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(

      //   type of below controller is textEditingController
      //   it is representing this typing text part
        controller: this.controller,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.message),
            labelText: "Type a message",
            suffixIcon: IconButton(
              icon: Icon(Icons.send, color: Colors.orange),
              splashColor: Colors.blue,
              tooltip: "Post Message",
              onPressed: this.click,
            )));
  }
}