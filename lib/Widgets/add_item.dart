import 'package:flutter/material.dart';
import '../Logic/list.dart';
import './dismissable.dart';

class NewItem extends StatefulWidget{
  @override
  _Newcarttate createState() => _Newcarttate();
}

class _Newcarttate extends State<NewItem>{
  bool noItem = false;
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
                ),
              ),
            ],
          ),
          actions: <Widget>[
            //  new Container (
            //     child: noItem ? new Text(
            //       'Must enter an item',
            //       style: TextStyle(
            //         color: Colors.red,
            //         fontStyle: FontStyle.italic,
            //         ),
            //     ):
            //     Text('There is a text may'),
            //   ),
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(null);
              },
            ),
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                widget.addItem;
                //Nothing to do here
                if (itemName != '' || itemName != null) {
                  Navigator.of(context).pop(itemName);
                  cart.add(itemName);                  
                  print(itemName);
                  print(cart);
                  noItem = true;
                } else {
                  noItem = false;
                }
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
        print("You have added $currentTeam in your shopping list!");
      },
      tooltip: 'Add new item',
      child: Icon(Icons.add),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}
