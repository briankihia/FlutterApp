import 'package:flutter/material.dart';
import 'post.dart';
import 'postList.dart';
import 'textInputWidget.dart';

class MyHomePage extends StatefulWidget {
  final String name;

  // we are setting up a constructor here that says everytime we make a new homepage pass me a name
  // when we load this we are passing a name in and we use that as the author
  // before here we are passing the name to my homepage when this page is  being rendered in loginpage
  MyHomePage(this.name);

  // const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // String text = "";
  // we make an attribute, doesn't have to be final
  List<Post>posts = [];


  void newPost(String text) {

    this.setState(() {
      // this.text = text;
      // what we now do is make a new post and add it to the post list
      //   posts.add(new Post(text, author));
      //   supposed to be like above but for now we leave the author as  "tim"
      posts.add(new Post(text, widget.name));
      //   now we change the callback method we are passing to the body

    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(title: Text("Hello Brian"),backgroundColor: Theme.of(context).primaryColor, ),

        body: Column(children: <Widget>[
          // expanded just makes sure that everything we have as a child actually fills an entire area(spreads it to feel as large as it can)
          //   if u ever encounter an error where something doesn't have a size, just use expand, it will
          //   we have changed position of the postlist and textinputwiget so that it can take up the position of like text apps

          Expanded(child: PostList(this.posts)),
          // the textInputWidget doesn't need to be expanded since it already has a height
          // expanding it makes it not fit at the bottom properly
          TextInputWidget(this.newPost)


          // Text(this.text)
        ])
    );

  }
}

