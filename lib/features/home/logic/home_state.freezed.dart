// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$HomeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(BarcodeResponseModel data) barcodeLoaded,
    required TResult Function(CustomerResponseModel data) customerLoaded,
    required TResult Function(WarehouseResponseModel data) warehouseLoaded,
    required TResult Function(String message) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(BarcodeResponseModel data)? barcodeLoaded,
    TResult? Function(CustomerResponseModel data)? customerLoaded,
    TResult? Function(WarehouseResponseModel data)? warehouseLoaded,
    TResult? Function(String message)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(BarcodeResponseModel data)? barcodeLoaded,
    TResult Function(CustomerResponseModel data)? customerLoaded,
    TResult Function(WarehouseResponseModel data)? warehouseLoaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(BarcodeLoaded value) barcodeLoaded,
    required TResult Function(CustomerLoaded value) customerLoaded,
    required TResult Function(WarehouseLoaded value) warehouseLoaded,
    required TResult Function(Error value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(BarcodeLoaded value)? barcodeLoaded,
    TResult? Function(CustomerLoaded value)? customerLoaded,
    TResult? Function(WarehouseLoaded value)? warehouseLoaded,
    TResult? Function(Error value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(BarcodeLoaded value)? barcodeLoaded,
    TResult Function(CustomerLoaded value)? customerLoaded,
    TResult Function(WarehouseLoaded value)? warehouseLoaded,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
    _$InitialImpl value,
    $Res Function(_$InitialImpl) then,
  ) = __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'HomeState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(BarcodeResponseModel data) barcodeLoaded,
    required TResult Function(CustomerResponseModel data) customerLoaded,
    required TResult Function(WarehouseResponseModel data) warehouseLoaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(BarcodeResponseModel data)? barcodeLoaded,
    TResult? Function(CustomerResponseModel data)? customerLoaded,
    TResult? Function(WarehouseResponseModel data)? warehouseLoaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(BarcodeResponseModel data)? barcodeLoaded,
    TResult Function(CustomerResponseModel data)? customerLoaded,
    TResult Function(WarehouseResponseModel data)? warehouseLoaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(BarcodeLoaded value) barcodeLoaded,
    required TResult Function(CustomerLoaded value) customerLoaded,
    required TResult Function(WarehouseLoaded value) warehouseLoaded,
    required TResult Function(Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(BarcodeLoaded value)? barcodeLoaded,
    TResult? Function(CustomerLoaded value)? customerLoaded,
    TResult? Function(WarehouseLoaded value)? warehouseLoaded,
    TResult? Function(Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(BarcodeLoaded value)? barcodeLoaded,
    TResult Function(CustomerLoaded value)? customerLoaded,
    TResult Function(WarehouseLoaded value)? warehouseLoaded,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements HomeState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
    _$LoadingImpl value,
    $Res Function(_$LoadingImpl) then,
  ) = __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
    _$LoadingImpl _value,
    $Res Function(_$LoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'HomeState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(BarcodeResponseModel data) barcodeLoaded,
    required TResult Function(CustomerResponseModel data) customerLoaded,
    required TResult Function(WarehouseResponseModel data) warehouseLoaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(BarcodeResponseModel data)? barcodeLoaded,
    TResult? Function(CustomerResponseModel data)? customerLoaded,
    TResult? Function(WarehouseResponseModel data)? warehouseLoaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(BarcodeResponseModel data)? barcodeLoaded,
    TResult Function(CustomerResponseModel data)? customerLoaded,
    TResult Function(WarehouseResponseModel data)? warehouseLoaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(BarcodeLoaded value) barcodeLoaded,
    required TResult Function(CustomerLoaded value) customerLoaded,
    required TResult Function(WarehouseLoaded value) warehouseLoaded,
    required TResult Function(Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(BarcodeLoaded value)? barcodeLoaded,
    TResult? Function(CustomerLoaded value)? customerLoaded,
    TResult? Function(WarehouseLoaded value)? warehouseLoaded,
    TResult? Function(Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(BarcodeLoaded value)? barcodeLoaded,
    TResult Function(CustomerLoaded value)? customerLoaded,
    TResult Function(WarehouseLoaded value)? warehouseLoaded,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements HomeState {
  const factory Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$BarcodeLoadedImplCopyWith<$Res> {
  factory _$$BarcodeLoadedImplCopyWith(
    _$BarcodeLoadedImpl value,
    $Res Function(_$BarcodeLoadedImpl) then,
  ) = __$$BarcodeLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BarcodeResponseModel data});
}

/// @nodoc
class __$$BarcodeLoadedImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$BarcodeLoadedImpl>
    implements _$$BarcodeLoadedImplCopyWith<$Res> {
  __$$BarcodeLoadedImplCopyWithImpl(
    _$BarcodeLoadedImpl _value,
    $Res Function(_$BarcodeLoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? data = null}) {
    return _then(
      _$BarcodeLoadedImpl(
        null == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                as BarcodeResponseModel,
      ),
    );
  }
}

/// @nodoc

class _$BarcodeLoadedImpl implements BarcodeLoaded {
  const _$BarcodeLoadedImpl(this.data);

  @override
  final BarcodeResponseModel data;

  @override
  String toString() {
    return 'HomeState.barcodeLoaded(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BarcodeLoadedImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BarcodeLoadedImplCopyWith<_$BarcodeLoadedImpl> get copyWith =>
      __$$BarcodeLoadedImplCopyWithImpl<_$BarcodeLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(BarcodeResponseModel data) barcodeLoaded,
    required TResult Function(CustomerResponseModel data) customerLoaded,
    required TResult Function(WarehouseResponseModel data) warehouseLoaded,
    required TResult Function(String message) error,
  }) {
    return barcodeLoaded(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(BarcodeResponseModel data)? barcodeLoaded,
    TResult? Function(CustomerResponseModel data)? customerLoaded,
    TResult? Function(WarehouseResponseModel data)? warehouseLoaded,
    TResult? Function(String message)? error,
  }) {
    return barcodeLoaded?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(BarcodeResponseModel data)? barcodeLoaded,
    TResult Function(CustomerResponseModel data)? customerLoaded,
    TResult Function(WarehouseResponseModel data)? warehouseLoaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (barcodeLoaded != null) {
      return barcodeLoaded(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(BarcodeLoaded value) barcodeLoaded,
    required TResult Function(CustomerLoaded value) customerLoaded,
    required TResult Function(WarehouseLoaded value) warehouseLoaded,
    required TResult Function(Error value) error,
  }) {
    return barcodeLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(BarcodeLoaded value)? barcodeLoaded,
    TResult? Function(CustomerLoaded value)? customerLoaded,
    TResult? Function(WarehouseLoaded value)? warehouseLoaded,
    TResult? Function(Error value)? error,
  }) {
    return barcodeLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(BarcodeLoaded value)? barcodeLoaded,
    TResult Function(CustomerLoaded value)? customerLoaded,
    TResult Function(WarehouseLoaded value)? warehouseLoaded,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (barcodeLoaded != null) {
      return barcodeLoaded(this);
    }
    return orElse();
  }
}

abstract class BarcodeLoaded implements HomeState {
  const factory BarcodeLoaded(final BarcodeResponseModel data) =
      _$BarcodeLoadedImpl;

  BarcodeResponseModel get data;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BarcodeLoadedImplCopyWith<_$BarcodeLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CustomerLoadedImplCopyWith<$Res> {
  factory _$$CustomerLoadedImplCopyWith(
    _$CustomerLoadedImpl value,
    $Res Function(_$CustomerLoadedImpl) then,
  ) = __$$CustomerLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CustomerResponseModel data});
}

/// @nodoc
class __$$CustomerLoadedImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$CustomerLoadedImpl>
    implements _$$CustomerLoadedImplCopyWith<$Res> {
  __$$CustomerLoadedImplCopyWithImpl(
    _$CustomerLoadedImpl _value,
    $Res Function(_$CustomerLoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? data = null}) {
    return _then(
      _$CustomerLoadedImpl(
        null == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                as CustomerResponseModel,
      ),
    );
  }
}

/// @nodoc

class _$CustomerLoadedImpl implements CustomerLoaded {
  const _$CustomerLoadedImpl(this.data);

  @override
  final CustomerResponseModel data;

  @override
  String toString() {
    return 'HomeState.customerLoaded(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerLoadedImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerLoadedImplCopyWith<_$CustomerLoadedImpl> get copyWith =>
      __$$CustomerLoadedImplCopyWithImpl<_$CustomerLoadedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(BarcodeResponseModel data) barcodeLoaded,
    required TResult Function(CustomerResponseModel data) customerLoaded,
    required TResult Function(WarehouseResponseModel data) warehouseLoaded,
    required TResult Function(String message) error,
  }) {
    return customerLoaded(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(BarcodeResponseModel data)? barcodeLoaded,
    TResult? Function(CustomerResponseModel data)? customerLoaded,
    TResult? Function(WarehouseResponseModel data)? warehouseLoaded,
    TResult? Function(String message)? error,
  }) {
    return customerLoaded?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(BarcodeResponseModel data)? barcodeLoaded,
    TResult Function(CustomerResponseModel data)? customerLoaded,
    TResult Function(WarehouseResponseModel data)? warehouseLoaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (customerLoaded != null) {
      return customerLoaded(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(BarcodeLoaded value) barcodeLoaded,
    required TResult Function(CustomerLoaded value) customerLoaded,
    required TResult Function(WarehouseLoaded value) warehouseLoaded,
    required TResult Function(Error value) error,
  }) {
    return customerLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(BarcodeLoaded value)? barcodeLoaded,
    TResult? Function(CustomerLoaded value)? customerLoaded,
    TResult? Function(WarehouseLoaded value)? warehouseLoaded,
    TResult? Function(Error value)? error,
  }) {
    return customerLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(BarcodeLoaded value)? barcodeLoaded,
    TResult Function(CustomerLoaded value)? customerLoaded,
    TResult Function(WarehouseLoaded value)? warehouseLoaded,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (customerLoaded != null) {
      return customerLoaded(this);
    }
    return orElse();
  }
}

abstract class CustomerLoaded implements HomeState {
  const factory CustomerLoaded(final CustomerResponseModel data) =
      _$CustomerLoadedImpl;

  CustomerResponseModel get data;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerLoadedImplCopyWith<_$CustomerLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WarehouseLoadedImplCopyWith<$Res> {
  factory _$$WarehouseLoadedImplCopyWith(
    _$WarehouseLoadedImpl value,
    $Res Function(_$WarehouseLoadedImpl) then,
  ) = __$$WarehouseLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({WarehouseResponseModel data});
}

/// @nodoc
class __$$WarehouseLoadedImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$WarehouseLoadedImpl>
    implements _$$WarehouseLoadedImplCopyWith<$Res> {
  __$$WarehouseLoadedImplCopyWithImpl(
    _$WarehouseLoadedImpl _value,
    $Res Function(_$WarehouseLoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? data = null}) {
    return _then(
      _$WarehouseLoadedImpl(
        null == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                as WarehouseResponseModel,
      ),
    );
  }
}

/// @nodoc

class _$WarehouseLoadedImpl implements WarehouseLoaded {
  const _$WarehouseLoadedImpl(this.data);

  @override
  final WarehouseResponseModel data;

  @override
  String toString() {
    return 'HomeState.warehouseLoaded(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WarehouseLoadedImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WarehouseLoadedImplCopyWith<_$WarehouseLoadedImpl> get copyWith =>
      __$$WarehouseLoadedImplCopyWithImpl<_$WarehouseLoadedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(BarcodeResponseModel data) barcodeLoaded,
    required TResult Function(CustomerResponseModel data) customerLoaded,
    required TResult Function(WarehouseResponseModel data) warehouseLoaded,
    required TResult Function(String message) error,
  }) {
    return warehouseLoaded(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(BarcodeResponseModel data)? barcodeLoaded,
    TResult? Function(CustomerResponseModel data)? customerLoaded,
    TResult? Function(WarehouseResponseModel data)? warehouseLoaded,
    TResult? Function(String message)? error,
  }) {
    return warehouseLoaded?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(BarcodeResponseModel data)? barcodeLoaded,
    TResult Function(CustomerResponseModel data)? customerLoaded,
    TResult Function(WarehouseResponseModel data)? warehouseLoaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (warehouseLoaded != null) {
      return warehouseLoaded(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(BarcodeLoaded value) barcodeLoaded,
    required TResult Function(CustomerLoaded value) customerLoaded,
    required TResult Function(WarehouseLoaded value) warehouseLoaded,
    required TResult Function(Error value) error,
  }) {
    return warehouseLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(BarcodeLoaded value)? barcodeLoaded,
    TResult? Function(CustomerLoaded value)? customerLoaded,
    TResult? Function(WarehouseLoaded value)? warehouseLoaded,
    TResult? Function(Error value)? error,
  }) {
    return warehouseLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(BarcodeLoaded value)? barcodeLoaded,
    TResult Function(CustomerLoaded value)? customerLoaded,
    TResult Function(WarehouseLoaded value)? warehouseLoaded,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (warehouseLoaded != null) {
      return warehouseLoaded(this);
    }
    return orElse();
  }
}

abstract class WarehouseLoaded implements HomeState {
  const factory WarehouseLoaded(final WarehouseResponseModel data) =
      _$WarehouseLoadedImpl;

  WarehouseResponseModel get data;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WarehouseLoadedImplCopyWith<_$WarehouseLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
    _$ErrorImpl value,
    $Res Function(_$ErrorImpl) then,
  ) = __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
    _$ErrorImpl _value,
    $Res Function(_$ErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$ErrorImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$ErrorImpl implements Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'HomeState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(BarcodeResponseModel data) barcodeLoaded,
    required TResult Function(CustomerResponseModel data) customerLoaded,
    required TResult Function(WarehouseResponseModel data) warehouseLoaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(BarcodeResponseModel data)? barcodeLoaded,
    TResult? Function(CustomerResponseModel data)? customerLoaded,
    TResult? Function(WarehouseResponseModel data)? warehouseLoaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(BarcodeResponseModel data)? barcodeLoaded,
    TResult Function(CustomerResponseModel data)? customerLoaded,
    TResult Function(WarehouseResponseModel data)? warehouseLoaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(BarcodeLoaded value) barcodeLoaded,
    required TResult Function(CustomerLoaded value) customerLoaded,
    required TResult Function(WarehouseLoaded value) warehouseLoaded,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(BarcodeLoaded value)? barcodeLoaded,
    TResult? Function(CustomerLoaded value)? customerLoaded,
    TResult? Function(WarehouseLoaded value)? warehouseLoaded,
    TResult? Function(Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(BarcodeLoaded value)? barcodeLoaded,
    TResult Function(CustomerLoaded value)? customerLoaded,
    TResult Function(WarehouseLoaded value)? warehouseLoaded,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements HomeState {
  const factory Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
