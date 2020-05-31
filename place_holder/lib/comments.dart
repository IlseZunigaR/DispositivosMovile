import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'JsonToDarts/Comment.dart';
import 'JsonToDarts/Post.dart';
import 'get_data.dart';

class Comments extends StatefulWidget {
  final Post post;
  Comments({@required this.post});
  @override
  CommentsState createState() => CommentsState();
}

class CommentsState extends State<Comments> {
  Data data = new Data();
  List<Comment> comments = List<Comment>();
  @override
  void initState() {
    super.initState();
    data.getComments(widget.post.id).then((value) =>
        setState(() {comments.addAll(value);}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("HOLA AQUI ESTAN LO COMENTARIOS",style: GoogleFonts.amaticSc(color: Colors.black,fontSize:28),),
          backgroundColor: Colors.amberAccent,
          ),
        body: Container(
          child: Column(
            children: <Widget>[
              Card(
                margin: EdgeInsets.all(5),
                  color: Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 16.0, right: 20.0, left: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            //ESTOS TEXT TANTO EL POST Y BODY LO QUE HACEN CUANDO DES CLIC O TAP A CUALQUIER POST DISPONIBLE
                            //ESTE SE MUESTRE EN OTRA PAGINA PERO PATRA ENTRAR EN DETALLES SE MUESTRA EL POST JUNTO CON SU BODY
                            Text(widget.post.title, style:GoogleFonts.chelseaMarket(color: Colors.black,fontSize: 20),textAlign: TextAlign.left,),
                            Text("\n${widget.post.body}", style: GoogleFonts.reemKufi(color: Colors.black87,fontSize:14),
                              ),
                          ],
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          margin: EdgeInsets.all(5),
                          width: MediaQuery.of(context).size.width - 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                              ],
                            ),
                          ),
                        ),
                    ],
                    ),
                ),
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(5),
                    height: MediaQuery.of(context).size.height - 320,
                    //USAMOS UN LISTVIEW PARA VER LOS COMENTARIOS AL IGUAL QUE HICIMOS CON LOS POST EN LA PRIMERA PAGINA
                    child: ListView.builder(
                      itemCount: comments.length,
                          itemBuilder: (context, index) {
                            return Card(
                              color: Colors.white,
                                child: ListTile(
                                  //AQUI COMO LOS ANTERIORES SE MANDO LLAMAR AL "TITLE" Y "BODY" DE CADA POST SIENDO INDEX EL PROTAGONISTA
                                  //DE QUE TODO FUNCIONE Y QUE CADA POST MUESTRE SU CONTENIDO PROPIO
                                    title: Text(comments[index].name,style: GoogleFonts.chelseaMarket(color: Colors.black,fontSize: 16)),
                                    subtitle: Text("${comments[index].body}", style: GoogleFonts.reemKufi(color:Colors.grey,fontSize:13)),
                                  trailing: Icon(Icons.comment),
                                    ),
                              );
                          }),
                    ),
                ],
                )
            ],
            ),
          ));
  }
}