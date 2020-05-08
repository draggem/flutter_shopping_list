import 'package:flutter/material.dart';
import 'package:shopping_list_app/list_section.dart';
import './new_item.dart';
import './list_section.dart';

//String list which the items are temporarily stored
final items = List<String>.generate(20, (i) => "Item ${i + 1}");

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('ESL Menu'),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/header.jpg"),
                  fit: BoxFit.cover,
                ),
                color: Colors.yellow,
              ),
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Templates'),
              onTap: () {
                //Action will be here
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.bug_report),
              title: Text('Report Bugs'),
              onTap: () {
                //Action will be here
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
              onTap: () {
                //Action will be here
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      body: ListSection(items: items),
      floatingActionButton: NewItem(),
    );
  }
}
