// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget_period_selection.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BudgetPeriodSelection)
final budgetPeriodSelectionProvider = BudgetPeriodSelectionProvider._();

final class BudgetPeriodSelectionProvider
    extends
        $NotifierProvider<
          BudgetPeriodSelection,
          ({DateTimeRange<DateTime>? custom, BudgetPeriod period})
        > {
  BudgetPeriodSelectionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'budgetPeriodSelectionProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$budgetPeriodSelectionHash();

  @$internal
  @override
  BudgetPeriodSelection create() => BudgetPeriodSelection();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(
    ({DateTimeRange<DateTime>? custom, BudgetPeriod period}) value,
  ) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<
            ({DateTimeRange<DateTime>? custom, BudgetPeriod period})
          >(value),
    );
  }
}

String _$budgetPeriodSelectionHash() =>
    r'92a758175e18fdf4dbf32796028743ae8270ad3d';

abstract class _$BudgetPeriodSelection
    extends
        $Notifier<({DateTimeRange<DateTime>? custom, BudgetPeriod period})> {
  ({DateTimeRange<DateTime>? custom, BudgetPeriod period}) build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<
              ({DateTimeRange<DateTime>? custom, BudgetPeriod period}),
              ({DateTimeRange<DateTime>? custom, BudgetPeriod period})
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                ({DateTimeRange<DateTime>? custom, BudgetPeriod period}),
                ({DateTimeRange<DateTime>? custom, BudgetPeriod period})
              >,
              ({DateTimeRange<DateTime>? custom, BudgetPeriod period}),
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
