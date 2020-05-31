
//ESTA CLASE SE HIZO APARTIR CON JSON TO DART PARA TENER ACCESO A LOS DATOS DEL JSON
//EN ESTE CASO POST CON SUS ATRIBUTOS CORRESPONDIENTES.
class Post {
  int userId;
  int id;
  String title;
  String body;

  Post({this.userId, this.id, this.title, this.body});

  Post.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }
}