// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'init_focus_meta_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$InitFocusMetaData {
  InitScreenFocusCode get focusCode => throw _privateConstructorUsedError;
  String get focusId => throw _privateConstructorUsedError;
  String get parentFocusId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      InitScreenFocusCode focusCode,
      String focusId,
      String parentFocusId,
      String screenName,
    )
    screen,
    required TResult Function(
      InitScreenFocusCode focusCode,
      String focusId,
      String parentFocusId,
      String sectionName,
    )
    section,
    required TResult Function(
      InitScreenFocusCode focusCode,
      String focusId,
      String parentFocusId,
      String widgetName,
    )
    widget,
    required TResult Function(
      InitScreenFocusCode focusCode,
      String focusId,
      String parentFocusId,
      String languageName,
    )
    language,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      InitScreenFocusCode focusCode,
      String focusId,
      String parentFocusId,
      String screenName,
    )?
    screen,
    TResult? Function(
      InitScreenFocusCode focusCode,
      String focusId,
      String parentFocusId,
      String sectionName,
    )?
    section,
    TResult? Function(
      InitScreenFocusCode focusCode,
      String focusId,
      String parentFocusId,
      String widgetName,
    )?
    widget,
    TResult? Function(
      InitScreenFocusCode focusCode,
      String focusId,
      String parentFocusId,
      String languageName,
    )?
    language,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      InitScreenFocusCode focusCode,
      String focusId,
      String parentFocusId,
      String screenName,
    )?
    screen,
    TResult Function(
      InitScreenFocusCode focusCode,
      String focusId,
      String parentFocusId,
      String sectionName,
    )?
    section,
    TResult Function(
      InitScreenFocusCode focusCode,
      String focusId,
      String parentFocusId,
      String widgetName,
    )?
    widget,
    TResult Function(
      InitScreenFocusCode focusCode,
      String focusId,
      String parentFocusId,
      String languageName,
    )?
    language,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ScreenLevel value) screen,
    required TResult Function(SectionLevel value) section,
    required TResult Function(WidgetLevel value) widget,
    required TResult Function(LanguageLevel value) language,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScreenLevel value)? screen,
    TResult? Function(SectionLevel value)? section,
    TResult? Function(WidgetLevel value)? widget,
    TResult? Function(LanguageLevel value)? language,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScreenLevel value)? screen,
    TResult Function(SectionLevel value)? section,
    TResult Function(WidgetLevel value)? widget,
    TResult Function(LanguageLevel value)? language,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of InitFocusMetaData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InitFocusMetaDataCopyWith<InitFocusMetaData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InitFocusMetaDataCopyWith<$Res> {
  factory $InitFocusMetaDataCopyWith(
    InitFocusMetaData value,
    $Res Function(InitFocusMetaData) then,
  ) = _$InitFocusMetaDataCopyWithImpl<$Res, InitFocusMetaData>;
  @useResult
  $Res call({
    InitScreenFocusCode focusCode,
    String focusId,
    String parentFocusId,
  });
}

