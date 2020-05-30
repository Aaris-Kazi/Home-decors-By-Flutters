
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:homedecor/homedecor.dart';
//import 'package:homedecor/test.dart';

main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.cyan,
        primaryColor: defaultTargetPlatform == TargetPlatform.android 
        ? Colors.grey : null
      ),
      home: new MyHomePage(),
      routes: <String, WidgetBuilder>{
        "/a": (BuildContext context)=> new NewPage('New Page'),
        "/b": (BuildContext context)=> new NewPage('Second Page'),
      }
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Decor'),
        elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text('Aaris Kazi'), 
              accountEmail: new Text('aariskazi@gmail.com'),
              currentAccountPicture: new CircleAvatar(
                backgroundColor: Colors.amberAccent,
                child: new Text("A"),
              ),
              otherAccountsPictures: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: new Text("P"),
                ),
              ],
              ),
            ListTile(
              title: Text("Structure"),
              trailing: Icon(Icons.home),
              onTap: () {
                 Navigator.of(context).pop();
                 Navigator.of(context).pushNamed("/a");
              } 
            ),
            ListTile(
              title: Text("Styling"),
              trailing: Icon(Icons.brush),
              onTap: () {
                 Navigator.of(context).pop();
                 Navigator.of(context).pushNamed("/b");
              }
            ),
            Divider(),
            ListTile(
              title: Text("Close"),
              trailing: Icon(Icons.close),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
      body: new Container(
        child: Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}