import 'package:flutter/material.dart';


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