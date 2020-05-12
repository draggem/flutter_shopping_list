import 'package:flutter/material.dart';
import '../Logic/list.dart';

class NewItem extends StatefulWidget{

  //Need to pass the add/remove functions
  final Function addItem;
  NewItem(this.addItem);


  @override
  _Newcarttate createState() => _Newcarttate();
}

class _Newcarttate extends State<NewItem>{

  //checks if user entered in the textbox
  bool noItem = true;


  //check function
  void checkText(text) {
    setState(() {
      if (text != ''){
        noItem = false;
        print("hi");
      }else{
        noItem = true;
      }
    });
  }


  //Pop-up function/widget
  Future<String> _asyncInputDialog(BuildContext context) async {
    String itemName = '';
    return showDialog<String>(
      context: context,
      barrierDismissible: false, // dialog is dismissible with a tap on the barrier
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
                  onChanged: (text) {
                    itemName = text;
                    checkText(text);
                  },
                ),
              ),
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
                if (itemName != '' || itemName != null) {
                  widget.addItem(itemName);
                  Navigator.of(context).pop(itemName);               
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
