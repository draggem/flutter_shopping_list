import 'package:flutter/material.dart';
import 'package:shopping_list_app/Logic/list.dart';
import '../Widgets/dismissable.dart';
import '../Widgets/add_item.dart';

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
      body: ListSection(checkItem, removeItem),
      floatingActionButton: NewItem(addItem),
    );
  }


  //Function to add Item in dismissable
  void addItem(itemName){
    setState(() {
      cart.add(itemName);
    });
  }
  
  void checkItem(itemName, itemIndex){
    bag.add(itemName);
      cart.removeAt(itemIndex);
      print ("Cart" + cart.toString());
      print ("List" + bag.toString());
    // setState(() {
      
    // });
  }

  void removeItem(itemIndex){
     setState(() {
      cart.removeAt(itemIndex);
    });
  }
}
