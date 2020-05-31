//ESTE ES EL METODO PRINCIPAL DE LA APLICACION
//SIN EL LA APLICACIÓN PROBABLEMENTE NO CORRERIA
import 'package:flutter/material.dart';
import 'package:placeholder/post_list.dart';

void main(){
  runApp(MaterialApp(
    title: "Post App",
    home: PostList(),
    debugShowCheckedModeBanner: false,
    ));
}