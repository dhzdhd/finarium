// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(transactionsDao)
final transactionsDaoProvider = TransactionsDaoProvider._();

final class TransactionsDaoProvider
    extends
        $FunctionalProvider<TransactionsDao, TransactionsDao, TransactionsDao>
    with $Provider<TransactionsDao> {
  TransactionsDaoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'transactionsDaoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$transactionsDaoHash();

  @$internal
  @override
  $ProviderElement<TransactionsDao> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TransactionsDao create(Ref ref) {
    return transactionsDao(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TransactionsDao value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TransactionsDao>(value),
    );
  }
}

String _$transactionsDaoHash() => r'796facd30ef173a9c6f30af4728930cc5af20f02';

@ProviderFor(TransactionsController)
final transactionsControllerProvider = TransactionsControllerProvider._();

final class TransactionsControllerProvider
    extends $StreamNotifierProvider<TransactionsController, List<Transaction>> {
  TransactionsControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'transactionsControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$transactionsControllerHash();

  @$internal
  @override
  TransactionsController create() => TransactionsController();
}

String _$transactionsControllerHash() =>
    r'fdf629dda9a6a8e66ff51a1adc6f0a43f634924f';

abstract class _$TransactionsController
    extends $StreamNotifier<List<Transaction>> {
  Stream<List<Transaction>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<Transaction>>, List<Transaction>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Transaction>>, List<Transaction>>,
              AsyncValue<List<Transaction>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
