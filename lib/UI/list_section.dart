import 'package:flutter/material.dart';

//String list which the items are temporarily stored
final items = List<String>.generate(20, (i) => "Item ${i + 1}");

class ListSection extends StatefulWidget {
  @override
  _ListSectionState createState() => _ListSectionState();
}

class _ListSectionState extends State<ListSection> {
  void run(hell){
    setState(()=>{});
  }
  _ListSectionState();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          final snackbar = SnackBar(
              content: Text("$item dismissed"),
              action: SnackBarAction(
                  label: 'Undo',
                  onPressed: () {
                    setState(() {
                      items.add(item);
                    });
                  }));
          return Dismissible(
            // Each Dismissible must contain a Key. Keys allow Flutter to
            // uniquely identify widgets.
            key: Key(item),
            // Provide a function that tells the app
            // what to do after an item has been swiped away.
            onDismissed: (direction) {
              // Remove the item from the data source.
              setState(() {
                items.removeAt(index);
              });

              // Then show a snackbar.
              Scaffold.of(context).hideCurrentSnackBar();
              Scaffold.of(context).showSnackBar(snackbar);
            },
            // Show a red background as the item is swiped away.
            background: Container(color: Colors.orange),
            child: ListTile(title: Text('$item')),
          );
        },
      ),
    );
  }
}
