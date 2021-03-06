import 'package:flutter/material.dart';
import '../Logic/list.dart';

class ListSection extends StatefulWidget {
  //need to add add/remove functions
  final Function checkItem;
  final Function removeItem;

  ListSection(this.checkItem, this.removeItem);

  @override
  _ListSectionState createState() => _ListSectionState();
}

class _ListSectionState extends State<ListSection> {
  _ListSectionState();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final item = cart[index];
          final snackbar = SnackBar(
            content: Text("$item dismissed"),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                setState(() => {
                    cart.add(item)
                  },
                );
              }
            ),
          );
          return Dismissible(
              movementDuration: Duration(milliseconds: 600),
              direction: DismissDirection.horizontal,
              key: UniqueKey(),
              onDismissed: (direction) {
                if (direction == DismissDirection.endToStart) {
                  // Remove the item from the data source.
                  widget.removeItem(index);
                } else if (direction == DismissDirection.startToEnd) {
                  //Dismiss  but save to bag
                  widget.checkItem(item, index);
                }
                // Then show a snackbar.
                Scaffold.of(context).hideCurrentSnackBar();
                Scaffold.of(context).showSnackBar(snackbar);
              },
              // Show a red background as the item is swiped away.
              //Checking background
              background: Container(
                alignment: AlignmentDirectional.centerStart,
                color: Colors.green,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                ),
              ),

              //deleting background
              secondaryBackground: Container(
                alignment: AlignmentDirectional.centerEnd,
                color: Colors.red,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
              ),
              child: Center(
                  child: Card(
                child: ListTile(title: Text('$item')),
                color: Colors.yellow.shade50,
              )));
        },
      ),
    );
  }
}
