// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Settings {

 ThemeMode get themeMode; bool get autofill; bool get biometrics; bool get captureAlerts; bool get gmailStatements; AutoLockDuration get autoLock; BudgetAlertThreshold get budgetThreshold;
/// Create a copy of Settings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettingsCopyWith<Settings> get copyWith => _$SettingsCopyWithImpl<Settings>(this as Settings, _$identity);

  /// Serializes this Settings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Settings;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Settings&&(identical(other.themeMode, _this.themeMode) || other.themeMode == _this.themeMode)&&(identical(other.autofill, _this.autofill) || other.autofill == _this.autofill)&&(identical(other.biometrics, _this.biometrics) || other.biometrics == _this.biometrics)&&(identical(other.captureAlerts, _this.captureAlerts) || other.captureAlerts == _this.captureAlerts)&&(identical(other.gmailStatements, _this.gmailStatements) || other.gmailStatements == _this.gmailStatements)&&(identical(other.autoLock, _this.autoLock) || other.autoLock == _this.autoLock)&&(identical(other.budgetThreshold, _this.budgetThreshold) || other.budgetThreshold == _this.budgetThreshold));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Settings;
  return Object.hash(runtimeType,_this.themeMode,_this.autofill,_this.biometrics,_this.captureAlerts,_this.gmailStatements,_this.autoLock,_this.budgetThreshold);
}

@override
String toString() {
  final _this = this as Settings;
  return 'Settings(themeMode: ${_this.themeMode}, autofill: ${_this.autofill}, biometrics: ${_this.biometrics}, captureAlerts: ${_this.captureAlerts}, gmailStatements: ${_this.gmailStatements}, autoLock: ${_this.autoLock}, budgetThreshold: ${_this.budgetThreshold})';
}


}

/// @nodoc
abstract mixin class $SettingsCopyWith<$Res>  {
  factory $SettingsCopyWith(Settings value, $Res Function(Settings) _then) = _$SettingsCopyWithImpl;
@useResult
$Res call({
 ThemeMode themeMode, bool autofill, bool biometrics, bool captureAlerts, bool gmailStatements, AutoLockDuration autoLock, BudgetAlertThreshold budgetThreshold
});




}
/// @nodoc
class _$SettingsCopyWithImpl<$Res>
    implements $SettingsCopyWith<$Res> {
  _$SettingsCopyWithImpl(this._self, this._then);

  final Settings _self;
  final $Res Function(Settings) _then;

/// Create a copy of Settings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? themeMode = null,Object? autofill = null,Object? biometrics = null,Object? captureAlerts = null,Object? gmailStatements = null,Object? autoLock = null,Object? budgetThreshold = null,}) {
  return _then(Settings(
themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeMode,autofill: null == autofill ? _self.autofill : autofill // ignore: cast_nullable_to_non_nullable
as bool,biometrics: null == biometrics ? _self.biometrics : biometrics // ignore: cast_nullable_to_non_nullable
as bool,captureAlerts: null == captureAlerts ? _self.captureAlerts : captureAlerts // ignore: cast_nullable_to_non_nullable
as bool,gmailStatements: null == gmailStatements ? _self.gmailStatements : gmailStatements // ignore: cast_nullable_to_non_nullable
as bool,autoLock: null == autoLock ? _self.autoLock : autoLock // ignore: cast_nullable_to_non_nullable
as AutoLockDuration,budgetThreshold: null == budgetThreshold ? _self.budgetThreshold : budgetThreshold // ignore: cast_nullable_to_non_nullable
as BudgetAlertThreshold,
  ));
}

}


