import 'package:finarium/src/cards/models/bank_card.dart';
import 'package:finarium/src/cards/widgets/bank_card_tile.dart';
import 'package:finarium/src/cards/widgets/edit_card_dialog.dart';
import 'package:finarium/src/cards/widgets/reveal_number_dialog.dart';
import 'package:finarium/src/core/formatters.dart';
import 'package:finarium/src/routes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _cards = [
  BankCard(
    id: 'travel',
    name: 'Travel card',
    network: 'Visa',
    number: '4111111111114242',
    expiry: '08/29',
    color: const Color(0xFF2E3A6B),
    creditLimit: 200000,
    outstanding: 76000,
    spentThisCycle: 31940,
    statementDue: DateTime(2026, 11, 5),
    autofillOn: true,
  ),
  BankCard(
    id: 'everyday',
    name: 'Everyday card',
    network: 'Mastercard',
    number: '5500000000001108',
    expiry: '02/28',
    color: const Color(0xFF7B3B45),
    creditLimit: 150000,
    outstanding: 42000,
    spentThisCycle: 18650,
    statementDue: DateTime(2026, 11, 12),
    autofillOn: false,
  ),
  BankCard(
    id: 'online',
    name: 'Online card',
    network: 'RuPay',
    number: '6071000000009087',
    expiry: '11/27',
    color: const Color(0xFF1B6B5A),
    creditLimit: 100000,
    outstanding: 12500,
    spentThisCycle: 9800,
    statementDue: DateTime(2026, 11, 18),
    autofillOn: true,
  ),
];

class CardsView extends StatefulWidget {
  const CardsView({super.key});

  @override
  State<CardsView> createState() => _CardsViewState();
}

class _CardsViewState extends State<CardsView> {
  final _pageController = PageController(viewportFraction: 0.9);
  var _index = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final card = _cards[_index];

    return ListView(
      padding: const EdgeInsets.fromLTRB(0, 16, 0, 96),
      children: [
        SizedBox(
          height: 200,
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(
              dragDevices: {
                PointerDeviceKind.touch,
                PointerDeviceKind.mouse,
                PointerDeviceKind.trackpad,
                PointerDeviceKind.stylus,
              },
            ),
            child: PageView.builder(
              controller: _pageController,
              itemCount: _cards.length,
              onPageChanged: (index) => setState(() => _index = index),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: BankCardTile(card: _cards[index]),
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 8,
          children: [
            for (var i = 0; i < _cards.length; i++)
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: i == _index
                      ? colorScheme.primary
                      : colorScheme.outlineVariant,
                ),
              ),
          ],
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            decoration: BoxDecoration(
              border: Border.all(color: colorScheme.outlineVariant),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                _DetailRow(
                  label: 'Credit limit',
                  value: formatInr(card.creditLimit),
                ),
                const Divider(height: 1),
                _DetailRow(
                  label: 'Spent this cycle',
                  value: formatInr(card.spentThisCycle),
                ),
                const Divider(height: 1),
                _DetailRow(
                  label: 'Statement due',
                  value: formatDayMonth(card.statementDue),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () => context.go(SettingsRoute().path),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer.withValues(alpha: 0.4),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Icon(
                    card.autofillOn ? Icons.lock_open_outlined : Icons.lock_outline,
                    color: colorScheme.primary,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      card.autofillOn
                          ? 'Autofill is on for this card'
                          : 'Autofill is off for this card',
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                  Text(
                    'Manage',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            spacing: 12,
            children: [
              Expanded(
                child: FilledButton.icon(
                  icon: const Icon(Icons.lock_open_outlined),
                  label: const Text('Reveal number'),
                  onPressed: () => showDialog<void>(
                    context: context,
                    builder: (_) => RevealNumberDialog(card: card),
                  ),
                ),
              ),
              Expanded(
                child: OutlinedButton(
                  onPressed: () => showDialog<void>(
                    context: context,
                    builder: (_) => EditCardDialog(card: card),
                  ),
                  child: const Text('Edit details'),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Icon(Icons.info_outline, size: 20, color: colorScheme.onSurfaceVariant),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'CVV is never stored. You type it at checkout.',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _DetailRow extends StatelessWidget {
  const _DetailRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        children: [
          Expanded(child: Text(label, style: theme.textTheme.bodyLarge)),
          Text(value, style: theme.textTheme.titleMedium),
        ],
      ),
    );
  }
}
