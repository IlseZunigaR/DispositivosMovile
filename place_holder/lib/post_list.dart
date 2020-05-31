import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:placeholder/JsonToDarts/Post.dart';
import 'package:placeholder/get_data.dart';

import 'comments.dart';

class PostList extends StatefulWidget {
  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList>{
  Data data = new Data();
  //SE DECLARO UNA VARIABLE TIPO LISTA QUE ES ESTAS SON DINAMICAS Y FUNCIONAN
  //MUY BIEN PARA ALMACENAR N DATOS
  List<Post> post = List<Post>();
  @override

  void initState() {
    data.getPost().then((value) => setState((){
      post.addAll(value);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("POST DEL API PLACE HOLDER", style: GoogleFonts.amaticSc(color: Colors.black87, fontSize: 40),),
        backgroundColor: Colors.amberAccent,
        centerTitle: true,
        ),
      //LA LINEA DE ABAJO INDICA QUE SI EL POST ES IGUAL A ¿NULO? O NO MUESTRE UNA INDICADOR DE CARGANDO
      //AVISA AL USUARIO QUE SE ESTAN CARGANDO LOS DATOS
      body: post == null ?  Center(child: CircularProgressIndicator(),) :
      new ListView.builder(
        itemCount: post.length,
        itemBuilder: (BuildContext context, int index) {
          return new Container(
            child: new Center(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new Card(
                    child: new ListTile(
                      //DENTRO DE TITLE SE LLAMO AUN TEXTO Y DENTRO DE ESTE SE LLAMO A POR MEDIO DEL INDICE DE LA LISTA DE POST
                      //A CADA UNO DE DE LOS "TITLES" DE LA LISTA DINAMICA DE POST
                      title:new Text(post[index].title,style: GoogleFonts.chelseaMarket(fontSize:18),textAlign: TextAlign.left,),
                        //DENTRO DE SUBTITLE SE LLAMO A UN TEXTO PERO EN ESTE OCACION SE USO POR MEDIO DEL INDICE AL "BODY"
                        //CORRESPONDIENTES A LOS TITULOS YA ANTES LLAMADOS
                      subtitle: new Text("\n${post[index].body}",style: GoogleFonts.reemKufi(fontSize:14),textAlign: TextAlign.left,),
                      leading: Icon(Icons.account_circle,size: 40,color: Colors.black,),
                      contentPadding: const EdgeInsets.all(10.0),
                      onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => Comments(post: post[index],)));
                      },
                      ),
                    elevation: 2.1,
                    ),
                ],
                ),
              ),
            );
        },
        ),
      );
  }
}