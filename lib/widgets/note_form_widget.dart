import 'package:flutter/material.dart';

class NoteFormWidget extends StatelessWidget {
  final bool? isImporant;
  final int? priorityLevel;
  final String? title;
  final String? description;

  final ValueChanged<bool> onChangedImportant;
  final ValueChanged<int> onChangedPriorityLevel;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  const NoteFormWidget(
      {Key? key,
      this.isImporant = false,
      this.priorityLevel = 0,
      this.title = '',
      this.description = '',
      required this.onChangedImportant,
      required this.onChangedPriorityLevel,
      required this.onChangedTitle,
      required this.onChangedDescription})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildTitle(),
        const SizedBox(height: 8.0),
        buildDescription(),
        const SizedBox(height: 8.0),
        Row(
          children: [
            const Text(
              'Is Important ?',
              style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Switch(value: isImporant ?? false, onChanged: onChangedImportant),
          ],
        ),
        const SizedBox(height: 8.0),
        Row(
          children: [
            const Text(
              'Priority Level : ',
              style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Expanded(
              child: Slider(
                min: 0,
                max: 5,
                value: (priorityLevel ?? 0).toDouble(),
                onChanged: (priorityLevel) =>
                    onChangedPriorityLevel(priorityLevel.toInt()),
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget buildTitle() => TextFormField(
        maxLines: 1,
        initialValue: title,
        style: const TextStyle(
            color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 24.0),
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Title',
          hintStyle: TextStyle(
            color: Colors.white60,
          ),
        ),
        validator: (title) =>
            title != null && title.isEmpty ? 'Title cannot be empty' : null,
        onChanged: onChangedTitle,
      );
  Widget buildDescription() => TextFormField(
        maxLines: 5,
        initialValue: description,
        style: const TextStyle(
            color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 24.0),
        decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'Description',
            hintStyle: TextStyle(color: Colors.white60)),
        validator: (description) => description != null && description.isEmpty
            ? 'Description cannot be empty'
            : null,
        onChanged: onChangedDescription,
      );
}
