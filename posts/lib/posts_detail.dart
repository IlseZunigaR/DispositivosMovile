import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:posts/comments.dart';
import 'package:posts/posts.dart';

int identifier;

class PostsDetail extends StatefulWidget {
  final Post post;
  PostsDetail({this.post});

  @override
  _PostsDetailState createState() => _PostsDetailState();
}

class _PostsDetailState extends State<PostsDetail>{
  String url = "https://jsonplaceholder.typicode.com/comments?postId=1";
  Comments comments;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    var response = await http.get(url);
    var decodedJson = jsonDecode("{\"comments\":" + response.body +"}");
    comments = Comments.fromJson(decodedJson);
    print(comments.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    url = "https://jsonplaceholder.typicode.com/comments?postId=" + widget.post.toString();
    print(url);
    //fetchData();

    return Scaffold(
        drawer: Drawer(),
        body: comments == null ? Center(child: CircularProgressIndicator(),) : ListView(
          children: <Widget>[
            Text(widget.post.title),
            Text(widget.post.body),
            Row(
              children: comments.comment.map((e) => ListTile(
                title: Text(e.email),
                subtitle: Text(e.body),
              )).toList(),
            ),
          ],
        )
    );
  }
}