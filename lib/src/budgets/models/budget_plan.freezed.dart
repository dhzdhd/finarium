// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'budget_plan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BudgetAllocation {

 String get category; int get amountMinor;
/// Create a copy of BudgetAllocation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BudgetAllocationCopyWith<BudgetAllocation> get copyWith => _$BudgetAllocationCopyWithImpl<BudgetAllocation>(this as BudgetAllocation, _$identity);

  /// Serializes this BudgetAllocation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BudgetAllocation;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BudgetAllocation&&(identical(other.category, _this.category) || other.category == _this.category)&&(identical(other.amountMinor, _this.amountMinor) || other.amountMinor == _this.amountMinor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BudgetAllocation;
  return Object.hash(runtimeType,_this.category,_this.amountMinor);
}

@override
String toString() {
  final _this = this as BudgetAllocation;
  return 'BudgetAllocation(category: ${_this.category}, amountMinor: ${_this.amountMinor})';
}


}

/// @nodoc
abstract mixin class $BudgetAllocationCopyWith<$Res>  {
  factory $BudgetAllocationCopyWith(BudgetAllocation value, $Res Function(BudgetAllocation) _then) = _$BudgetAllocationCopyWithImpl;
@useResult
$Res call({
 String category, int amountMinor
});




}
/// @nodoc
class _$BudgetAllocationCopyWithImpl<$Res>
    implements $BudgetAllocationCopyWith<$Res> {
  _$BudgetAllocationCopyWithImpl(this._self, this._then);

  final BudgetAllocation _self;
  final $Res Function(BudgetAllocation) _then;

/// Create a copy of BudgetAllocation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? category = null,Object? amountMinor = null,}) {
  return _then(BudgetAllocation(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,amountMinor: null == amountMinor ? _self.amountMinor : amountMinor // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [BudgetAllocation].
extension BudgetAllocationPatterns on BudgetAllocation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BudgetAllocation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BudgetAllocation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BudgetAllocation value)  $default,){
final _that = this;
switch (_that) {
case _BudgetAllocation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BudgetAllocation value)?  $default,){
final _that = this;
switch (_that) {
case _BudgetAllocation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String category,  int amountMinor)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BudgetAllocation() when $default != null:
return $default(_that.category,_that.amountMinor);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String category,  int amountMinor)  $default,) {final _that = this;
switch (_that) {
case _BudgetAllocation():
return $default(_that.category,_that.amountMinor);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String category,  int amountMinor)?  $default,) {final _that = this;
switch (_that) {
case _BudgetAllocation() when $default != null:
return $default(_that.category,_that.amountMinor);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BudgetAllocation implements BudgetAllocation {
  const _BudgetAllocation({required this.category, required this.amountMinor});
  factory _BudgetAllocation.fromJson(Map<String, dynamic> json) => _$BudgetAllocationFromJson(json);

@override final  String category;
@override final  int amountMinor;

/// Create a copy of BudgetAllocation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BudgetAllocationCopyWith<_BudgetAllocation> get copyWith => __$BudgetAllocationCopyWithImpl<_BudgetAllocation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BudgetAllocationToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BudgetAllocation&&(identical(other.category, category) || other.category == category)&&(identical(other.amountMinor, amountMinor) || other.amountMinor == amountMinor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,category,amountMinor);
}

@override
String toString() {
    return 'BudgetAllocation(category: $category, amountMinor: $amountMinor)';
}


}

/// @nodoc
abstract mixin class _$BudgetAllocationCopyWith<$Res> implements $BudgetAllocationCopyWith<$Res> {
  factory _$BudgetAllocationCopyWith(_BudgetAllocation value, $Res Function(_BudgetAllocation) _then) = __$BudgetAllocationCopyWithImpl;
@override @useResult
$Res call({
 String category, int amountMinor
});




}
/// @nodoc
class __$BudgetAllocationCopyWithImpl<$Res>
    implements _$BudgetAllocationCopyWith<$Res> {
  __$BudgetAllocationCopyWithImpl(this._self, this._then);

  final _BudgetAllocation _self;
  final $Res Function(_BudgetAllocation) _then;

/// Create a copy of BudgetAllocation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? category = null,Object? amountMinor = null,}) {
  return _then(_BudgetAllocation(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,amountMinor: null == amountMinor ? _self.amountMinor : amountMinor // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$BudgetPlan {

 String get id; BudgetPeriod get period; int get totalMinor; List<BudgetAllocation> get allocations; Option<DateTime> get customStart; Option<DateTime> get customEnd; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of BudgetPlan
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BudgetPlanCopyWith<BudgetPlan> get copyWith => _$BudgetPlanCopyWithImpl<BudgetPlan>(this as BudgetPlan, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as BudgetPlan;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BudgetPlan&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.period, _this.period) || other.period == _this.period)&&(identical(other.totalMinor, _this.totalMinor) || other.totalMinor == _this.totalMinor)&&const DeepCollectionEquality().equals(other.allocations, _this.allocations)&&(identical(other.customStart, _this.customStart) || other.customStart == _this.customStart)&&(identical(other.customEnd, _this.customEnd) || other.customEnd == _this.customEnd)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}


@override
int get hashCode {
  final _this = this as BudgetPlan;
  return Object.hash(runtimeType,_this.id,_this.period,_this.totalMinor,const DeepCollectionEquality().hash(_this.allocations),_this.customStart,_this.customEnd,_this.createdAt,_this.updatedAt);
}

@override
String toString() {
  final _this = this as BudgetPlan;
  return 'BudgetPlan(id: ${_this.id}, period: ${_this.period}, totalMinor: ${_this.totalMinor}, allocations: ${_this.allocations}, customStart: ${_this.customStart}, customEnd: ${_this.customEnd}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $BudgetPlanCopyWith<$Res>  {
  factory $BudgetPlanCopyWith(BudgetPlan value, $Res Function(BudgetPlan) _then) = _$BudgetPlanCopyWithImpl;
@useResult
$Res call({
 String id, BudgetPeriod period, int totalMinor, List<BudgetAllocation> allocations, Option<DateTime> customStart, Option<DateTime> customEnd, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$BudgetPlanCopyWithImpl<$Res>
    implements $BudgetPlanCopyWith<$Res> {
  _$BudgetPlanCopyWithImpl(this._self, this._then);

  final BudgetPlan _self;
  final $Res Function(BudgetPlan) _then;

/// Create a copy of BudgetPlan
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? period = null,Object? totalMinor = null,Object? allocations = null,Object? customStart = null,Object? customEnd = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(BudgetPlan(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as BudgetPeriod,totalMinor: null == totalMinor ? _self.totalMinor : totalMinor // ignore: cast_nullable_to_non_nullable
as int,allocations: null == allocations ? _self.allocations : allocations // ignore: cast_nullable_to_non_nullable
as List<BudgetAllocation>,customStart: null == customStart ? _self.customStart : customStart // ignore: cast_nullable_to_non_nullable
as Option<DateTime>,customEnd: null == customEnd ? _self.customEnd : customEnd // ignore: cast_nullable_to_non_nullable
as Option<DateTime>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [BudgetPlan].
extension BudgetPlanPatterns on BudgetPlan {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BudgetPlan value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BudgetPlan() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BudgetPlan value)  $default,){
final _that = this;
switch (_that) {
case _BudgetPlan():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BudgetPlan value)?  $default,){
final _that = this;
switch (_that) {
case _BudgetPlan() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  BudgetPeriod period,  int totalMinor,  List<BudgetAllocation> allocations,  Option<DateTime> customStart,  Option<DateTime> customEnd,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BudgetPlan() when $default != null:
return $default(_that.id,_that.period,_that.totalMinor,_that.allocations,_that.customStart,_that.customEnd,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  BudgetPeriod period,  int totalMinor,  List<BudgetAllocation> allocations,  Option<DateTime> customStart,  Option<DateTime> customEnd,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _BudgetPlan():
return $default(_that.id,_that.period,_that.totalMinor,_that.allocations,_that.customStart,_that.customEnd,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  BudgetPeriod period,  int totalMinor,  List<BudgetAllocation> allocations,  Option<DateTime> customStart,  Option<DateTime> customEnd,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _BudgetPlan() when $default != null:
return $default(_that.id,_that.period,_that.totalMinor,_that.allocations,_that.customStart,_that.customEnd,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _BudgetPlan implements BudgetPlan {
  const _BudgetPlan({required this.id, required this.period, required this.totalMinor, required  List<BudgetAllocation> allocations, this.customStart = const None(), this.customEnd = const None(), required this.createdAt, required this.updatedAt}): _allocations = allocations;
  

@override final  String id;
@override final  BudgetPeriod period;
@override final  int totalMinor;
 final  List<BudgetAllocation> _allocations;
@override List<BudgetAllocation> get allocations {
  if (_allocations is EqualUnmodifiableListView) return _allocations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allocations);
}

@override@JsonKey() final  Option<DateTime> customStart;
@override@JsonKey() final  Option<DateTime> customEnd;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of BudgetPlan
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BudgetPlanCopyWith<_BudgetPlan> get copyWith => __$BudgetPlanCopyWithImpl<_BudgetPlan>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BudgetPlan&&(identical(other.id, id) || other.id == id)&&(identical(other.period, period) || other.period == period)&&(identical(other.totalMinor, totalMinor) || other.totalMinor == totalMinor)&&const DeepCollectionEquality().equals(other.allocations, _allocations)&&(identical(other.customStart, customStart) || other.customStart == customStart)&&(identical(other.customEnd, customEnd) || other.customEnd == customEnd)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,period,totalMinor,const DeepCollectionEquality().hash(_allocations),customStart,customEnd,createdAt,updatedAt);
}

@override
String toString() {
    return 'BudgetPlan(id: $id, period: $period, totalMinor: $totalMinor, allocations: $allocations, customStart: $customStart, customEnd: $customEnd, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$BudgetPlanCopyWith<$Res> implements $BudgetPlanCopyWith<$Res> {
  factory _$BudgetPlanCopyWith(_BudgetPlan value, $Res Function(_BudgetPlan) _then) = __$BudgetPlanCopyWithImpl;
@override @useResult
$Res call({
 String id, BudgetPeriod period, int totalMinor, List<BudgetAllocation> allocations, Option<DateTime> customStart, Option<DateTime> customEnd, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$BudgetPlanCopyWithImpl<$Res>
    implements _$BudgetPlanCopyWith<$Res> {
  __$BudgetPlanCopyWithImpl(this._self, this._then);

  final _BudgetPlan _self;
  final $Res Function(_BudgetPlan) _then;

/// Create a copy of BudgetPlan
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? period = null,Object? totalMinor = null,Object? allocations = null,Object? customStart = null,Object? customEnd = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_BudgetPlan(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as BudgetPeriod,totalMinor: null == totalMinor ? _self.totalMinor : totalMinor // ignore: cast_nullable_to_non_nullable
as int,allocations: null == allocations ? _self._allocations : allocations // ignore: cast_nullable_to_non_nullable
as List<BudgetAllocation>,customStart: null == customStart ? _self.customStart : customStart // ignore: cast_nullable_to_non_nullable
as Option<DateTime>,customEnd: null == customEnd ? _self.customEnd : customEnd // ignore: cast_nullable_to_non_nullable
as Option<DateTime>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