/// Adds pattern-matching-related methods to [Settings].
extension SettingsPatterns on Settings {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Settings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Settings() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Settings value)  $default,){
final _that = this;
switch (_that) {
case _Settings():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Settings value)?  $default,){
final _that = this;
switch (_that) {
case _Settings() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ThemeMode themeMode,  bool autofill,  bool biometrics,  bool captureAlerts,  bool gmailStatements,  AutoLockDuration autoLock,  BudgetAlertThreshold budgetThreshold)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Settings() when $default != null:
return $default(_that.themeMode,_that.autofill,_that.biometrics,_that.captureAlerts,_that.gmailStatements,_that.autoLock,_that.budgetThreshold);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ThemeMode themeMode,  bool autofill,  bool biometrics,  bool captureAlerts,  bool gmailStatements,  AutoLockDuration autoLock,  BudgetAlertThreshold budgetThreshold)  $default,) {final _that = this;
switch (_that) {
case _Settings():
return $default(_that.themeMode,_that.autofill,_that.biometrics,_that.captureAlerts,_that.gmailStatements,_that.autoLock,_that.budgetThreshold);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ThemeMode themeMode,  bool autofill,  bool biometrics,  bool captureAlerts,  bool gmailStatements,  AutoLockDuration autoLock,  BudgetAlertThreshold budgetThreshold)?  $default,) {final _that = this;
switch (_that) {
case _Settings() when $default != null:
return $default(_that.themeMode,_that.autofill,_that.biometrics,_that.captureAlerts,_that.gmailStatements,_that.autoLock,_that.budgetThreshold);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Settings implements Settings {
  const _Settings({this.themeMode = ThemeMode.system, this.autofill = true, this.biometrics = true, this.captureAlerts = true, this.gmailStatements = false, this.autoLock = AutoLockDuration.oneMinute, this.budgetThreshold = BudgetAlertThreshold.eighty});
  factory _Settings.fromJson(Map<String, dynamic> json) => _$SettingsFromJson(json);

@override@JsonKey() final  ThemeMode themeMode;
@override@JsonKey() final  bool autofill;
@override@JsonKey() final  bool biometrics;
@override@JsonKey() final  bool captureAlerts;
@override@JsonKey() final  bool gmailStatements;
@override@JsonKey() final  AutoLockDuration autoLock;
@override@JsonKey() final  BudgetAlertThreshold budgetThreshold;

/// Create a copy of Settings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SettingsCopyWith<_Settings> get copyWith => __$SettingsCopyWithImpl<_Settings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SettingsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Settings&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.autofill, autofill) || other.autofill == autofill)&&(identical(other.biometrics, biometrics) || other.biometrics == biometrics)&&(identical(other.captureAlerts, captureAlerts) || other.captureAlerts == captureAlerts)&&(identical(other.gmailStatements, gmailStatements) || other.gmailStatements == gmailStatements)&&(identical(other.autoLock, autoLock) || other.autoLock == autoLock)&&(identical(other.budgetThreshold, budgetThreshold) || other.budgetThreshold == budgetThreshold));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,themeMode,autofill,biometrics,captureAlerts,gmailStatements,autoLock,budgetThreshold);
}

@override
String toString() {
    return 'Settings(themeMode: $themeMode, autofill: $autofill, biometrics: $biometrics, captureAlerts: $captureAlerts, gmailStatements: $gmailStatements, autoLock: $autoLock, budgetThreshold: $budgetThreshold)';
}


}

/// @nodoc
abstract mixin class _$SettingsCopyWith<$Res> implements $SettingsCopyWith<$Res> {
  factory _$SettingsCopyWith(_Settings value, $Res Function(_Settings) _then) = __$SettingsCopyWithImpl;
@override @useResult
$Res call({
 ThemeMode themeMode, bool autofill, bool biometrics, bool captureAlerts, bool gmailStatements, AutoLockDuration autoLock, BudgetAlertThreshold budgetThreshold
});




}
/// @nodoc
class __$SettingsCopyWithImpl<$Res>
    implements _$SettingsCopyWith<$Res> {
  __$SettingsCopyWithImpl(this._self, this._then);

  final _Settings _self;
  final $Res Function(_Settings) _then;

/// Create a copy of Settings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? themeMode = null,Object? autofill = null,Object? biometrics = null,Object? captureAlerts = null,Object? gmailStatements = null,Object? autoLock = null,Object? budgetThreshold = null,}) {
  return _then(_Settings(
themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeMode,autofill: null == autofill ? _self.autofill : autofill // ignore: cast_nullable_to_non_nullable
as bool,biometrics: null == biometrics ? _self.biometrics : biometrics // ignore: cast_nullable_to_non_nullable
as bool,captureAlerts: null == captureAlerts ? _self.captureAlerts : captureAlerts // ignore: cast_nullable_to_non_nullable
as bool,gmailStatements: null == gmailStatements ? _self.gmailStatements : gmailStatements // ignore: cast_nullable_to_non_nullable
as bool,autoLock: null == autoLock ? _self.autoLock : autoLock // ignore: cast_nullable_to_non_nullable
as AutoLockDuration,budgetThreshold: null == budgetThreshold ? _self.budgetThreshold : budgetThreshold // ignore: cast_nullable_to_non_nullable
as BudgetAlertThreshold,
  ));
}


}

// dart format on
