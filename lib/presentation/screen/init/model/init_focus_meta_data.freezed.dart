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
    required TResult Function(Screen value) screen,
    required TResult Function(Section value) section,
    required TResult Function(Widget value) widget,
    required TResult Function(Language value) language,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Screen value)? screen,
    TResult? Function(Section value)? section,
    TResult? Function(Widget value)? widget,
    TResult? Function(Language value)? language,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Screen value)? screen,
    TResult Function(Section value)? section,
    TResult Function(Widget value)? widget,
    TResult Function(Language value)? language,
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
abstract class _$$ScreenImplCopyWith<$Res>
    implements $InitFocusMetaDataCopyWith<$Res> {
  factory _$$ScreenImplCopyWith(
    _$ScreenImpl value,
    $Res Function(_$ScreenImpl) then,
  ) = __$$ScreenImplCopyWithImpl<$Res>;
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
class __$$ScreenImplCopyWithImpl<$Res>
    extends _$InitFocusMetaDataCopyWithImpl<$Res, _$ScreenImpl>
    implements _$$ScreenImplCopyWith<$Res> {
  __$$ScreenImplCopyWithImpl(
    _$ScreenImpl _value,
    $Res Function(_$ScreenImpl) _then,
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
      _$ScreenImpl(
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

class _$ScreenImpl extends Screen {
  const _$ScreenImpl({
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
            other is _$ScreenImpl &&
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
  _$$ScreenImplCopyWith<_$ScreenImpl> get copyWith =>
      __$$ScreenImplCopyWithImpl<_$ScreenImpl>(this, _$identity);

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
    required TResult Function(Screen value) screen,
    required TResult Function(Section value) section,
    required TResult Function(Widget value) widget,
    required TResult Function(Language value) language,
  }) {
    return screen(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Screen value)? screen,
    TResult? Function(Section value)? section,
    TResult? Function(Widget value)? widget,
    TResult? Function(Language value)? language,
  }) {
    return screen?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Screen value)? screen,
    TResult Function(Section value)? section,
    TResult Function(Widget value)? widget,
    TResult Function(Language value)? language,
    required TResult orElse(),
  }) {
    if (screen != null) {
      return screen(this);
    }
    return orElse();
  }
}

abstract class Screen extends InitFocusMetaData {
  const factory Screen({
    final InitScreenFocusCode focusCode,
    required final String focusId,
    final String parentFocusId,
    required final String screenName,
  }) = _$ScreenImpl;
  const Screen._() : super._();

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
  _$$ScreenImplCopyWith<_$ScreenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SectionImplCopyWith<$Res>
    implements $InitFocusMetaDataCopyWith<$Res> {
  factory _$$SectionImplCopyWith(
    _$SectionImpl value,
    $Res Function(_$SectionImpl) then,
  ) = __$$SectionImplCopyWithImpl<$Res>;
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
class __$$SectionImplCopyWithImpl<$Res>
    extends _$InitFocusMetaDataCopyWithImpl<$Res, _$SectionImpl>
    implements _$$SectionImplCopyWith<$Res> {
  __$$SectionImplCopyWithImpl(
    _$SectionImpl _value,
    $Res Function(_$SectionImpl) _then,
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
      _$SectionImpl(
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

class _$SectionImpl extends Section {
  const _$SectionImpl({
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
            other is _$SectionImpl &&
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
  _$$SectionImplCopyWith<_$SectionImpl> get copyWith =>
      __$$SectionImplCopyWithImpl<_$SectionImpl>(this, _$identity);

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
    required TResult Function(Screen value) screen,
    required TResult Function(Section value) section,
    required TResult Function(Widget value) widget,
    required TResult Function(Language value) language,
  }) {
    return section(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Screen value)? screen,
    TResult? Function(Section value)? section,
    TResult? Function(Widget value)? widget,
    TResult? Function(Language value)? language,
  }) {
    return section?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Screen value)? screen,
    TResult Function(Section value)? section,
    TResult Function(Widget value)? widget,
    TResult Function(Language value)? language,
    required TResult orElse(),
  }) {
    if (section != null) {
      return section(this);
    }
    return orElse();
  }
}

abstract class Section extends InitFocusMetaData {
  const factory Section({
    required final InitScreenFocusCode focusCode,
    required final String focusId,
    required final String parentFocusId,
    required final String sectionName,
  }) = _$SectionImpl;
  const Section._() : super._();

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
  _$$SectionImplCopyWith<_$SectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WidgetImplCopyWith<$Res>
    implements $InitFocusMetaDataCopyWith<$Res> {
  factory _$$WidgetImplCopyWith(
    _$WidgetImpl value,
    $Res Function(_$WidgetImpl) then,
  ) = __$$WidgetImplCopyWithImpl<$Res>;
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
class __$$WidgetImplCopyWithImpl<$Res>
    extends _$InitFocusMetaDataCopyWithImpl<$Res, _$WidgetImpl>
    implements _$$WidgetImplCopyWith<$Res> {
  __$$WidgetImplCopyWithImpl(
    _$WidgetImpl _value,
    $Res Function(_$WidgetImpl) _then,
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
      _$WidgetImpl(
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

class _$WidgetImpl extends Widget {
  const _$WidgetImpl({
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
            other is _$WidgetImpl &&
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
  _$$WidgetImplCopyWith<_$WidgetImpl> get copyWith =>
      __$$WidgetImplCopyWithImpl<_$WidgetImpl>(this, _$identity);

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
    required TResult Function(Screen value) screen,
    required TResult Function(Section value) section,
    required TResult Function(Widget value) widget,
    required TResult Function(Language value) language,
  }) {
    return widget(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Screen value)? screen,
    TResult? Function(Section value)? section,
    TResult? Function(Widget value)? widget,
    TResult? Function(Language value)? language,
  }) {
    return widget?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Screen value)? screen,
    TResult Function(Section value)? section,
    TResult Function(Widget value)? widget,
    TResult Function(Language value)? language,
    required TResult orElse(),
  }) {
    if (widget != null) {
      return widget(this);
    }
    return orElse();
  }
}

abstract class Widget extends InitFocusMetaData {
  const factory Widget({
    required final InitScreenFocusCode focusCode,
    required final String focusId,
    required final String parentFocusId,
    required final String widgetName,
  }) = _$WidgetImpl;
  const Widget._() : super._();

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
  _$$WidgetImplCopyWith<_$WidgetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LanguageImplCopyWith<$Res>
    implements $InitFocusMetaDataCopyWith<$Res> {
  factory _$$LanguageImplCopyWith(
    _$LanguageImpl value,
    $Res Function(_$LanguageImpl) then,
  ) = __$$LanguageImplCopyWithImpl<$Res>;
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
class __$$LanguageImplCopyWithImpl<$Res>
    extends _$InitFocusMetaDataCopyWithImpl<$Res, _$LanguageImpl>
    implements _$$LanguageImplCopyWith<$Res> {
  __$$LanguageImplCopyWithImpl(
    _$LanguageImpl _value,
    $Res Function(_$LanguageImpl) _then,
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
      _$LanguageImpl(
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

class _$LanguageImpl extends Language {
  const _$LanguageImpl({
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
            other is _$LanguageImpl &&
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
  _$$LanguageImplCopyWith<_$LanguageImpl> get copyWith =>
      __$$LanguageImplCopyWithImpl<_$LanguageImpl>(this, _$identity);

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
    required TResult Function(Screen value) screen,
    required TResult Function(Section value) section,
    required TResult Function(Widget value) widget,
    required TResult Function(Language value) language,
  }) {
    return language(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Screen value)? screen,
    TResult? Function(Section value)? section,
    TResult? Function(Widget value)? widget,
    TResult? Function(Language value)? language,
  }) {
    return language?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Screen value)? screen,
    TResult Function(Section value)? section,
    TResult Function(Widget value)? widget,
    TResult Function(Language value)? language,
    required TResult orElse(),
  }) {
    if (language != null) {
      return language(this);
    }
    return orElse();
  }
}

abstract class Language extends InitFocusMetaData {
  const factory Language({
    final InitScreenFocusCode focusCode,
    required final String focusId,
    required final String parentFocusId,
    required final String languageName,
  }) = _$LanguageImpl;
  const Language._() : super._();

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
  _$$LanguageImplCopyWith<_$LanguageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
