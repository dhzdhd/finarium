// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'merchant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
Merchant _$MerchantFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'unknown':
          return UnknownMerchant.fromJson(
            json
          );
                case 'named':
          return NamedMerchant.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'Merchant',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$Merchant {



  /// Serializes this Merchant to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Merchant);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'Merchant()';
}


}

/// @nodoc
class $MerchantCopyWith<$Res>  {
$MerchantCopyWith(Merchant _, $Res Function(Merchant) __);
}


/// Adds pattern-matching-related methods to [Merchant].
extension MerchantPatterns on Merchant {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( UnknownMerchant value)?  unknown,TResult Function( NamedMerchant value)?  named,required TResult orElse(),}){
final _that = this;
switch (_that) {
case UnknownMerchant() when unknown != null:
return unknown(_that);case NamedMerchant() when named != null:
return named(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( UnknownMerchant value)  unknown,required TResult Function( NamedMerchant value)  named,}){
final _that = this;
switch (_that) {
case UnknownMerchant():
return unknown(_that);case NamedMerchant():
return named(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( UnknownMerchant value)?  unknown,TResult? Function( NamedMerchant value)?  named,}){
final _that = this;
switch (_that) {
case UnknownMerchant() when unknown != null:
return unknown(_that);case NamedMerchant() when named != null:
return named(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  unknown,TResult Function( String name)?  named,required TResult orElse(),}) {final _that = this;
switch (_that) {
case UnknownMerchant() when unknown != null:
return unknown();case NamedMerchant() when named != null:
return named(_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  unknown,required TResult Function( String name)  named,}) {final _that = this;
switch (_that) {
case UnknownMerchant():
return unknown();case NamedMerchant():
return named(_that.name);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  unknown,TResult? Function( String name)?  named,}) {final _that = this;
switch (_that) {
case UnknownMerchant() when unknown != null:
return unknown();case NamedMerchant() when named != null:
return named(_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class UnknownMerchant implements Merchant {
  const UnknownMerchant({ String? $type}): $type = $type ?? 'unknown';
  factory UnknownMerchant.fromJson(Map<String, dynamic> json) => _$UnknownMerchantFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$UnknownMerchantToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is UnknownMerchant);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'Merchant.unknown()';
}


}




/// @nodoc
@JsonSerializable()

class NamedMerchant implements Merchant {
  const NamedMerchant(this.name, { String? $type}): $type = $type ?? 'named';
  factory NamedMerchant.fromJson(Map<String, dynamic> json) => _$NamedMerchantFromJson(json);

 final  String name;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of Merchant
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NamedMerchantCopyWith<NamedMerchant> get copyWith => _$NamedMerchantCopyWithImpl<NamedMerchant>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NamedMerchantToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is NamedMerchant&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,name);
}

@override
String toString() {
    return 'Merchant.named(name: $name)';
}


}

/// @nodoc
abstract mixin class $NamedMerchantCopyWith<$Res> implements $MerchantCopyWith<$Res> {
  factory $NamedMerchantCopyWith(NamedMerchant value, $Res Function(NamedMerchant) _then) = _$NamedMerchantCopyWithImpl;
@useResult
$Res call({
 String name
});




}
/// @nodoc
class _$NamedMerchantCopyWithImpl<$Res>
    implements $NamedMerchantCopyWith<$Res> {
  _$NamedMerchantCopyWithImpl(this._self, this._then);

  final NamedMerchant _self;
  final $Res Function(NamedMerchant) _then;

/// Create a copy of Merchant
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? name = null,}) {
  return _then(NamedMerchant(
null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