/// @nodoc
class _$InitFocusMetaDataCopyWithImpl<$Res, $Val extends InitFocusMetaData>
    implements $InitFocusMetaDataCopyWith<$Res> {
  _$InitFocusMetaDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InitFocusMetaData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? focusCode = null,
    Object? focusId = null,
    Object? parentFocusId = null,
  }) {
    return _then(
      _value.copyWith(
            focusCode: null == focusCode
                ? _value.focusCode
                : focusCode // ignore: cast_nullable_to_non_nullable
                      as InitScreenFocusCode,
            focusId: null == focusId
                ? _value.focusId
                : focusId // ignore: cast_nullable_to_non_nullable
                      as String,
            parentFocusId: null == parentFocusId
                ? _value.parentFocusId
                : parentFocusId // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ScreenLevelImplCopyWith<$Res>
    implements $InitFocusMetaDataCopyWith<$Res> {
  factory _$$ScreenLevelImplCopyWith(
    _$ScreenLevelImpl value,
    $Res Function(_$ScreenLevelImpl) then,
  ) = __$$ScreenLevelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    InitScreenFocusCode focusCode,
    String focusId,
    String parentFocusId,
    String screenName,
  });
}

/// @nodoc
class __$$ScreenLevelImplCopyWithImpl<$Res>
    extends _$InitFocusMetaDataCopyWithImpl<$Res, _$ScreenLevelImpl>
    implements _$$ScreenLevelImplCopyWith<$Res> {
  __$$ScreenLevelImplCopyWithImpl(
    _$ScreenLevelImpl _value,
    $Res Function(_$ScreenLevelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InitFocusMetaData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? focusCode = null,
    Object? focusId = null,
    Object? parentFocusId = null,
    Object? screenName = null,
  }) {
    return _then(
      _$ScreenLevelImpl(
        focusCode: null == focusCode
            ? _value.focusCode
            : focusCode // ignore: cast_nullable_to_non_nullable
                  as InitScreenFocusCode,
        focusId: null == focusId
            ? _value.focusId
            : focusId // ignore: cast_nullable_to_non_nullable
                  as String,
        parentFocusId: null == parentFocusId
            ? _value.parentFocusId
            : parentFocusId // ignore: cast_nullable_to_non_nullable
                  as String,
        screenName: null == screenName
            ? _value.screenName
            : screenName // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$ScreenLevelImpl extends ScreenLevel {
  const _$ScreenLevelImpl({
    this.focusCode = InitScreenFocusCode.screen,
    required this.focusId,
    this.parentFocusId = 'initScreen',
    required this.screenName,
  }) : super._();

  @override
  @JsonKey()
  final InitScreenFocusCode focusCode;
  @override
  final String focusId;
  @override
  @JsonKey()
  final String parentFocusId;
  @override
  final String screenName;

  @override
  String toString() {
    return 'InitFocusMetaData.screen(focusCode: $focusCode, focusId: $focusId, parentFocusId: $parentFocusId, screenName: $screenName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScreenLevelImpl &&
            (identical(other.focusCode, focusCode) ||
                other.focusCode == focusCode) &&
            (identical(other.focusId, focusId) || other.focusId == focusId) &&
            (identical(other.parentFocusId, parentFocusId) ||
                other.parentFocusId == parentFocusId) &&
            (identical(other.screenName, screenName) ||
                other.screenName == screenName));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, focusCode, focusId, parentFocusId, screenName);

  /// Create a copy of InitFocusMetaData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScreenLevelImplCopyWith<_$ScreenLevelImpl> get copyWith =>
      __$$ScreenLevelImplCopyWithImpl<_$ScreenLevelImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      InitScreenFocusCode focusCode,
      String focusId,
      String parentFocusId,
      String screenName,
    )
    screen,
    required TResult Function(
      InitScreenFocusCode focusCode,
      String focusId,
      String parentFocusId,
      String sectionName,
    )
    section,
    required TResult Function(
      InitScreenFocusCode focusCode,
      String focusId,
      String parentFocusId,
      String widgetName,
    )
    widget,
    required TResult Function(
      InitScreenFocusCode focusCode,
      String focusId,
      String parentFocusId,
      String languageName,
    )
    language,
  }) {
    return screen(focusCode, focusId, parentFocusId, screenName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      InitScreenFocusCode focusCode,
      String focusId,
      String parentFocusId,
      String screenName,
    )?
    screen,
    TResult? Function(
      InitScreenFocusCode focusCode,
      String focusId,
      String parentFocusId,
      String sectionName,
    )?
    section,
    TResult? Function(
      InitScreenFocusCode focusCode,
      String focusId,
      String parentFocusId,
      String widgetName,
    )?
    widget,
    TResult? Function(
      InitScreenFocusCode focusCode,
      String focusId,
      String parentFocusId,
      String languageName,
    )?
    language,
  }) {
    return screen?.call(focusCode, focusId, parentFocusId, screenName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      InitScreenFocusCode focusCode,
      String focusId,
      String parentFocusId,
      String screenName,
    )?
    screen,
    TResult Function(
      InitScreenFocusCode focusCode,
      String focusId,
      String parentFocusId,
      String sectionName,
    )?
    section,
    TResult Function(
      InitScreenFocusCode focusCode,
      String focusId,
      String parentFocusId,
      String widgetName,
    )?
    widget,
    TResult Function(
      InitScreenFocusCode focusCode,
      String focusId,
      String parentFocusId,
      String languageName,
    )?
    language,
    required TResult orElse(),
  }) {
    if (screen != null) {
      return screen(focusCode, focusId, parentFocusId, screenName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ScreenLevel value) screen,
    required TResult Function(SectionLevel value) section,
    required TResult Function(WidgetLevel value) widget,
    required TResult Function(LanguageLevel value) language,
  }) {
    return screen(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScreenLevel value)? screen,
    TResult? Function(SectionLevel value)? section,
    TResult? Function(WidgetLevel value)? widget,
    TResult? Function(LanguageLevel value)? language,
  }) {
    return screen?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScreenLevel value)? screen,
    TResult Function(SectionLevel value)? section,
    TResult Function(WidgetLevel value)? widget,
    TResult Function(LanguageLevel value)? language,
    required TResult orElse(),
  }) {
    if (screen != null) {
      return screen(this);
    }
    return orElse();
  }
}

