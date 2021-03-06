import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:working_with_local_database/models/note.dart';

final _bgColors = [
  Colors.amber.shade200,
  Colors.lightBlue.shade200,
  Colors.lightGreen.shade200,
  Colors.orange.shade200,
  Colors.purple.shade200,
  Colors.pinkAccent.shade200
];

class NoteCardWidget extends StatelessWidget {
  final Note note;
  final int index;
  const NoteCardWidget({Key? key, required this.note, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bgColor = _bgColors[index % _bgColors.length];
    final minHeight = getMinHeight(index);
    final time = DateFormat.yMMMd().format(note.createdTime);
    return Card(
      color: bgColor,
      child: Container(
        constraints: BoxConstraints(minHeight: minHeight),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              time,
              style: const TextStyle(
                color: Color.fromARGB(255, 68, 68, 68),
              ),
            ),
            const SizedBox(
              height: 4.0,
            ),
            Text(
              note.title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }

  double getMinHeight(int index) {
    switch (index % 4) {
      case 0:
        return 100;
      case 1:
        return 150;
      case 2:
        return 150;
      case 3:
        return 75;
      default:
        return 100;
    }
  }
}
