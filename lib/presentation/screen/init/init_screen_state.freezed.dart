// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'init_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$InitScreenState {
  InitFocusMetaData? get currentFocusMetaData =>
      throw _privateConstructorUsedError;
  List<String> get languageList => throw _privateConstructorUsedError;
  OneTimeEvent<InitScreenTtsScenarioEvent>? get ttsScenarioEvent =>
      throw _privateConstructorUsedError;

  /// Create a copy of InitScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InitScreenStateCopyWith<InitScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InitScreenStateCopyWith<$Res> {
  factory $InitScreenStateCopyWith(
    InitScreenState value,
    $Res Function(InitScreenState) then,
  ) = _$InitScreenStateCopyWithImpl<$Res, InitScreenState>;
  @useResult
  $Res call({
    InitFocusMetaData? currentFocusMetaData,
    List<String> languageList,
    OneTimeEvent<InitScreenTtsScenarioEvent>? ttsScenarioEvent,
  });

  $InitFocusMetaDataCopyWith<$Res>? get currentFocusMetaData;
}

/// @nodoc
class _$InitScreenStateCopyWithImpl<$Res, $Val extends InitScreenState>
    implements $InitScreenStateCopyWith<$Res> {
  _$InitScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InitScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentFocusMetaData = freezed,
    Object? languageList = null,
    Object? ttsScenarioEvent = freezed,
  }) {
    return _then(
      _value.copyWith(
            currentFocusMetaData: freezed == currentFocusMetaData
                ? _value.currentFocusMetaData
                : currentFocusMetaData // ignore: cast_nullable_to_non_nullable
                      as InitFocusMetaData?,
            languageList: null == languageList
                ? _value.languageList
                : languageList // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            ttsScenarioEvent: freezed == ttsScenarioEvent
                ? _value.ttsScenarioEvent
                : ttsScenarioEvent // ignore: cast_nullable_to_non_nullable
                      as OneTimeEvent<InitScreenTtsScenarioEvent>?,
          )
          as $Val,
    );
  }

  /// Create a copy of InitScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InitFocusMetaDataCopyWith<$Res>? get currentFocusMetaData {
    if (_value.currentFocusMetaData == null) {
      return null;
    }

    return $InitFocusMetaDataCopyWith<$Res>(_value.currentFocusMetaData!, (
      value,
    ) {
      return _then(_value.copyWith(currentFocusMetaData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitScreenStateImplCopyWith<$Res>
    implements $InitScreenStateCopyWith<$Res> {
  factory _$$InitScreenStateImplCopyWith(
    _$InitScreenStateImpl value,
    $Res Function(_$InitScreenStateImpl) then,
  ) = __$$InitScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    InitFocusMetaData? currentFocusMetaData,
    List<String> languageList,
    OneTimeEvent<InitScreenTtsScenarioEvent>? ttsScenarioEvent,
  });

  @override
  $InitFocusMetaDataCopyWith<$Res>? get currentFocusMetaData;
}

/// @nodoc
class __$$InitScreenStateImplCopyWithImpl<$Res>
    extends _$InitScreenStateCopyWithImpl<$Res, _$InitScreenStateImpl>
    implements _$$InitScreenStateImplCopyWith<$Res> {
  __$$InitScreenStateImplCopyWithImpl(
    _$InitScreenStateImpl _value,
    $Res Function(_$InitScreenStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InitScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentFocusMetaData = freezed,
    Object? languageList = null,
    Object? ttsScenarioEvent = freezed,
  }) {
    return _then(
      _$InitScreenStateImpl(
        currentFocusMetaData: freezed == currentFocusMetaData
            ? _value.currentFocusMetaData
            : currentFocusMetaData // ignore: cast_nullable_to_non_nullable
                  as InitFocusMetaData?,
        languageList: null == languageList
            ? _value._languageList
            : languageList // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        ttsScenarioEvent: freezed == ttsScenarioEvent
            ? _value.ttsScenarioEvent
            : ttsScenarioEvent // ignore: cast_nullable_to_non_nullable
                  as OneTimeEvent<InitScreenTtsScenarioEvent>?,
      ),
    );
  }
}

/// @nodoc

class _$InitScreenStateImpl extends _InitScreenState {
  const _$InitScreenStateImpl({
    this.currentFocusMetaData,
    final List<String> languageList = const [],
    this.ttsScenarioEvent,
  }) : _languageList = languageList,
       super._();

  @override
  final InitFocusMetaData? currentFocusMetaData;
  final List<String> _languageList;
  @override
  @JsonKey()
  List<String> get languageList {
    if (_languageList is EqualUnmodifiableListView) return _languageList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_languageList);
  }

  @override
  final OneTimeEvent<InitScreenTtsScenarioEvent>? ttsScenarioEvent;

  @override
  String toString() {
    return 'InitScreenState(currentFocusMetaData: $currentFocusMetaData, languageList: $languageList, ttsScenarioEvent: $ttsScenarioEvent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitScreenStateImpl &&
            (identical(other.currentFocusMetaData, currentFocusMetaData) ||
                other.currentFocusMetaData == currentFocusMetaData) &&
            const DeepCollectionEquality().equals(
              other._languageList,
              _languageList,
            ) &&
            (identical(other.ttsScenarioEvent, ttsScenarioEvent) ||
                other.ttsScenarioEvent == ttsScenarioEvent));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    currentFocusMetaData,
    const DeepCollectionEquality().hash(_languageList),
    ttsScenarioEvent,
  );

  /// Create a copy of InitScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitScreenStateImplCopyWith<_$InitScreenStateImpl> get copyWith =>
      __$$InitScreenStateImplCopyWithImpl<_$InitScreenStateImpl>(
        this,
        _$identity,
      );
}

abstract class _InitScreenState extends InitScreenState {
  const factory _InitScreenState({
    final InitFocusMetaData? currentFocusMetaData,
    final List<String> languageList,
    final OneTimeEvent<InitScreenTtsScenarioEvent>? ttsScenarioEvent,
  }) = _$InitScreenStateImpl;
  const _InitScreenState._() : super._();

  @override
  InitFocusMetaData? get currentFocusMetaData;
  @override
  List<String> get languageList;
  @override
  OneTimeEvent<InitScreenTtsScenarioEvent>? get ttsScenarioEvent;

  /// Create a copy of InitScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitScreenStateImplCopyWith<_$InitScreenStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