abstract class ScreenLevel extends InitFocusMetaData {
  const factory ScreenLevel({
    final InitScreenFocusCode focusCode,
    required final String focusId,
    final String parentFocusId,
    required final String screenName,
  }) = _$ScreenLevelImpl;
  const ScreenLevel._() : super._();

  @override
  InitScreenFocusCode get focusCode;
  @override
  String get focusId;
  @override
  String get parentFocusId;
  String get screenName;

  /// Create a copy of InitFocusMetaData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScreenLevelImplCopyWith<_$ScreenLevelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SectionLevelImplCopyWith<$Res>
    implements $InitFocusMetaDataCopyWith<$Res> {
  factory _$$SectionLevelImplCopyWith(
    _$SectionLevelImpl value,
    $Res Function(_$SectionLevelImpl) then,
  ) = __$$SectionLevelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    InitScreenFocusCode focusCode,
    String focusId,
    String parentFocusId,
    String sectionName,
  });
}

/// @nodoc
class __$$SectionLevelImplCopyWithImpl<$Res>
    extends _$InitFocusMetaDataCopyWithImpl<$Res, _$SectionLevelImpl>
    implements _$$SectionLevelImplCopyWith<$Res> {
  __$$SectionLevelImplCopyWithImpl(
    _$SectionLevelImpl _value,
    $Res Function(_$SectionLevelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InitFocusMetaData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? focusCode = null,
    Object? focusId = null,
    Object? parentFocusId = null,
    Object? sectionName = null,
  }) {
    return _then(
      _$SectionLevelImpl(
        focusCode: null == focusCode
            ? _value.focusCode
            : focusCode // ignore: cast_nullable_to_non_nullable
                  as InitScreenFocusCode,
        focusId: null == focusId
            ? _value.focusId
            : focusId // ignore: cast_nullable_to_non_nullable
                  as String,
        parentFocusId: null == parentFocusId
            ? _value.parentFocusId
            : parentFocusId // ignore: cast_nullable_to_non_nullable
                  as String,
        sectionName: null == sectionName
            ? _value.sectionName
            : sectionName // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$SectionLevelImpl extends SectionLevel {
  const _$SectionLevelImpl({
    required this.focusCode,
    required this.focusId,
    required this.parentFocusId,
    required this.sectionName,
  }) : super._();

  @override
  final InitScreenFocusCode focusCode;
  @override
  final String focusId;
  @override
  final String parentFocusId;
  @override
  final String sectionName;

  @override
  String toString() {
    return 'InitFocusMetaData.section(focusCode: $focusCode, focusId: $focusId, parentFocusId: $parentFocusId, sectionName: $sectionName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SectionLevelImpl &&
            (identical(other.focusCode, focusCode) ||
                other.focusCode == focusCode) &&
            (identical(other.focusId, focusId) || other.focusId == focusId) &&
            (identical(other.parentFocusId, parentFocusId) ||
                other.parentFocusId == parentFocusId) &&
            (identical(other.sectionName, sectionName) ||
                other.sectionName == sectionName));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, focusCode, focusId, parentFocusId, sectionName);

  /// Create a copy of InitFocusMetaData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SectionLevelImplCopyWith<_$SectionLevelImpl> get copyWith =>
      __$$SectionLevelImplCopyWithImpl<_$SectionLevelImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      InitScreenFocusCode focusCode,
      String focusId,
      String parentFocusId,
      String screenName,
    )
    screen,
    required TResult Function(
      InitScreenFocusCode focusCode,
      String focusId,
      String parentFocusId,
      String sectionName,
    )
    section,
    required TResult Function(
      InitScreenFocusCode focusCode,
      String focusId,
      String parentFocusId,
      String widgetName,
    )
    widget,
    required TResult Function(
      InitScreenFocusCode focusCode,
      String focusId,
      String parentFocusId,
      String languageName,
    )
    language,
  }) {
    return section(focusCode, focusId, parentFocusId, sectionName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      InitScreenFocusCode focusCode,
      String focusId,
      String parentFocusId,
      String screenName,
    )?
    screen,
    TResult? Function(
      InitScreenFocusCode focusCode,
      String focusId,
      String parentFocusId,
      String sectionName,
    )?
    section,
    TResult? Function(
      InitScreenFocusCode focusCode,
      String focusId,
      String parentFocusId,
      String widgetName,
    )?
    widget,
    TResult? Function(
      InitScreenFocusCode focusCode,
      String focusId,
      String parentFocusId,
      String languageName,
    )?
    language,
  }) {
    return section?.call(focusCode, focusId, parentFocusId, sectionName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      InitScreenFocusCode focusCode,
      String focusId,
      String parentFocusId,
      String screenName,
    )?
    screen,
    TResult Function(
      InitScreenFocusCode focusCode,
      String focusId,
      String parentFocusId,
      String sectionName,
    )?
    section,
    TResult Function(
      InitScreenFocusCode focusCode,
      String focusId,
      String parentFocusId,
      String widgetName,
    )?
    widget,
    TResult Function(
      InitScreenFocusCode focusCode,
      String focusId,
      String parentFocusId,
      String languageName,
    )?
    language,
    required TResult orElse(),
  }) {
    if (section != null) {
      return section(focusCode, focusId, parentFocusId, sectionName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ScreenLevel value) screen,
    required TResult Function(SectionLevel value) section,
    required TResult Function(WidgetLevel value) widget,
    required TResult Function(LanguageLevel value) language,
  }) {
    return section(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScreenLevel value)? screen,
    TResult? Function(SectionLevel value)? section,
    TResult? Function(WidgetLevel value)? widget,
    TResult? Function(LanguageLevel value)? language,
  }) {
    return section?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScreenLevel value)? screen,
    TResult Function(SectionLevel value)? section,
    TResult Function(WidgetLevel value)? widget,
    TResult Function(LanguageLevel value)? language,
    required TResult orElse(),
  }) {
    if (section != null) {
      return section(this);
    }
    return orElse();
  }
}

