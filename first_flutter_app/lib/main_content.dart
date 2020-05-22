import 'package:flutter/material.dart';

class MainContent extends StatelessWidget{

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("First App"),
      ),
      body: Container(
        height: 500,
        width: 500,
        child: Center(
          child: Text("Hola",style: TextStyle(fontSize: 100.0, fontFamily: "Prueba", color: Colors.white), ),
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/img/cover.jpg'),
          )
        ),
      ),

      /*body: Stack(
          children: <Widget>[
            Container(
              height: 200,
              width: 200,
              color: Colors.blue,
            ),
            Container(
              height: 180,
              width: 180,
              color: Colors.red,
            ),
            Container(
              height: 160,
              width: 160,
              color: Colors.yellow.withOpacity(0.5),
            ),
          ],
      ),*/
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.account_balance),
        backgroundColor: Colors.pinkAccent,
      ),
    );
  }
  
  /*Container(
              height: 100,
              width: 100,
              color: Colors.blue,
            )*/

  Widget createColumn(){
    return Row( //Column o Row
      //fuera del children
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text("HOLA", style: TextStyle(fontSize: 30.0, color: Colors.blue),),
        Text("que", style: TextStyle(fontSize: 25.0, color: Colors.green),),
        Text("haces", style: TextStyle(fontSize: 20.0, color: Colors.red),)
      ],
    );
  }

}