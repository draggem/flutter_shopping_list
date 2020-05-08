import 'package:flutter/material.dart';

class NewItem extends StatelessWidget {

  //Function to pop-out text item
    Future<String> _asyncInputDialog(BuildContext context) async {
      String itemName = '';
      return showDialog<String>(
        context: context,
        barrierDismissible:
            false, // dialog is dismissible with a tap on the barrier
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Enter an item'),
            content: new Row(
              children: <Widget>[
                new Expanded(
                    child: new TextField(
                  autofocus: true,
                  decoration: new InputDecoration(
                      labelText: 'Item Name', hintText: 'eg. Milk'),
                  onChanged: (value) {
                    itemName = value;
                  },
                ))
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop(null);
                },
              ),
              FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  //Nothing to do here
                  Navigator.of(context).pop(itemName);
                },
              ),
            ],
          );
        },
      );
    }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        final String currentTeam = await _asyncInputDialog(context);
        print("Current team name is $currentTeam");
      },
      tooltip: 'Add new item',
      child: Icon(Icons.add),
    ); // This trailing comma makes auto-formatting nicer for build methods.


  }
}
