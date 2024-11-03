import 'package:flutter/material.dart';
import 'post.dart';


// now we make a listview that is going to be able to display all of this posts and we are going to have to put that inside of the body, so we have to make a new widget that will be postlist
// to do this we make a stateful widget

class PostList extends StatefulWidget {
  // const PostList({super.key});

  // first we create a list in here that is going to store all the posts.
  // this is where our post class is being introduced to this class.
  final List<Post> listItems;

  // the idea is this postlist will take a bunch of post and it will display them for us
  PostList(this.listItems);

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  // now we add a setstate for liking a message
  void like(Function callback) {
    this.setState(() {
      callback();
    });
  }

  @override
  Widget build(BuildContext context) {
    // listview.builder usually allows us to define a way to construct items
    // we pick how many items are in the list and then we say this is the function we wanna call whenever a new item is added to this list
    // what that function will do is actually generate what 1 item in the list will look like
    // the reason for this interms of a flutter backend is that we dont wanna render every single widget all the time
    //  we only wanna render widgets that are visible
    return ListView.builder(
      // below just defines how long this listview is
      itemCount: this.widget.listItems.length,
      //   now we define a function that will tell us how we build each individual item
      itemBuilder: (context, index) {
        //   this parenthesis denote a function
        //   in here we can use index to display specific items
        var post = this.widget.listItems[index];
        // the card below is just a simple block with a border to it to separate our items out
        // we want body text, author and to the right side a like icon
        // we want a row to hold our body text and author which will be in one kind of section of the row and to the right side of the row we have the like icon and the number of likes.
        // remember expanded only fills the entire space.
        // cards have a little bit of padding and separation btw them.
        return Card(
            child: Row(children: <Widget>[
              // the first child will be a list tile(this gives us a nice way to format what we want ie. body text and author)
              // we are wrapping the post.body in a text widget because it is a string and it can just be assigned to a normal widget, must be text.

              Expanded(
                  child: ListTile(
                    title: Text(post.body),
                    subtitle: Text(post.author),
                  )),
              Row(children: <Widget>[
                // we add something to tell us the number of likes received
                // because it's text we need to put that to string below
                // Inside of below text we need to make the font bigger.
                Container(
                  // padding is just the amount of pixels separated btw the widget and another widget
                  //   this widget is going to be to the left of where the  icon button is so we add padding to the right side of this so it pushes it away from the other widget
                  padding: EdgeInsets.fromLTRB(
                      0, 0, 10, 0), // Right padding to separate it from the icon
                  child: Text(
                    post.likes.toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                IconButton(
                    icon: Icon(Icons.thumb_up),
                    // we need to call a method when we press the below button
                    // for the widget to update when we click the like button we
                    // we make the below an arrow function since without the void function like wont work since it doesn't return anything
                    // this is not important but likes using it to reference one being used
                    onPressed: () => this.like(post.likePost),
                    //   now we add color to the buttons if the user has liked post
                    color: post.userLiked ? Colors.green : Colors.black)
              ])
            ]));
      },
    );
  }
}
