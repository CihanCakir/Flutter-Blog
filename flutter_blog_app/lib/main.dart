import 'package:flutter/material.dart';
import 'Mapping.dart';
import 'Authentication.dart';
void main() 
{

  runApp(new BlogApp());

}
class BlogApp extends StatelessWidget
{
@override
  Widget build(BuildContext context) {
   return new MaterialApp
   (
     
     theme: new ThemeData
     (
       primarySwatch: Colors.orange,
     ),
    home: MappingPage (auth: Auth(),),
   );
  }
}