// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budgets_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(budgetsDao)
final budgetsDaoProvider = BudgetsDaoProvider._();

final class BudgetsDaoProvider
    extends $FunctionalProvider<BudgetsDao, BudgetsDao, BudgetsDao>
    with $Provider<BudgetsDao> {
  BudgetsDaoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'budgetsDaoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$budgetsDaoHash();

  @$internal
  @override
  $ProviderElement<BudgetsDao> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  BudgetsDao create(Ref ref) {
    return budgetsDao(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BudgetsDao value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BudgetsDao>(value),
    );
  }
}

String _$budgetsDaoHash() => r'4549f5518e69bdb13a2860b5424b1fcb8eefe16f';

@ProviderFor(BudgetsController)
final budgetsControllerProvider = BudgetsControllerProvider._();

final class BudgetsControllerProvider
    extends $StreamNotifierProvider<BudgetsController, List<BudgetPlan>> {
  BudgetsControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'budgetsControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$budgetsControllerHash();

  @$internal
  @override
  BudgetsController create() => BudgetsController();
}

String _$budgetsControllerHash() => r'87891eac42c66590eca10a71e37aeeb06ed35200';

abstract class _$BudgetsController extends $StreamNotifier<List<BudgetPlan>> {
  Stream<List<BudgetPlan>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<BudgetPlan>>, List<BudgetPlan>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<BudgetPlan>>, List<BudgetPlan>>,
              AsyncValue<List<BudgetPlan>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
