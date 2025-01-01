// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'send_notification_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SendNotificationState {
  Option<Either<ApiError, void>>? get sendNotification =>
      throw _privateConstructorUsedError;

  /// Create a copy of SendNotificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SendNotificationStateCopyWith<SendNotificationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendNotificationStateCopyWith<$Res> {
  factory $SendNotificationStateCopyWith(SendNotificationState value,
          $Res Function(SendNotificationState) then) =
      _$SendNotificationStateCopyWithImpl<$Res, SendNotificationState>;
  @useResult
  $Res call({Option<Either<ApiError, void>>? sendNotification});
}

/// @nodoc
class _$SendNotificationStateCopyWithImpl<$Res,
        $Val extends SendNotificationState>
    implements $SendNotificationStateCopyWith<$Res> {
  _$SendNotificationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SendNotificationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sendNotification = freezed,
  }) {
    return _then(_value.copyWith(
      sendNotification: freezed == sendNotification
          ? _value.sendNotification
          : sendNotification // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiError, void>>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SendNotificationStateImplCopyWith<$Res>
    implements $SendNotificationStateCopyWith<$Res> {
  factory _$$SendNotificationStateImplCopyWith(
          _$SendNotificationStateImpl value,
          $Res Function(_$SendNotificationStateImpl) then) =
      __$$SendNotificationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Option<Either<ApiError, void>>? sendNotification});
}

/// @nodoc
class __$$SendNotificationStateImplCopyWithImpl<$Res>
    extends _$SendNotificationStateCopyWithImpl<$Res,
        _$SendNotificationStateImpl>
    implements _$$SendNotificationStateImplCopyWith<$Res> {
  __$$SendNotificationStateImplCopyWithImpl(_$SendNotificationStateImpl _value,
      $Res Function(_$SendNotificationStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SendNotificationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sendNotification = freezed,
  }) {
    return _then(_$SendNotificationStateImpl(
      sendNotification: freezed == sendNotification
          ? _value.sendNotification
          : sendNotification // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiError, void>>?,
    ));
  }
}

/// @nodoc

class _$SendNotificationStateImpl implements _SendNotificationState {
  const _$SendNotificationStateImpl({this.sendNotification});

  @override
  final Option<Either<ApiError, void>>? sendNotification;

  @override
  String toString() {
    return 'SendNotificationState(sendNotification: $sendNotification)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendNotificationStateImpl &&
            (identical(other.sendNotification, sendNotification) ||
                other.sendNotification == sendNotification));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sendNotification);

  /// Create a copy of SendNotificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendNotificationStateImplCopyWith<_$SendNotificationStateImpl>
      get copyWith => __$$SendNotificationStateImplCopyWithImpl<
          _$SendNotificationStateImpl>(this, _$identity);
}

abstract class _SendNotificationState implements SendNotificationState {
  const factory _SendNotificationState(
          {final Option<Either<ApiError, void>>? sendNotification}) =
      _$SendNotificationStateImpl;

  @override
  Option<Either<ApiError, void>>? get sendNotification;

  /// Create a copy of SendNotificationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendNotificationStateImplCopyWith<_$SendNotificationStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
