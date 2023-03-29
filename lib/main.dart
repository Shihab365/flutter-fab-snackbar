import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: "FAB and SnackBar",
      home: Scaffold(
        appBar: AppBar(title: Text("FAB and SnackBar"),),
        body: getListView(),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            debugPrint("FAB CLICK");
          },
          child: Icon(Icons.add),
        ),
      ),
    )
  );
}

void showSnackbar(BuildContext context, String items){
  var snackBar = SnackBar(
      content: Text("You Tapped $items"),
          action: SnackBarAction(
      label: "UNDO",
      onPressed: (){
        debugPrint("UNDO CLICK");
      }
  ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

List<String> getDataItems(){
  var listItem = List<String>.generate(100, (counter) => "Item $counter");
  return listItem;
}

Widget getListView(){
  var listItems = getDataItems();
  var listview = ListView.builder(itemBuilder:(context, index){
    return ListTile(
      leading: Icon(Icons.arrow_right),
      title: Text(listItems[index]),
      onTap: (){
        showSnackbar(context, listItems[index]);
      },
    );
  });
  return listview;

}