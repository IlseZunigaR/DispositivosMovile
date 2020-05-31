//DENTRO DE ESTA CLASE SE ALMACENARON DOS METODOS CADA UNO CON SU FUNCION CON LA
//SIMILITUD QUE ESTOS HACEN DOS GET DE DOS URLS DISTINTOS PERO QUE COMPARTEN
//PERTENECER AL MISMO UNIVERSO POR ASI DECIRLO
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'JsonToDarts/Comment.dart';
import 'JsonToDarts/Post.dart';

class Data {
  //SE DECLARO EL PRIMER METODO QUE PARA RESUMIR HACE LA LLAMADA A TODOS LOS POST
  //CON TODA SU INFORMACION Y ESTE LOS VA ACUMULANDO
  Future<List<Post>> getPost() async {
    var url = 'https://jsonplaceholder.typicode.com/posts';
    var response = await http.get(url);
    var posts = List<Post>();
    if (response.statusCode == 200 ) {
      var postsJson = json.decode(response.body);
      for (var postJson in postsJson) {
        posts.add(Post.fromJson(postJson));
      }
    }
    return posts;
  }
  //SE DECLARO EL SEGUNDO METODO QUE DENTRO DE ESTE LO QUE HACE ES POR MEDIO DE LOS ID DE LOS POST
  //MOSTRAR LOS COMENTARIOS RELACIONADOS A ESE POST ESTE METODO ES MUY IMPORTANTE
  //PARA HACER LA RELACION ENTRE POST Y COMENTARIOS
  Future<List<Comment>> getComments(int postId) async {
    //MUY IMPORTANTE AQUI DENTRO DE LO QUE ES $POSTID ESTO CADA TAP DE CADA POST TIENE UN ID ASI QUE CADA ID DE CADA POST TIENE SU
    //CORRESPONDIENTE GET A LA HORA DE LLAMAR A LOS DAROS
    var url = 'https://jsonplaceholder.typicode.com/posts/$postId/comments';
    var response = await http.get(url);
    var comments = List<Comment>(); //Lista donde se almacenarán los objetos de cada comentario.

    if (response.statusCode == 200) {
      var commentsJson = json.decode(response.body);
      for (var commentJson in commentsJson) {
        comments.add(Comment.fromJson(commentJson));
      }
    }
    return comments;
  }
}