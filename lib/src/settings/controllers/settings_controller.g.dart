// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SettingsController)
final settingsControllerProvider = SettingsControllerProvider._();

final class SettingsControllerProvider
    extends $NotifierProvider<SettingsController, Settings> {
  SettingsControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'settingsControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$settingsControllerHash();

  @$internal
  @override
  SettingsController create() => SettingsController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Settings value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Settings>(value),
    );
  }
}

String _$settingsControllerHash() =>
    r'095572b678a8d8bb3950551f08aea5f05f8e4773';

abstract class _$SettingsController extends $Notifier<Settings> {
  Settings build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<Settings, Settings>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Settings, Settings>,
              Settings,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
