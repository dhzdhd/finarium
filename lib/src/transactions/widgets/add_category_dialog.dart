import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart' show None, Option;

class AddCategoryDialog extends StatefulWidget {
  const AddCategoryDialog({super.key});

  static Future<Option<String>> show(BuildContext context) async {
    final result = await showDialog<Option<String>>(
      context: context,
      builder: (context) => const AddCategoryDialog(),
    );
    return result ?? const None();
  }

  @override
  State<AddCategoryDialog> createState() => _AddCategoryDialogState();
}

class _AddCategoryDialogState extends State<AddCategoryDialog> {
  final _name = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add category'),
      content: TextField(
        controller: _name,
        autofocus: true,
        textCapitalization: TextCapitalization.sentences,
        decoration: const InputDecoration(
          labelText: 'Category name',
          border: OutlineInputBorder(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, const None()),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: () {
            final name = _name.text.trim();
            Navigator.pop(context, Option.fromNullable(name.isEmpty ? null : name));
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}