abstract class SectionLevel extends InitFocusMetaData {
  const factory SectionLevel({
    required final InitScreenFocusCode focusCode,
    required final String focusId,
    required final String parentFocusId,
    required final String sectionName,
  }) = _$SectionLevelImpl;
  const SectionLevel._() : super._();

  @override
  InitScreenFocusCode get focusCode;
  @override
  String get focusId;
  @override
  String get parentFocusId;
  String get sectionName;

  /// Create a copy of InitFocusMetaData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SectionLevelImplCopyWith<_$SectionLevelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WidgetLevelImplCopyWith<$Res>
    implements $InitFocusMetaDataCopyWith<$Res> {
  factory _$$WidgetLevelImplCopyWith(
    _$WidgetLevelImpl value,
    $Res Function(_$WidgetLevelImpl) then,
  ) = __$$WidgetLevelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    InitScreenFocusCode focusCode,
    String focusId,
    String parentFocusId,
    String widgetName,
  });
}

/// @nodoc
class __$$WidgetLevelImplCopyWithImpl<$Res>
    extends _$InitFocusMetaDataCopyWithImpl<$Res, _$WidgetLevelImpl>
    implements _$$WidgetLevelImplCopyWith<$Res> {
  __$$WidgetLevelImplCopyWithImpl(
    _$WidgetLevelImpl _value,
    $Res Function(_$WidgetLevelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InitFocusMetaData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? focusCode = null,
    Object? focusId = null,
    Object? parentFocusId = null,
    Object? widgetName = null,
  }) {
    return _then(
      _$WidgetLevelImpl(
        focusCode: null == focusCode
            ? _value.focusCode
            : focusCode // ignore: cast_nullable_to_non_nullable
                  as InitScreenFocusCode,
        focusId: null == focusId
            ? _value.focusId
            : focusId // ignore: cast_nullable_to_non_nullable
                  as String,
        parentFocusId: null == parentFocusId
            ? _value.parentFocusId
            : parentFocusId // ignore: cast_nullable_to_non_nullable
                  as String,
        widgetName: null == widgetName
            ? _value.widgetName
            : widgetName // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$WidgetLevelImpl extends WidgetLevel {
  const _$WidgetLevelImpl({
    required this.focusCode,
    required this.focusId,
    required this.parentFocusId,
    required this.widgetName,
  }) : super._();

  @override
  final InitScreenFocusCode focusCode;
  @override
  final String focusId;
  @override
  final String parentFocusId;
  @override
  final String widgetName;

  @override
  String toString() {
    return 'InitFocusMetaData.widget(focusCode: $focusCode, focusId: $focusId, parentFocusId: $parentFocusId, widgetName: $widgetName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WidgetLevelImpl &&
            (identical(other.focusCode, focusCode) ||
                other.focusCode == focusCode) &&
            (identical(other.focusId, focusId) || other.focusId == focusId) &&
            (identical(other.parentFocusId, parentFocusId) ||
                other.parentFocusId == parentFocusId) &&
            (identical(other.widgetName, widgetName) ||
                other.widgetName == widgetName));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, focusCode, focusId, parentFocusId, widgetName);

  /// Create a copy of InitFocusMetaData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WidgetLevelImplCopyWith<_$WidgetLevelImpl> get copyWith =>
      __$$WidgetLevelImplCopyWithImpl<_$WidgetLevelImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      InitScreenFocusCode focusCode,
      String focusId,
      String parentFocusId,
      String screenName,
    )
    screen,
    required TResult Function(
      InitScreenFocusCode focusCode,
      String focusId,
      String parentFocusId,
      String sectionName,
    )
    section,
    required TResult Function(
      InitScreenFocusCode focusCode,
      String focusId,
      String parentFocusId,
      String widgetName,
    )
    widget,
    required TResult Function(
      InitScreenFocusCode focusCode,
      String focusId,
      String parentFocusId,
      String languageName,
    )
    language,
  }) {
    return widget(focusCode, focusId, parentFocusId, widgetName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      InitScreenFocusCode focusCode,
      String focusId,
      String parentFocusId,
      String screenName,
    )?
    screen,
    TResult? Function(
      InitScreenFocusCode focusCode,
      String focusId,
      String parentFocusId,
      String sectionName,
    )?
    section,
    TResult? Function(
      InitScreenFocusCode focusCode,
      String focusId,
      String parentFocusId,
      String widgetName,
    )?
    widget,
    TResult? Function(
      InitScreenFocusCode focusCode,
      String focusId,
      String parentFocusId,
      String languageName,
    )?
    language,
  }) {
    return widget?.call(focusCode, focusId, parentFocusId, widgetName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      InitScreenFocusCode focusCode,
      String focusId,
      String parentFocusId,
      String screenName,
    )?
    screen,
    TResult Function(
      InitScreenFocusCode focusCode,
      String focusId,
      String parentFocusId,
      String sectionName,
    )?
    section,
    TResult Function(
      InitScreenFocusCode focusCode,
      String focusId,
      String parentFocusId,
      String widgetName,
    )?
    widget,
    TResult Function(
      InitScreenFocusCode focusCode,
      String focusId,
      String parentFocusId,
      String languageName,
    )?
    language,
    required TResult orElse(),
  }) {
    if (widget != null) {
      return widget(focusCode, focusId, parentFocusId, widgetName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ScreenLevel value) screen,
    required TResult Function(SectionLevel value) section,
    required TResult Function(WidgetLevel value) widget,
    required TResult Function(LanguageLevel value) language,
  }) {
    return widget(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScreenLevel value)? screen,
    TResult? Function(SectionLevel value)? section,
    TResult? Function(WidgetLevel value)? widget,
    TResult? Function(LanguageLevel value)? language,
  }) {
    return widget?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScreenLevel value)? screen,
    TResult Function(SectionLevel value)? section,
    TResult Function(WidgetLevel value)? widget,
    TResult Function(LanguageLevel value)? language,
    required TResult orElse(),
  }) {
    if (widget != null) {
      return widget(this);
    }
    return orElse();
  }
}

