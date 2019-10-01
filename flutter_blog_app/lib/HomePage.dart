import 'package:flutter/material.dart';
import 'Authentication.dart';

class HomePage extends StatefulWidget
{
  HomePage({
    this.auth,
    this.onSignedOut,
  });
  final AuthImplementaion auth;
  final VoidCallback onSignedOut;
  
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>
{
  void _logoutUser() async
  { 
    try
    {
        await  widget.auth.signOut();
        widget.onSignedOut();
    }
    catch(e)
    {print(e.toString());

    }
    

  }
@override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Anasayfa",style: TextStyle(color: Colors.white)),
      ),
      body: new Container(

      ),
      bottomNavigationBar: new BottomAppBar
      (
        color: Colors.orange,
        child: new Container
        (
          margin: const EdgeInsets.only(left: 50.0, right: 50.0),
          child: new Row
          (
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              new IconButton
              (
                 icon: new Icon(Icons.arrow_back_ios),
                  iconSize: 50,
                  color: Colors.white,
                  onPressed: _logoutUser,
              ),
                new IconButton
              (
                  icon: new Icon(Icons.all_out),
                  iconSize: 50,
                  color: Colors.white,
                  onPressed: null,
              ),
                new IconButton
              (
                  icon: new Icon(Icons.art_track),
                  iconSize: 50,
                  color: Colors.white,
                  onPressed: null,
              )
            ],
          ),
        ),
      ),
    );
  }
}