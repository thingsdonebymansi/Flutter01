import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoItem extends StatelessWidget {
  final bool isChecked;
  final String todoText;

  final Function(bool?)? onChanged;
  final Function(BuildContext)? onPressed;

  TodoItem({
    super.key,
    required this.isChecked,
    required this.todoText,
    this.onChanged,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: onPressed,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: const Color.fromARGB(148, 139, 110, 196),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Checkbox(value: isChecked, onChanged: onChanged),
              Text(
                todoText,
                style: TextStyle(
                  decoration:
                      isChecked
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