abstract class WidgetLevel extends InitFocusMetaData {
  const factory WidgetLevel({
    required final InitScreenFocusCode focusCode,
    required final String focusId,
    required final String parentFocusId,
    required final String widgetName,
  }) = _$WidgetLevelImpl;
  const WidgetLevel._() : super._();

  @override
  InitScreenFocusCode get focusCode;
  @override
  String get focusId;
  @override
  String get parentFocusId;
  String get widgetName;

  /// Create a copy of InitFocusMetaData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WidgetLevelImplCopyWith<_$WidgetLevelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LanguageLevelImplCopyWith<$Res>
    implements $InitFocusMetaDataCopyWith<$Res> {
  factory _$$LanguageLevelImplCopyWith(
    _$LanguageLevelImpl value,
    $Res Function(_$LanguageLevelImpl) then,
  ) = __$$LanguageLevelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    InitScreenFocusCode focusCode,
    String focusId,
    String parentFocusId,
    String languageName,
  });
}

/// @nodoc
class __$$LanguageLevelImplCopyWithImpl<$Res>
    extends _$InitFocusMetaDataCopyWithImpl<$Res, _$LanguageLevelImpl>
    implements _$$LanguageLevelImplCopyWith<$Res> {
  __$$LanguageLevelImplCopyWithImpl(
    _$LanguageLevelImpl _value,
    $Res Function(_$LanguageLevelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InitFocusMetaData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? focusCode = null,
    Object? focusId = null,
    Object? parentFocusId = null,
    Object? languageName = null,
  }) {
    return _then(
      _$LanguageLevelImpl(
        focusCode: null == focusCode
            ? _value.focusCode
            : focusCode // ignore: cast_nullable_to_non_nullable
                  as InitScreenFocusCode,
        focusId: null == focusId
            ? _value.focusId
            : focusId // ignore: cast_nullable_to_non_nullable
                  as String,
        parentFocusId: null == parentFocusId
            ? _value.parentFocusId
            : parentFocusId // ignore: cast_nullable_to_non_nullable
                  as String,
        languageName: null == languageName
            ? _value.languageName
            : languageName // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$LanguageLevelImpl extends LanguageLevel {
  const _$LanguageLevelImpl({
    this.focusCode = InitScreenFocusCode.widget_language,
    required this.focusId,
    required this.parentFocusId,
    required this.languageName,
  }) : super._();

  @override
  @JsonKey()
  final InitScreenFocusCode focusCode;
  @override
  final String focusId;
  @override
  final String parentFocusId;
  @override
  final String languageName;

  @override
  String toString() {
    return 'InitFocusMetaData.language(focusCode: $focusCode, focusId: $focusId, parentFocusId: $parentFocusId, languageName: $languageName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LanguageLevelImpl &&
            (identical(other.focusCode, focusCode) ||
                other.focusCode == focusCode) &&
            (identical(other.focusId, focusId) || other.focusId == focusId) &&
            (identical(other.parentFocusId, parentFocusId) ||
                other.parentFocusId == parentFocusId) &&
            (identical(other.languageName, languageName) ||
                other.languageName == languageName));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, focusCode, focusId, parentFocusId, languageName);

  /// Create a copy of InitFocusMetaData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LanguageLevelImplCopyWith<_$LanguageLevelImpl> get copyWith =>
      __$$LanguageLevelImplCopyWithImpl<_$LanguageLevelImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      InitScreenFocusCode focusCode,
      String focusId,
      String parentFocusId,
      String screenName,
    )
    screen,
    required TResult Function(
      InitScreenFocusCode focusCode,
      String focusId,
      String parentFocusId,
      String sectionName,
    )
    section,
    required TResult Function(
      InitScreenFocusCode focusCode,
      String focusId,
      String parentFocusId,
      String widgetName,
    )
    widget,
    required TResult Function(
      InitScreenFocusCode focusCode,
      String focusId,
      String parentFocusId,
      String languageName,
    )
    language,
  }) {
    return language(focusCode, focusId, parentFocusId, languageName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      InitScreenFocusCode focusCode,
      String focusId,
      String parentFocusId,
      String screenName,
    )?
    screen,
    TResult? Function(
      InitScreenFocusCode focusCode,
      String focusId,
      String parentFocusId,
      String sectionName,
    )?
    section,
    TResult? Function(
      InitScreenFocusCode focusCode,
      String focusId,
      String parentFocusId,
      String widgetName,
    )?
    widget,
    TResult? Function(
      InitScreenFocusCode focusCode,
      String focusId,
      String parentFocusId,
      String languageName,
    )?
    language,
  }) {
    return language?.call(focusCode, focusId, parentFocusId, languageName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      InitScreenFocusCode focusCode,
      String focusId,
      String parentFocusId,
      String screenName,
    )?
    screen,
    TResult Function(
      InitScreenFocusCode focusCode,
      String focusId,
      String parentFocusId,
      String sectionName,
    )?
    section,
    TResult Function(
      InitScreenFocusCode focusCode,
      String focusId,
      String parentFocusId,
      String widgetName,
    )?
    widget,
    TResult Function(
      InitScreenFocusCode focusCode,
      String focusId,
      String parentFocusId,
      String languageName,
    )?
    language,
    required TResult orElse(),
  }) {
    if (language != null) {
      return language(focusCode, focusId, parentFocusId, languageName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ScreenLevel value) screen,
    required TResult Function(SectionLevel value) section,
    required TResult Function(WidgetLevel value) widget,
    required TResult Function(LanguageLevel value) language,
  }) {
    return language(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScreenLevel value)? screen,
    TResult? Function(SectionLevel value)? section,
    TResult? Function(WidgetLevel value)? widget,
    TResult? Function(LanguageLevel value)? language,
  }) {
    return language?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScreenLevel value)? screen,
    TResult Function(SectionLevel value)? section,
    TResult Function(WidgetLevel value)? widget,
    TResult Function(LanguageLevel value)? language,
    required TResult orElse(),
  }) {
    if (language != null) {
      return language(this);
    }
    return orElse();
  }
}

abstract class LanguageLevel extends InitFocusMetaData {
  const factory LanguageLevel({
    final InitScreenFocusCode focusCode,
    required final String focusId,
    required final String parentFocusId,
    required final String languageName,
  }) = _$LanguageLevelImpl;
  const LanguageLevel._() : super._();

  @override
  InitScreenFocusCode get focusCode;
  @override
  String get focusId;
  @override
  String get parentFocusId;
  String get languageName;

  /// Create a copy of InitFocusMetaData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LanguageLevelImplCopyWith<_$LanguageLevelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
