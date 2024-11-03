import 'package:flutter/material.dart';
import 'package:myapp/login.dart';
// import 'myHomePage.dart';
// what we want for this is we want there be a bunch of posts every single time we type a message
// we want our post to have some type of body text/main text, author, no of likes
// so you can like/unlike the post

void main() {
  runApp(MyApp());
}

// we create a datastructure to hold all of our post and all that information, we make a new class called post
// the class is not a widget, only pure vanilla class

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
      home: LoginPage(),
    );
  }
}
