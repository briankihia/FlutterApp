import 'package:flutter/material.dart';
// what we want for this is we want there be a bunch of posts every single time we type a message
// we want our post to have some type of body text/main text, author, no of likes
// so you can like/unlike the post


void main() {
  runApp(MyApp());
}

// we create a datastructure to hold all of our post and all that information, we make a new class called post
// the class is not a widget, only pure vanilla class

class Post {
  String body;
  String author;
  int likes = 0 ;
  bool userLiked = false;


//   we are going to make it mandatory when you make a post you pass a body adn the author
  Post(this.body, this.author);
//   now we are going to add a method that is going to be run whenever a user likes this post
// so we would add 1 to the likes of this post or subtract 1 if user has already clicked it or not

  void likePost() {
    // below will reverse whatever this is, so if user liked is false and then we call this it will become true and reverse applies
    // applies to even the if else below
    this.userLiked = !this.userLiked;
    if (this.userLiked) {
      this.likes += 1;
    } else {
      this.likes -= 1;
    }
  }

  // upto here we have uor post class
  //what we need to know now is where are we going to draw this listview and how are we going to keep track of all of this posts
//     we go to changetext class
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



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

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
      posts.add(new Post(text, "Tim"));
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
          TextInputWiget(this.newPost)


          // Text(this.text)
        ])
    );

  }
}



class TextInputWiget extends StatefulWidget {


  final Function(String) callback;

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

    return
      TextField(

      //   type of below controller is textEditingController
      //   it is representing this typing text part
      controller: this.controller,
      decoration: InputDecoration(

          prefixIcon: Icon(Icons.message), labelText: "Type a message",
          suffixIcon: IconButton(icon: Icon(Icons.send,color: Colors.orange),

            splashColor: Colors.blue,

            tooltip: "Post Message",
            onPressed: this.click,
          )));


  }
}


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
        return Card(child: Row(children: <Widget>[
          // the first child will be a list tile(this gives us a nice way to format what we want ie. body text and author)
          // we are wrapping the post.body in a text widget because it is a string and it can just be assigned to a normal widget, must be text.

          Expanded(child: ListTile(
            title: Text(post.body),
            subtitle: Text(post.author) ,)),
          Row(children: <Widget>[
            // we add something to tell us the number of likes received
            // because it's text we need to put that to string below
            // Inside of below text we need to make the font bigger.
            Container(
              // padding is just the amount of pixels separated btw the widget and another widget
              //   this widget is going to be to the left of where the  icon button is so we add padding to the right side of this so it pushes it away from the other widget
              padding: EdgeInsets.fromLTRB(0, 0, 10, 0), // Right padding to separate it from the icon
              child: Text(
                post.likes.toString(),
                style: TextStyle(fontSize: 20),
              ),
            ),
            IconButton(icon: Icon(Icons.thumb_up),
              // we need to call a method when we press the below button
              // for the widget to update when we click the like button we
              // we make the below an arrow function since without the void function like wont work since it doesn't return anything
              // this is not important but likes using it to reference one being used
              onPressed:()=> this.like(post.likePost),
            //   now we add color to the buttons if the user has liked post
              color: post.userLiked ? Colors.green : Colors.black
            )])
        ]));
      },
    );
  }
}



