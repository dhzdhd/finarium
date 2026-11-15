import 'dart:math';

import 'package:finarium/src/categories/category_palette.dart';
import 'package:finarium/src/categories/controllers/categories_controller.dart';
import 'package:finarium/src/categories/models/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const _customValue = 1;
const _automaticValue = 0;

Future<void> editCategory(
  BuildContext context,
  WidgetRef ref, {
  Category? existing,
}) async {
  final result = await CategorySheet.show(context, existing: existing);
  if (result == null) return;
  await ref
      .read(categoriesControllerProvider.notifier)
      .save(result, previousName: existing?.name);
}

class CategorySheet extends ConsumerStatefulWidget {
  const CategorySheet({super.key, this.existing});

  final Category? existing;

  /// Resolves to the category to save, or null if dismissed or deleted.
  static Future<Category?> show(BuildContext context, {Category? existing}) {
    return showModalBottomSheet<Category>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      showDragHandle: true,
      builder: (context) => CategorySheet(existing: existing),
    );
  }

  @override
  ConsumerState<CategorySheet> createState() => _CategorySheetState();
}

class _CategorySheetState extends ConsumerState<CategorySheet> {
  final _random = Random();
  late final _name = TextEditingController(text: widget.existing?.name);
  late int _automatic = randomCategoryColor(_random);
  int? _picked;
  int? _custom;
  String? _error;

