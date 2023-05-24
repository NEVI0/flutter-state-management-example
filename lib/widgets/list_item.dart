import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final String name;
  final bool isChecked;

  final Function onCheck;
  final Function onLongPress;

  const ListItem({
    super.key,
    required this.name,
    required this.isChecked,
    required this.onCheck,
    required this.onLongPress
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: () => onLongPress(),
      title: Text(
        name,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: (newCheckedValue) => onCheck()
      ),
    );
  }
}