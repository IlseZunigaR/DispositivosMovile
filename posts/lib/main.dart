import 'package:flutter/material.dart';
import 'package:posts/posts_list.dart';

void main(){
  runApp(MaterialApp(
    title: "Posts",
    home: PostsList(),
    debugShowCheckedModeBanner: false,
  ));
}
