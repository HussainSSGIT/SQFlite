import 'package:flutter/material.dart';
import '../db/notes_database.dart';
import '../model/item.dart';
import '../model/order.dart';

class AddEditNotePage extends StatefulWidget {

  const AddEditNotePage({
    Key? key,
  }) : super(key: key);
  @override
  _AddEditNotePageState createState() => _AddEditNotePageState();
}

class _AddEditNotePageState extends State<AddEditNotePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) =>
      Scaffold(

        body: Center(
          child: Form(
              child: buildButton()
          ),
        ),
      );

  Widget buildButton() {
    //final isFormValid = source.isNotEmpty && destination.isNotEmpty;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              onPrimary: Colors.white,
            ),
            onPressed: addOrder,
            child: Text('Save Order'),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              onPrimary: Colors.white,
            ),
            onPressed: addItem,
            child: Text('Save Item'),
          ),
        ),
      ],
    );
  }

  Future addOrder() async {
    const order = Order(
      source: 'Location 1',
      destination: 'Location 2',
    );

    await MyDatabase.instance.create(Order.tableName, order);
  }

  Future addItem() async {
    const item = Item(
        itemName: 'Item 1',
        orderId: -1
    );

    await MyDatabase.instance.create(Item.tableName, item);
  }
}
