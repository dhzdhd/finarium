// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(categoriesDao)
final categoriesDaoProvider = CategoriesDaoProvider._();

final class CategoriesDaoProvider
    extends $FunctionalProvider<CategoriesDao, CategoriesDao, CategoriesDao>
    with $Provider<CategoriesDao> {
  CategoriesDaoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'categoriesDaoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$categoriesDaoHash();

  @$internal
  @override
  $ProviderElement<CategoriesDao> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CategoriesDao create(Ref ref) {
    return categoriesDao(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CategoriesDao value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CategoriesDao>(value),
    );
  }
}

String _$categoriesDaoHash() => r'6258f3922a522880b9655564f7aa9fda7eee6459';

@ProviderFor(CategoriesController)
final categoriesControllerProvider = CategoriesControllerProvider._();

final class CategoriesControllerProvider
    extends $StreamNotifierProvider<CategoriesController, List<Category>> {
  CategoriesControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'categoriesControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$categoriesControllerHash();

  @$internal
  @override
  CategoriesController create() => CategoriesController();
}

String _$categoriesControllerHash() =>
    r'6048c5af1d4817af69a4601b53722608315d291f';

abstract class _$CategoriesController extends $StreamNotifier<List<Category>> {
  Stream<List<Category>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Category>>, List<Category>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Category>>, List<Category>>,
              AsyncValue<List<Category>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
