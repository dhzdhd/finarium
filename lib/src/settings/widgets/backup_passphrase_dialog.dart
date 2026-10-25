import 'package:flutter/material.dart';

class BackupPassphraseDialog extends StatefulWidget {
  const BackupPassphraseDialog({super.key});

  @override
  State<BackupPassphraseDialog> createState() => _BackupPassphraseDialogState();
}

class _BackupPassphraseDialogState extends State<BackupPassphraseDialog> {
  final _passphrase = TextEditingController();
  var _obscure = true;

  @override
  void dispose() {
    _passphrase.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Encrypted backup'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 12,
        children: [
          const Text(
            'Your backup is encrypted with this passphrase. '
            'You will need it to restore.',
          ),
          TextField(
            controller: _passphrase,
            obscureText: _obscure,
            decoration: InputDecoration(
              labelText: 'Passphrase',
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscure
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                ),
                onPressed: () => setState(() => _obscure = !_obscure),
              ),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Export'),
        ),
      ],
    );
  }
}
