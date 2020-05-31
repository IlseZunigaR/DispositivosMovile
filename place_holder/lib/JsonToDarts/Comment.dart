
//ESTA CLASE SE HIZO APARTIR CON JSON TO DART PARA TENER ACCESO A LOS DATOS DEL JSON
//EN ESTE CASO COMMENTS CON SUS ATRIBUTOS CORRESPONDIENTES.
class Comment {
  int postId;
  int id;
  String name;
  String email;
  String body;

  Comment({this.postId, this.id, this.name, this.email, this.body});

  Comment.fromJson(Map<String, dynamic> json) {
    postId = json['postId'];
    id = json['id'];
    name = json['name'];
    email = json['email'];
    body = json['body'];
  }
}