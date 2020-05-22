import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:posts/posts.dart';
import 'package:posts/posts_detail.dart';
import 'dart:convert';

class PostsList extends StatefulWidget {
  @override
  _PostsListState createState() => _PostsListState();
}

class _PostsListState extends State<PostsList> {
  String url = "https://raw.githubusercontent.com/IlseZunigaR/Posts/master/Posts.json";
  Posts posts;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    var response = await http.get(url);
    var decodedJson = jsonDecode(response.body);
    posts = Posts.fromJson(decodedJson);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("NEW POSTS",
            style: new TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 25.0
            ),
          ),
          backgroundColor: Colors.pink[900],
    ),
       drawer: Drawer(),
       body: posts == null ? Center(child: CircularProgressIndicator(),):
    ListView(
       children: Posts.post.map((p) => InkWell(
       onTap: () {
        Navigator.push(context,MaterialPageRoute(builder: (context) => PostsDetail(post:p)));
      },
        child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Card(
        elevation: 3.2,
        child: ListTile(

        leading: Icon(Icons.contacts,size: 50,),
        title: Text(p.title, style: TextStyle(fontWeight: FontWeight.bold),),
        subtitle: Text(p.body.substring(0,30)),
        ),
       ),
      ),
     )).toList(),
     )
     );
  }
}