  @override
  void initState() {
    super.initState();
    _picked = widget.existing?.colorValue;
    if (_picked != null && !_isPalette(_picked!)) _custom = _picked;
  }

  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }

  bool _isPalette(int value) =>
      categoryPalette.any((colour) => colour.value == value);

  int get _color => _picked ?? _automatic;

  void _onNameChanged(String _) {
    setState(() {
      _error = null;
      _automatic = randomCategoryColor(_random);
    });
  }

  Future<void> _chooseCustom() async {
    final picked = await showDialog<int>(
      context: context,
      builder: (context) => _CustomColorDialog(initial: _custom ?? _color),
    );
    if (picked == null || !mounted) return;
    setState(() {
      _custom = picked;
      _picked = picked;
    });
  }

  void _onColourChanged(int value) {
    if (value == _customValue) {
      _chooseCustom();
      return;
    }
    setState(() => _picked = value == _automaticValue ? null : value);
  }

  void _save() {
    final name = _name.text.trim();
    final others =
        ref.read(categoriesControllerProvider).value ?? const <Category>[];
    final taken = others.any(
      (c) =>
          c.id != widget.existing?.id &&
          c.name.toLowerCase() == name.toLowerCase(),
    );
    final error = name.isEmpty
        ? 'Enter a name'
        : taken
        ? '$name already exists'
        : null;
    if (error != null) {
      setState(() => _error = error);
      return;
    }

    Navigator.pop(
      context,
      Category(
        id:
            widget.existing?.id ??
            DateTime.now().microsecondsSinceEpoch.toString(),
        name: name,
        colorValue: _color,
        sortOrder: widget.existing?.sortOrder ?? 0,
      ),
    );
  }

  Future<void> _delete() async {
    final existing = widget.existing;
    if (existing == null) return;

    final removed = await ref
        .read(categoriesControllerProvider.notifier)
        .delete(existing);
    if (!mounted) return;

    if (removed) {
      Navigator.pop(context);
    } else {
      setState(
        () => _error = '${existing.name} is used by transactions or budgets',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isEditing = widget.existing != null;
    final color = categoryColorOf(_color);
    final initial = _name.text.trim().isEmpty
        ? '?'
        : _name.text.trim()[0].toUpperCase();

    final colourValue = _picked == null
        ? _automaticValue
        : _isPalette(_picked!)
        ? _picked!
        : _customValue;

    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: MediaQuery.viewInsetsOf(context).bottom + 20,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 20,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    isEditing ? 'Edit category' : 'New category',
                    style: theme.textTheme.headlineSmall,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            TextField(
              controller: _name,
              autofocus: !isEditing,
              textCapitalization: TextCapitalization.words,
              onChanged: _onNameChanged,
              decoration: InputDecoration(
                labelText: 'Name',
                errorText: _error,
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 12, right: 8),
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: color.withValues(alpha: 0.2),
                    child: Text(
                      initial,
                      style: theme.textTheme.titleSmall?.copyWith(color: color),
                    ),
                  ),
                ),
                prefixIconConstraints: const BoxConstraints(
                  minWidth: 0,
                  minHeight: 0,
                ),
                border: const OutlineInputBorder(),
              ),
            ),
            DropdownButtonFormField<int>(
              initialValue: colourValue,
              isExpanded: true,
              decoration: const InputDecoration(
                labelText: 'Colour',
                border: OutlineInputBorder(),
              ),
              items: [
                DropdownMenuItem(
                  value: _automaticValue,
                  child: _ColorOption(
                    color: categoryColorOf(_automatic),
                    label: 'Automatic',
                    hex: colorHex(_automatic),
                  ),
                ),
                for (final option in categoryPalette)
                  DropdownMenuItem(
                    value: option.value,
                    child: _ColorOption(
                      color: categoryColorOf(option.value),
                      label: option.name,
                      hex: option.hex,
                    ),
                  ),
                DropdownMenuItem(
                  value: _customValue,
                  child: _custom == null
                      ? const _ColorOption(
                          color: null,
                          label: 'Custom',
                          hex: 'Pick a colour',
                        )
                      : _ColorOption(
                          color: categoryColorOf(_custom!),
                          label: 'Custom',
                          hex: colorHex(_custom!),
                        ),
                ),
              ],
              onChanged: (value) {
                if (value != null) _onColourChanged(value);
              },
            ),
            if (isEditing)
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: _delete,
                  child: Text(
                    'Delete category',
                    style: TextStyle(color: colorScheme.error),
                  ),
                ),
              ),
            Row(
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: colorScheme.primary),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: FilledButton(
                    onPressed: _save,
                    style: FilledButton.styleFrom(
                      minimumSize: const Size.fromHeight(56),
                      shape: const StadiumBorder(),
                    ),
                    child: const Text('Save category'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ColorOption extends StatelessWidget {
  const _ColorOption({
    required this.color,
    required this.label,
    required this.hex,
  });

  final Color? color;
  final String label;
  final String hex;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color ?? colorScheme.surfaceContainerHighest,
            border: color == null
                ? Border.all(color: colorScheme.outline)
                : null,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            '$label · $hex',
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}

class _CustomColorDialog extends StatefulWidget {
  const _CustomColorDialog({required this.initial});

  final int initial;

  @override
  State<_CustomColorDialog> createState() => _CustomColorDialogState();
}

class _CustomColorDialogState extends State<_CustomColorDialog> {
  late int _red = (widget.initial >> 16) & 0xFF;
  late int _green = (widget.initial >> 8) & 0xFF;
  late int _blue = widget.initial & 0xFF;

  int get _value => 0xFF000000 | (_red << 16) | (_green << 8) | _blue;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Custom colour'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 8,
        children: [
          Container(
            height: 56,
            decoration: BoxDecoration(
              color: Color(_value),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          Text(colorHex(_value), textAlign: TextAlign.center),
          _channel('Red', _red, Colors.red, (v) => setState(() => _red = v)),
          _channel(
            'Green',
            _green,
            Colors.green,
            (v) => setState(() => _green = v),
          ),
          _channel('Blue', _blue, Colors.blue, (v) => setState(() => _blue = v)),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: () => Navigator.pop(context, _value),
          child: const Text('Select'),
        ),
      ],
    );
  }

  Widget _channel(
    String label,
    int value,
    Color activeColor,
    ValueChanged<int> onChanged,
  ) {
    return Row(
      children: [
        SizedBox(width: 56, child: Text(label)),
        Expanded(
          child: Slider(
            value: value.toDouble(),
            min: 0,
            max: 255,
            activeColor: activeColor,
            onChanged: (v) => onChanged(v.round()),
          ),
        ),
        SizedBox(width: 36, child: Text('$value')),
      ],
    );
  }
}
