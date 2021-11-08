// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'additional_info_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AdditionalInfoEventTearOff {
  const _$AdditionalInfoEventTearOff();

  _NameChanged nameChanged(String input) {
    return _NameChanged(
      input,
    );
  }

  _NameCleared nameCleared() {
    return const _NameCleared();
  }

  _StepChanged stepChanged() {
    return const _StepChanged();
  }

  _GenderChanged genderChanged(GenderEnum activeGender) {
    return _GenderChanged(
      activeGender,
    );
  }

  _ParticularStepChanged particularStepChanged(
      int doneStepIndex, int activeStepIndex) {
    return _ParticularStepChanged(
      doneStepIndex,
      activeStepIndex,
    );
  }

  _CloseError closeError() {
    return const _CloseError();
  }

  _AddPhotoFromCamera addPhoto(AddingPhotoMethod method) {
    return _AddPhotoFromCamera(
      method,
    );
  }

  _RemovePhoto removePhoto() {
    return const _RemovePhoto();
  }
}

/// @nodoc
const $AdditionalInfoEvent = _$AdditionalInfoEventTearOff();

/// @nodoc
mixin _$AdditionalInfoEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String input) nameChanged,
    required TResult Function() nameCleared,
    required TResult Function() stepChanged,
    required TResult Function(GenderEnum activeGender) genderChanged,
    required TResult Function(int doneStepIndex, int activeStepIndex)
        particularStepChanged,
    required TResult Function() closeError,
    required TResult Function(AddingPhotoMethod method) addPhoto,
    required TResult Function() removePhoto,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String input)? nameChanged,
    TResult Function()? nameCleared,
    TResult Function()? stepChanged,
    TResult Function(GenderEnum activeGender)? genderChanged,
    TResult Function(int doneStepIndex, int activeStepIndex)?
        particularStepChanged,
    TResult Function()? closeError,
    TResult Function(AddingPhotoMethod method)? addPhoto,
    TResult Function()? removePhoto,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String input)? nameChanged,
    TResult Function()? nameCleared,
    TResult Function()? stepChanged,
    TResult Function(GenderEnum activeGender)? genderChanged,
    TResult Function(int doneStepIndex, int activeStepIndex)?
        particularStepChanged,
    TResult Function()? closeError,
    TResult Function(AddingPhotoMethod method)? addPhoto,
    TResult Function()? removePhoto,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NameChanged value) nameChanged,
    required TResult Function(_NameCleared value) nameCleared,
    required TResult Function(_StepChanged value) stepChanged,
    required TResult Function(_GenderChanged value) genderChanged,
    required TResult Function(_ParticularStepChanged value)
        particularStepChanged,
    required TResult Function(_CloseError value) closeError,
    required TResult Function(_AddPhotoFromCamera value) addPhoto,
    required TResult Function(_RemovePhoto value) removePhoto,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_NameCleared value)? nameCleared,
    TResult Function(_StepChanged value)? stepChanged,
    TResult Function(_GenderChanged value)? genderChanged,
    TResult Function(_ParticularStepChanged value)? particularStepChanged,
    TResult Function(_CloseError value)? closeError,
    TResult Function(_AddPhotoFromCamera value)? addPhoto,
    TResult Function(_RemovePhoto value)? removePhoto,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_NameCleared value)? nameCleared,
    TResult Function(_StepChanged value)? stepChanged,
    TResult Function(_GenderChanged value)? genderChanged,
    TResult Function(_ParticularStepChanged value)? particularStepChanged,
    TResult Function(_CloseError value)? closeError,
    TResult Function(_AddPhotoFromCamera value)? addPhoto,
    TResult Function(_RemovePhoto value)? removePhoto,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdditionalInfoEventCopyWith<$Res> {
  factory $AdditionalInfoEventCopyWith(
          AdditionalInfoEvent value, $Res Function(AdditionalInfoEvent) then) =
      _$AdditionalInfoEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$AdditionalInfoEventCopyWithImpl<$Res>
    implements $AdditionalInfoEventCopyWith<$Res> {
  _$AdditionalInfoEventCopyWithImpl(this._value, this._then);

  final AdditionalInfoEvent _value;
  // ignore: unused_field
  final $Res Function(AdditionalInfoEvent) _then;
}

/// @nodoc
abstract class _$NameChangedCopyWith<$Res> {
  factory _$NameChangedCopyWith(
          _NameChanged value, $Res Function(_NameChanged) then) =
      __$NameChangedCopyWithImpl<$Res>;
  $Res call({String input});
}

/// @nodoc
class __$NameChangedCopyWithImpl<$Res>
    extends _$AdditionalInfoEventCopyWithImpl<$Res>
    implements _$NameChangedCopyWith<$Res> {
  __$NameChangedCopyWithImpl(
      _NameChanged _value, $Res Function(_NameChanged) _then)
      : super(_value, (v) => _then(v as _NameChanged));

  @override
  _NameChanged get _value => super._value as _NameChanged;

  @override
  $Res call({
    Object? input = freezed,
  }) {
    return _then(_NameChanged(
      input == freezed
          ? _value.input
          : input // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_NameChanged implements _NameChanged {
  const _$_NameChanged(this.input);

  @override
  final String input;

  @override
  String toString() {
    return 'AdditionalInfoEvent.nameChanged(input: $input)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NameChanged &&
            (identical(other.input, input) ||
                const DeepCollectionEquality().equals(other.input, input)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(input);

  @JsonKey(ignore: true)
  @override
  _$NameChangedCopyWith<_NameChanged> get copyWith =>
      __$NameChangedCopyWithImpl<_NameChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String input) nameChanged,
    required TResult Function() nameCleared,
    required TResult Function() stepChanged,
    required TResult Function(GenderEnum activeGender) genderChanged,
    required TResult Function(int doneStepIndex, int activeStepIndex)
        particularStepChanged,
    required TResult Function() closeError,
    required TResult Function(AddingPhotoMethod method) addPhoto,
    required TResult Function() removePhoto,
  }) {
    return nameChanged(input);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String input)? nameChanged,
    TResult Function()? nameCleared,
    TResult Function()? stepChanged,
    TResult Function(GenderEnum activeGender)? genderChanged,
    TResult Function(int doneStepIndex, int activeStepIndex)?
        particularStepChanged,
    TResult Function()? closeError,
    TResult Function(AddingPhotoMethod method)? addPhoto,
    TResult Function()? removePhoto,
  }) {
    return nameChanged?.call(input);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String input)? nameChanged,
    TResult Function()? nameCleared,
    TResult Function()? stepChanged,
    TResult Function(GenderEnum activeGender)? genderChanged,
    TResult Function(int doneStepIndex, int activeStepIndex)?
        particularStepChanged,
    TResult Function()? closeError,
    TResult Function(AddingPhotoMethod method)? addPhoto,
    TResult Function()? removePhoto,
    required TResult orElse(),
  }) {
    if (nameChanged != null) {
      return nameChanged(input);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NameChanged value) nameChanged,
    required TResult Function(_NameCleared value) nameCleared,
    required TResult Function(_StepChanged value) stepChanged,
    required TResult Function(_GenderChanged value) genderChanged,
    required TResult Function(_ParticularStepChanged value)
        particularStepChanged,
    required TResult Function(_CloseError value) closeError,
    required TResult Function(_AddPhotoFromCamera value) addPhoto,
    required TResult Function(_RemovePhoto value) removePhoto,
  }) {
    return nameChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_NameCleared value)? nameCleared,
    TResult Function(_StepChanged value)? stepChanged,
    TResult Function(_GenderChanged value)? genderChanged,
    TResult Function(_ParticularStepChanged value)? particularStepChanged,
    TResult Function(_CloseError value)? closeError,
    TResult Function(_AddPhotoFromCamera value)? addPhoto,
    TResult Function(_RemovePhoto value)? removePhoto,
  }) {
    return nameChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_NameCleared value)? nameCleared,
    TResult Function(_StepChanged value)? stepChanged,
    TResult Function(_GenderChanged value)? genderChanged,
    TResult Function(_ParticularStepChanged value)? particularStepChanged,
    TResult Function(_CloseError value)? closeError,
    TResult Function(_AddPhotoFromCamera value)? addPhoto,
    TResult Function(_RemovePhoto value)? removePhoto,
    required TResult orElse(),
  }) {
    if (nameChanged != null) {
      return nameChanged(this);
    }
    return orElse();
  }
}

abstract class _NameChanged implements AdditionalInfoEvent {
  const factory _NameChanged(String input) = _$_NameChanged;

  String get input => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$NameChangedCopyWith<_NameChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$NameClearedCopyWith<$Res> {
  factory _$NameClearedCopyWith(
          _NameCleared value, $Res Function(_NameCleared) then) =
      __$NameClearedCopyWithImpl<$Res>;
}

/// @nodoc
class __$NameClearedCopyWithImpl<$Res>
    extends _$AdditionalInfoEventCopyWithImpl<$Res>
    implements _$NameClearedCopyWith<$Res> {
  __$NameClearedCopyWithImpl(
      _NameCleared _value, $Res Function(_NameCleared) _then)
      : super(_value, (v) => _then(v as _NameCleared));

  @override
  _NameCleared get _value => super._value as _NameCleared;
}

/// @nodoc

class _$_NameCleared implements _NameCleared {
  const _$_NameCleared();

  @override
  String toString() {
    return 'AdditionalInfoEvent.nameCleared()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _NameCleared);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String input) nameChanged,
    required TResult Function() nameCleared,
    required TResult Function() stepChanged,
    required TResult Function(GenderEnum activeGender) genderChanged,
    required TResult Function(int doneStepIndex, int activeStepIndex)
        particularStepChanged,
    required TResult Function() closeError,
    required TResult Function(AddingPhotoMethod method) addPhoto,
    required TResult Function() removePhoto,
  }) {
    return nameCleared();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String input)? nameChanged,
    TResult Function()? nameCleared,
    TResult Function()? stepChanged,
    TResult Function(GenderEnum activeGender)? genderChanged,
    TResult Function(int doneStepIndex, int activeStepIndex)?
        particularStepChanged,
    TResult Function()? closeError,
    TResult Function(AddingPhotoMethod method)? addPhoto,
    TResult Function()? removePhoto,
  }) {
    return nameCleared?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String input)? nameChanged,
    TResult Function()? nameCleared,
    TResult Function()? stepChanged,
    TResult Function(GenderEnum activeGender)? genderChanged,
    TResult Function(int doneStepIndex, int activeStepIndex)?
        particularStepChanged,
    TResult Function()? closeError,
    TResult Function(AddingPhotoMethod method)? addPhoto,
    TResult Function()? removePhoto,
    required TResult orElse(),
  }) {
    if (nameCleared != null) {
      return nameCleared();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NameChanged value) nameChanged,
    required TResult Function(_NameCleared value) nameCleared,
    required TResult Function(_StepChanged value) stepChanged,
    required TResult Function(_GenderChanged value) genderChanged,
    required TResult Function(_ParticularStepChanged value)
        particularStepChanged,
    required TResult Function(_CloseError value) closeError,
    required TResult Function(_AddPhotoFromCamera value) addPhoto,
    required TResult Function(_RemovePhoto value) removePhoto,
  }) {
    return nameCleared(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_NameCleared value)? nameCleared,
    TResult Function(_StepChanged value)? stepChanged,
    TResult Function(_GenderChanged value)? genderChanged,
    TResult Function(_ParticularStepChanged value)? particularStepChanged,
    TResult Function(_CloseError value)? closeError,
    TResult Function(_AddPhotoFromCamera value)? addPhoto,
    TResult Function(_RemovePhoto value)? removePhoto,
  }) {
    return nameCleared?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_NameCleared value)? nameCleared,
    TResult Function(_StepChanged value)? stepChanged,
    TResult Function(_GenderChanged value)? genderChanged,
    TResult Function(_ParticularStepChanged value)? particularStepChanged,
    TResult Function(_CloseError value)? closeError,
    TResult Function(_AddPhotoFromCamera value)? addPhoto,
    TResult Function(_RemovePhoto value)? removePhoto,
    required TResult orElse(),
  }) {
    if (nameCleared != null) {
      return nameCleared(this);
    }
    return orElse();
  }
}

abstract class _NameCleared implements AdditionalInfoEvent {
  const factory _NameCleared() = _$_NameCleared;
}

/// @nodoc
abstract class _$StepChangedCopyWith<$Res> {
  factory _$StepChangedCopyWith(
          _StepChanged value, $Res Function(_StepChanged) then) =
      __$StepChangedCopyWithImpl<$Res>;
}

/// @nodoc
class __$StepChangedCopyWithImpl<$Res>
    extends _$AdditionalInfoEventCopyWithImpl<$Res>
    implements _$StepChangedCopyWith<$Res> {
  __$StepChangedCopyWithImpl(
      _StepChanged _value, $Res Function(_StepChanged) _then)
      : super(_value, (v) => _then(v as _StepChanged));

  @override
  _StepChanged get _value => super._value as _StepChanged;
}

/// @nodoc

class _$_StepChanged implements _StepChanged {
  const _$_StepChanged();

  @override
  String toString() {
    return 'AdditionalInfoEvent.stepChanged()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _StepChanged);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String input) nameChanged,
    required TResult Function() nameCleared,
    required TResult Function() stepChanged,
    required TResult Function(GenderEnum activeGender) genderChanged,
    required TResult Function(int doneStepIndex, int activeStepIndex)
        particularStepChanged,
    required TResult Function() closeError,
    required TResult Function(AddingPhotoMethod method) addPhoto,
    required TResult Function() removePhoto,
  }) {
    return stepChanged();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String input)? nameChanged,
    TResult Function()? nameCleared,
    TResult Function()? stepChanged,
    TResult Function(GenderEnum activeGender)? genderChanged,
    TResult Function(int doneStepIndex, int activeStepIndex)?
        particularStepChanged,
    TResult Function()? closeError,
    TResult Function(AddingPhotoMethod method)? addPhoto,
    TResult Function()? removePhoto,
  }) {
    return stepChanged?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String input)? nameChanged,
    TResult Function()? nameCleared,
    TResult Function()? stepChanged,
    TResult Function(GenderEnum activeGender)? genderChanged,
    TResult Function(int doneStepIndex, int activeStepIndex)?
        particularStepChanged,
    TResult Function()? closeError,
    TResult Function(AddingPhotoMethod method)? addPhoto,
    TResult Function()? removePhoto,
    required TResult orElse(),
  }) {
    if (stepChanged != null) {
      return stepChanged();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NameChanged value) nameChanged,
    required TResult Function(_NameCleared value) nameCleared,
    required TResult Function(_StepChanged value) stepChanged,
    required TResult Function(_GenderChanged value) genderChanged,
    required TResult Function(_ParticularStepChanged value)
        particularStepChanged,
    required TResult Function(_CloseError value) closeError,
    required TResult Function(_AddPhotoFromCamera value) addPhoto,
    required TResult Function(_RemovePhoto value) removePhoto,
  }) {
    return stepChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_NameCleared value)? nameCleared,
    TResult Function(_StepChanged value)? stepChanged,
    TResult Function(_GenderChanged value)? genderChanged,
    TResult Function(_ParticularStepChanged value)? particularStepChanged,
    TResult Function(_CloseError value)? closeError,
    TResult Function(_AddPhotoFromCamera value)? addPhoto,
    TResult Function(_RemovePhoto value)? removePhoto,
  }) {
    return stepChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_NameCleared value)? nameCleared,
    TResult Function(_StepChanged value)? stepChanged,
    TResult Function(_GenderChanged value)? genderChanged,
    TResult Function(_ParticularStepChanged value)? particularStepChanged,
    TResult Function(_CloseError value)? closeError,
    TResult Function(_AddPhotoFromCamera value)? addPhoto,
    TResult Function(_RemovePhoto value)? removePhoto,
    required TResult orElse(),
  }) {
    if (stepChanged != null) {
      return stepChanged(this);
    }
    return orElse();
  }
}

abstract class _StepChanged implements AdditionalInfoEvent {
  const factory _StepChanged() = _$_StepChanged;
}

/// @nodoc
abstract class _$GenderChangedCopyWith<$Res> {
  factory _$GenderChangedCopyWith(
          _GenderChanged value, $Res Function(_GenderChanged) then) =
      __$GenderChangedCopyWithImpl<$Res>;
  $Res call({GenderEnum activeGender});
}

/// @nodoc
class __$GenderChangedCopyWithImpl<$Res>
    extends _$AdditionalInfoEventCopyWithImpl<$Res>
    implements _$GenderChangedCopyWith<$Res> {
  __$GenderChangedCopyWithImpl(
      _GenderChanged _value, $Res Function(_GenderChanged) _then)
      : super(_value, (v) => _then(v as _GenderChanged));

  @override
  _GenderChanged get _value => super._value as _GenderChanged;

  @override
  $Res call({
    Object? activeGender = freezed,
  }) {
    return _then(_GenderChanged(
      activeGender == freezed
          ? _value.activeGender
          : activeGender // ignore: cast_nullable_to_non_nullable
              as GenderEnum,
    ));
  }
}

/// @nodoc

class _$_GenderChanged implements _GenderChanged {
  const _$_GenderChanged(this.activeGender);

  @override
  final GenderEnum activeGender;

  @override
  String toString() {
    return 'AdditionalInfoEvent.genderChanged(activeGender: $activeGender)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GenderChanged &&
            (identical(other.activeGender, activeGender) ||
                const DeepCollectionEquality()
                    .equals(other.activeGender, activeGender)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(activeGender);

  @JsonKey(ignore: true)
  @override
  _$GenderChangedCopyWith<_GenderChanged> get copyWith =>
      __$GenderChangedCopyWithImpl<_GenderChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String input) nameChanged,
    required TResult Function() nameCleared,
    required TResult Function() stepChanged,
    required TResult Function(GenderEnum activeGender) genderChanged,
    required TResult Function(int doneStepIndex, int activeStepIndex)
        particularStepChanged,
    required TResult Function() closeError,
    required TResult Function(AddingPhotoMethod method) addPhoto,
    required TResult Function() removePhoto,
  }) {
    return genderChanged(activeGender);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String input)? nameChanged,
    TResult Function()? nameCleared,
    TResult Function()? stepChanged,
    TResult Function(GenderEnum activeGender)? genderChanged,
    TResult Function(int doneStepIndex, int activeStepIndex)?
        particularStepChanged,
    TResult Function()? closeError,
    TResult Function(AddingPhotoMethod method)? addPhoto,
    TResult Function()? removePhoto,
  }) {
    return genderChanged?.call(activeGender);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String input)? nameChanged,
    TResult Function()? nameCleared,
    TResult Function()? stepChanged,
    TResult Function(GenderEnum activeGender)? genderChanged,
    TResult Function(int doneStepIndex, int activeStepIndex)?
        particularStepChanged,
    TResult Function()? closeError,
    TResult Function(AddingPhotoMethod method)? addPhoto,
    TResult Function()? removePhoto,
    required TResult orElse(),
  }) {
    if (genderChanged != null) {
      return genderChanged(activeGender);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NameChanged value) nameChanged,
    required TResult Function(_NameCleared value) nameCleared,
    required TResult Function(_StepChanged value) stepChanged,
    required TResult Function(_GenderChanged value) genderChanged,
    required TResult Function(_ParticularStepChanged value)
        particularStepChanged,
    required TResult Function(_CloseError value) closeError,
    required TResult Function(_AddPhotoFromCamera value) addPhoto,
    required TResult Function(_RemovePhoto value) removePhoto,
  }) {
    return genderChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_NameCleared value)? nameCleared,
    TResult Function(_StepChanged value)? stepChanged,
    TResult Function(_GenderChanged value)? genderChanged,
    TResult Function(_ParticularStepChanged value)? particularStepChanged,
    TResult Function(_CloseError value)? closeError,
    TResult Function(_AddPhotoFromCamera value)? addPhoto,
    TResult Function(_RemovePhoto value)? removePhoto,
  }) {
    return genderChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_NameCleared value)? nameCleared,
    TResult Function(_StepChanged value)? stepChanged,
    TResult Function(_GenderChanged value)? genderChanged,
    TResult Function(_ParticularStepChanged value)? particularStepChanged,
    TResult Function(_CloseError value)? closeError,
    TResult Function(_AddPhotoFromCamera value)? addPhoto,
    TResult Function(_RemovePhoto value)? removePhoto,
    required TResult orElse(),
  }) {
    if (genderChanged != null) {
      return genderChanged(this);
    }
    return orElse();
  }
}

abstract class _GenderChanged implements AdditionalInfoEvent {
  const factory _GenderChanged(GenderEnum activeGender) = _$_GenderChanged;

  GenderEnum get activeGender => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$GenderChangedCopyWith<_GenderChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ParticularStepChangedCopyWith<$Res> {
  factory _$ParticularStepChangedCopyWith(_ParticularStepChanged value,
          $Res Function(_ParticularStepChanged) then) =
      __$ParticularStepChangedCopyWithImpl<$Res>;
  $Res call({int doneStepIndex, int activeStepIndex});
}

/// @nodoc
class __$ParticularStepChangedCopyWithImpl<$Res>
    extends _$AdditionalInfoEventCopyWithImpl<$Res>
    implements _$ParticularStepChangedCopyWith<$Res> {
  __$ParticularStepChangedCopyWithImpl(_ParticularStepChanged _value,
      $Res Function(_ParticularStepChanged) _then)
      : super(_value, (v) => _then(v as _ParticularStepChanged));

  @override
  _ParticularStepChanged get _value => super._value as _ParticularStepChanged;

  @override
  $Res call({
    Object? doneStepIndex = freezed,
    Object? activeStepIndex = freezed,
  }) {
    return _then(_ParticularStepChanged(
      doneStepIndex == freezed
          ? _value.doneStepIndex
          : doneStepIndex // ignore: cast_nullable_to_non_nullable
              as int,
      activeStepIndex == freezed
          ? _value.activeStepIndex
          : activeStepIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ParticularStepChanged implements _ParticularStepChanged {
  const _$_ParticularStepChanged(this.doneStepIndex, this.activeStepIndex);

  @override
  final int doneStepIndex;
  @override
  final int activeStepIndex;

  @override
  String toString() {
    return 'AdditionalInfoEvent.particularStepChanged(doneStepIndex: $doneStepIndex, activeStepIndex: $activeStepIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ParticularStepChanged &&
            (identical(other.doneStepIndex, doneStepIndex) ||
                const DeepCollectionEquality()
                    .equals(other.doneStepIndex, doneStepIndex)) &&
            (identical(other.activeStepIndex, activeStepIndex) ||
                const DeepCollectionEquality()
                    .equals(other.activeStepIndex, activeStepIndex)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(doneStepIndex) ^
      const DeepCollectionEquality().hash(activeStepIndex);

  @JsonKey(ignore: true)
  @override
  _$ParticularStepChangedCopyWith<_ParticularStepChanged> get copyWith =>
      __$ParticularStepChangedCopyWithImpl<_ParticularStepChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String input) nameChanged,
    required TResult Function() nameCleared,
    required TResult Function() stepChanged,
    required TResult Function(GenderEnum activeGender) genderChanged,
    required TResult Function(int doneStepIndex, int activeStepIndex)
        particularStepChanged,
    required TResult Function() closeError,
    required TResult Function(AddingPhotoMethod method) addPhoto,
    required TResult Function() removePhoto,
  }) {
    return particularStepChanged(doneStepIndex, activeStepIndex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String input)? nameChanged,
    TResult Function()? nameCleared,
    TResult Function()? stepChanged,
    TResult Function(GenderEnum activeGender)? genderChanged,
    TResult Function(int doneStepIndex, int activeStepIndex)?
        particularStepChanged,
    TResult Function()? closeError,
    TResult Function(AddingPhotoMethod method)? addPhoto,
    TResult Function()? removePhoto,
  }) {
    return particularStepChanged?.call(doneStepIndex, activeStepIndex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String input)? nameChanged,
    TResult Function()? nameCleared,
    TResult Function()? stepChanged,
    TResult Function(GenderEnum activeGender)? genderChanged,
    TResult Function(int doneStepIndex, int activeStepIndex)?
        particularStepChanged,
    TResult Function()? closeError,
    TResult Function(AddingPhotoMethod method)? addPhoto,
    TResult Function()? removePhoto,
    required TResult orElse(),
  }) {
    if (particularStepChanged != null) {
      return particularStepChanged(doneStepIndex, activeStepIndex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NameChanged value) nameChanged,
    required TResult Function(_NameCleared value) nameCleared,
    required TResult Function(_StepChanged value) stepChanged,
    required TResult Function(_GenderChanged value) genderChanged,
    required TResult Function(_ParticularStepChanged value)
        particularStepChanged,
    required TResult Function(_CloseError value) closeError,
    required TResult Function(_AddPhotoFromCamera value) addPhoto,
    required TResult Function(_RemovePhoto value) removePhoto,
  }) {
    return particularStepChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_NameCleared value)? nameCleared,
    TResult Function(_StepChanged value)? stepChanged,
    TResult Function(_GenderChanged value)? genderChanged,
    TResult Function(_ParticularStepChanged value)? particularStepChanged,
    TResult Function(_CloseError value)? closeError,
    TResult Function(_AddPhotoFromCamera value)? addPhoto,
    TResult Function(_RemovePhoto value)? removePhoto,
  }) {
    return particularStepChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_NameCleared value)? nameCleared,
    TResult Function(_StepChanged value)? stepChanged,
    TResult Function(_GenderChanged value)? genderChanged,
    TResult Function(_ParticularStepChanged value)? particularStepChanged,
    TResult Function(_CloseError value)? closeError,
    TResult Function(_AddPhotoFromCamera value)? addPhoto,
    TResult Function(_RemovePhoto value)? removePhoto,
    required TResult orElse(),
  }) {
    if (particularStepChanged != null) {
      return particularStepChanged(this);
    }
    return orElse();
  }
}

abstract class _ParticularStepChanged implements AdditionalInfoEvent {
  const factory _ParticularStepChanged(int doneStepIndex, int activeStepIndex) =
      _$_ParticularStepChanged;

  int get doneStepIndex => throw _privateConstructorUsedError;
  int get activeStepIndex => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$ParticularStepChangedCopyWith<_ParticularStepChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$CloseErrorCopyWith<$Res> {
  factory _$CloseErrorCopyWith(
          _CloseError value, $Res Function(_CloseError) then) =
      __$CloseErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$CloseErrorCopyWithImpl<$Res>
    extends _$AdditionalInfoEventCopyWithImpl<$Res>
    implements _$CloseErrorCopyWith<$Res> {
  __$CloseErrorCopyWithImpl(
      _CloseError _value, $Res Function(_CloseError) _then)
      : super(_value, (v) => _then(v as _CloseError));

  @override
  _CloseError get _value => super._value as _CloseError;
}

/// @nodoc

class _$_CloseError implements _CloseError {
  const _$_CloseError();

  @override
  String toString() {
    return 'AdditionalInfoEvent.closeError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _CloseError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String input) nameChanged,
    required TResult Function() nameCleared,
    required TResult Function() stepChanged,
    required TResult Function(GenderEnum activeGender) genderChanged,
    required TResult Function(int doneStepIndex, int activeStepIndex)
        particularStepChanged,
    required TResult Function() closeError,
    required TResult Function(AddingPhotoMethod method) addPhoto,
    required TResult Function() removePhoto,
  }) {
    return closeError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String input)? nameChanged,
    TResult Function()? nameCleared,
    TResult Function()? stepChanged,
    TResult Function(GenderEnum activeGender)? genderChanged,
    TResult Function(int doneStepIndex, int activeStepIndex)?
        particularStepChanged,
    TResult Function()? closeError,
    TResult Function(AddingPhotoMethod method)? addPhoto,
    TResult Function()? removePhoto,
  }) {
    return closeError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String input)? nameChanged,
    TResult Function()? nameCleared,
    TResult Function()? stepChanged,
    TResult Function(GenderEnum activeGender)? genderChanged,
    TResult Function(int doneStepIndex, int activeStepIndex)?
        particularStepChanged,
    TResult Function()? closeError,
    TResult Function(AddingPhotoMethod method)? addPhoto,
    TResult Function()? removePhoto,
    required TResult orElse(),
  }) {
    if (closeError != null) {
      return closeError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NameChanged value) nameChanged,
    required TResult Function(_NameCleared value) nameCleared,
    required TResult Function(_StepChanged value) stepChanged,
    required TResult Function(_GenderChanged value) genderChanged,
    required TResult Function(_ParticularStepChanged value)
        particularStepChanged,
    required TResult Function(_CloseError value) closeError,
    required TResult Function(_AddPhotoFromCamera value) addPhoto,
    required TResult Function(_RemovePhoto value) removePhoto,
  }) {
    return closeError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_NameCleared value)? nameCleared,
    TResult Function(_StepChanged value)? stepChanged,
    TResult Function(_GenderChanged value)? genderChanged,
    TResult Function(_ParticularStepChanged value)? particularStepChanged,
    TResult Function(_CloseError value)? closeError,
    TResult Function(_AddPhotoFromCamera value)? addPhoto,
    TResult Function(_RemovePhoto value)? removePhoto,
  }) {
    return closeError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_NameCleared value)? nameCleared,
    TResult Function(_StepChanged value)? stepChanged,
    TResult Function(_GenderChanged value)? genderChanged,
    TResult Function(_ParticularStepChanged value)? particularStepChanged,
    TResult Function(_CloseError value)? closeError,
    TResult Function(_AddPhotoFromCamera value)? addPhoto,
    TResult Function(_RemovePhoto value)? removePhoto,
    required TResult orElse(),
  }) {
    if (closeError != null) {
      return closeError(this);
    }
    return orElse();
  }
}

abstract class _CloseError implements AdditionalInfoEvent {
  const factory _CloseError() = _$_CloseError;
}

/// @nodoc
abstract class _$AddPhotoFromCameraCopyWith<$Res> {
  factory _$AddPhotoFromCameraCopyWith(
          _AddPhotoFromCamera value, $Res Function(_AddPhotoFromCamera) then) =
      __$AddPhotoFromCameraCopyWithImpl<$Res>;
  $Res call({AddingPhotoMethod method});
}

/// @nodoc
class __$AddPhotoFromCameraCopyWithImpl<$Res>
    extends _$AdditionalInfoEventCopyWithImpl<$Res>
    implements _$AddPhotoFromCameraCopyWith<$Res> {
  __$AddPhotoFromCameraCopyWithImpl(
      _AddPhotoFromCamera _value, $Res Function(_AddPhotoFromCamera) _then)
      : super(_value, (v) => _then(v as _AddPhotoFromCamera));

  @override
  _AddPhotoFromCamera get _value => super._value as _AddPhotoFromCamera;

  @override
  $Res call({
    Object? method = freezed,
  }) {
    return _then(_AddPhotoFromCamera(
      method == freezed
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as AddingPhotoMethod,
    ));
  }
}

/// @nodoc

class _$_AddPhotoFromCamera implements _AddPhotoFromCamera {
  const _$_AddPhotoFromCamera(this.method);

  @override
  final AddingPhotoMethod method;

  @override
  String toString() {
    return 'AdditionalInfoEvent.addPhoto(method: $method)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AddPhotoFromCamera &&
            (identical(other.method, method) ||
                const DeepCollectionEquality().equals(other.method, method)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(method);

  @JsonKey(ignore: true)
  @override
  _$AddPhotoFromCameraCopyWith<_AddPhotoFromCamera> get copyWith =>
      __$AddPhotoFromCameraCopyWithImpl<_AddPhotoFromCamera>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String input) nameChanged,
    required TResult Function() nameCleared,
    required TResult Function() stepChanged,
    required TResult Function(GenderEnum activeGender) genderChanged,
    required TResult Function(int doneStepIndex, int activeStepIndex)
        particularStepChanged,
    required TResult Function() closeError,
    required TResult Function(AddingPhotoMethod method) addPhoto,
    required TResult Function() removePhoto,
  }) {
    return addPhoto(method);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String input)? nameChanged,
    TResult Function()? nameCleared,
    TResult Function()? stepChanged,
    TResult Function(GenderEnum activeGender)? genderChanged,
    TResult Function(int doneStepIndex, int activeStepIndex)?
        particularStepChanged,
    TResult Function()? closeError,
    TResult Function(AddingPhotoMethod method)? addPhoto,
    TResult Function()? removePhoto,
  }) {
    return addPhoto?.call(method);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String input)? nameChanged,
    TResult Function()? nameCleared,
    TResult Function()? stepChanged,
    TResult Function(GenderEnum activeGender)? genderChanged,
    TResult Function(int doneStepIndex, int activeStepIndex)?
        particularStepChanged,
    TResult Function()? closeError,
    TResult Function(AddingPhotoMethod method)? addPhoto,
    TResult Function()? removePhoto,
    required TResult orElse(),
  }) {
    if (addPhoto != null) {
      return addPhoto(method);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NameChanged value) nameChanged,
    required TResult Function(_NameCleared value) nameCleared,
    required TResult Function(_StepChanged value) stepChanged,
    required TResult Function(_GenderChanged value) genderChanged,
    required TResult Function(_ParticularStepChanged value)
        particularStepChanged,
    required TResult Function(_CloseError value) closeError,
    required TResult Function(_AddPhotoFromCamera value) addPhoto,
    required TResult Function(_RemovePhoto value) removePhoto,
  }) {
    return addPhoto(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_NameCleared value)? nameCleared,
    TResult Function(_StepChanged value)? stepChanged,
    TResult Function(_GenderChanged value)? genderChanged,
    TResult Function(_ParticularStepChanged value)? particularStepChanged,
    TResult Function(_CloseError value)? closeError,
    TResult Function(_AddPhotoFromCamera value)? addPhoto,
    TResult Function(_RemovePhoto value)? removePhoto,
  }) {
    return addPhoto?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_NameCleared value)? nameCleared,
    TResult Function(_StepChanged value)? stepChanged,
    TResult Function(_GenderChanged value)? genderChanged,
    TResult Function(_ParticularStepChanged value)? particularStepChanged,
    TResult Function(_CloseError value)? closeError,
    TResult Function(_AddPhotoFromCamera value)? addPhoto,
    TResult Function(_RemovePhoto value)? removePhoto,
    required TResult orElse(),
  }) {
    if (addPhoto != null) {
      return addPhoto(this);
    }
    return orElse();
  }
}

abstract class _AddPhotoFromCamera implements AdditionalInfoEvent {
  const factory _AddPhotoFromCamera(AddingPhotoMethod method) =
      _$_AddPhotoFromCamera;

  AddingPhotoMethod get method => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$AddPhotoFromCameraCopyWith<_AddPhotoFromCamera> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$RemovePhotoCopyWith<$Res> {
  factory _$RemovePhotoCopyWith(
          _RemovePhoto value, $Res Function(_RemovePhoto) then) =
      __$RemovePhotoCopyWithImpl<$Res>;
}

/// @nodoc
class __$RemovePhotoCopyWithImpl<$Res>
    extends _$AdditionalInfoEventCopyWithImpl<$Res>
    implements _$RemovePhotoCopyWith<$Res> {
  __$RemovePhotoCopyWithImpl(
      _RemovePhoto _value, $Res Function(_RemovePhoto) _then)
      : super(_value, (v) => _then(v as _RemovePhoto));

  @override
  _RemovePhoto get _value => super._value as _RemovePhoto;
}

/// @nodoc

class _$_RemovePhoto implements _RemovePhoto {
  const _$_RemovePhoto();

  @override
  String toString() {
    return 'AdditionalInfoEvent.removePhoto()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _RemovePhoto);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String input) nameChanged,
    required TResult Function() nameCleared,
    required TResult Function() stepChanged,
    required TResult Function(GenderEnum activeGender) genderChanged,
    required TResult Function(int doneStepIndex, int activeStepIndex)
        particularStepChanged,
    required TResult Function() closeError,
    required TResult Function(AddingPhotoMethod method) addPhoto,
    required TResult Function() removePhoto,
  }) {
    return removePhoto();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String input)? nameChanged,
    TResult Function()? nameCleared,
    TResult Function()? stepChanged,
    TResult Function(GenderEnum activeGender)? genderChanged,
    TResult Function(int doneStepIndex, int activeStepIndex)?
        particularStepChanged,
    TResult Function()? closeError,
    TResult Function(AddingPhotoMethod method)? addPhoto,
    TResult Function()? removePhoto,
  }) {
    return removePhoto?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String input)? nameChanged,
    TResult Function()? nameCleared,
    TResult Function()? stepChanged,
    TResult Function(GenderEnum activeGender)? genderChanged,
    TResult Function(int doneStepIndex, int activeStepIndex)?
        particularStepChanged,
    TResult Function()? closeError,
    TResult Function(AddingPhotoMethod method)? addPhoto,
    TResult Function()? removePhoto,
    required TResult orElse(),
  }) {
    if (removePhoto != null) {
      return removePhoto();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NameChanged value) nameChanged,
    required TResult Function(_NameCleared value) nameCleared,
    required TResult Function(_StepChanged value) stepChanged,
    required TResult Function(_GenderChanged value) genderChanged,
    required TResult Function(_ParticularStepChanged value)
        particularStepChanged,
    required TResult Function(_CloseError value) closeError,
    required TResult Function(_AddPhotoFromCamera value) addPhoto,
    required TResult Function(_RemovePhoto value) removePhoto,
  }) {
    return removePhoto(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_NameCleared value)? nameCleared,
    TResult Function(_StepChanged value)? stepChanged,
    TResult Function(_GenderChanged value)? genderChanged,
    TResult Function(_ParticularStepChanged value)? particularStepChanged,
    TResult Function(_CloseError value)? closeError,
    TResult Function(_AddPhotoFromCamera value)? addPhoto,
    TResult Function(_RemovePhoto value)? removePhoto,
  }) {
    return removePhoto?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_NameCleared value)? nameCleared,
    TResult Function(_StepChanged value)? stepChanged,
    TResult Function(_GenderChanged value)? genderChanged,
    TResult Function(_ParticularStepChanged value)? particularStepChanged,
    TResult Function(_CloseError value)? closeError,
    TResult Function(_AddPhotoFromCamera value)? addPhoto,
    TResult Function(_RemovePhoto value)? removePhoto,
    required TResult orElse(),
  }) {
    if (removePhoto != null) {
      return removePhoto(this);
    }
    return orElse();
  }
}

abstract class _RemovePhoto implements AdditionalInfoEvent {
  const factory _RemovePhoto() = _$_RemovePhoto;
}

/// @nodoc
class _$AdditionalInfoStateTearOff {
  const _$AdditionalInfoStateTearOff();

  _Initial initial(
      {required Name name,
      required Gender gender,
      required Image photo,
      required bool hasPhoto,
      required bool showLoading,
      required int activeStep,
      required int doneStep,
      required bool failureOccured,
      required Failure failure}) {
    return _Initial(
      name: name,
      gender: gender,
      photo: photo,
      hasPhoto: hasPhoto,
      showLoading: showLoading,
      activeStep: activeStep,
      doneStep: doneStep,
      failureOccured: failureOccured,
      failure: failure,
    );
  }
}

/// @nodoc
const $AdditionalInfoState = _$AdditionalInfoStateTearOff();

/// @nodoc
mixin _$AdditionalInfoState {
  Name get name => throw _privateConstructorUsedError;
  Gender get gender => throw _privateConstructorUsedError;
  Image get photo => throw _privateConstructorUsedError;
  bool get hasPhoto => throw _privateConstructorUsedError;
  bool get showLoading => throw _privateConstructorUsedError;
  int get activeStep => throw _privateConstructorUsedError;
  int get doneStep => throw _privateConstructorUsedError;
  bool get failureOccured => throw _privateConstructorUsedError;
  Failure get failure => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Name name,
            Gender gender,
            Image photo,
            bool hasPhoto,
            bool showLoading,
            int activeStep,
            int doneStep,
            bool failureOccured,
            Failure failure)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            Name name,
            Gender gender,
            Image photo,
            bool hasPhoto,
            bool showLoading,
            int activeStep,
            int doneStep,
            bool failureOccured,
            Failure failure)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Name name,
            Gender gender,
            Image photo,
            bool hasPhoto,
            bool showLoading,
            int activeStep,
            int doneStep,
            bool failureOccured,
            Failure failure)?
        initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AdditionalInfoStateCopyWith<AdditionalInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdditionalInfoStateCopyWith<$Res> {
  factory $AdditionalInfoStateCopyWith(
          AdditionalInfoState value, $Res Function(AdditionalInfoState) then) =
      _$AdditionalInfoStateCopyWithImpl<$Res>;
  $Res call(
      {Name name,
      Gender gender,
      Image photo,
      bool hasPhoto,
      bool showLoading,
      int activeStep,
      int doneStep,
      bool failureOccured,
      Failure failure});
}

/// @nodoc
class _$AdditionalInfoStateCopyWithImpl<$Res>
    implements $AdditionalInfoStateCopyWith<$Res> {
  _$AdditionalInfoStateCopyWithImpl(this._value, this._then);

  final AdditionalInfoState _value;
  // ignore: unused_field
  final $Res Function(AdditionalInfoState) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? gender = freezed,
    Object? photo = freezed,
    Object? hasPhoto = freezed,
    Object? showLoading = freezed,
    Object? activeStep = freezed,
    Object? doneStep = freezed,
    Object? failureOccured = freezed,
    Object? failure = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Name,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender,
      photo: photo == freezed
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as Image,
      hasPhoto: hasPhoto == freezed
          ? _value.hasPhoto
          : hasPhoto // ignore: cast_nullable_to_non_nullable
              as bool,
      showLoading: showLoading == freezed
          ? _value.showLoading
          : showLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      activeStep: activeStep == freezed
          ? _value.activeStep
          : activeStep // ignore: cast_nullable_to_non_nullable
              as int,
      doneStep: doneStep == freezed
          ? _value.doneStep
          : doneStep // ignore: cast_nullable_to_non_nullable
              as int,
      failureOccured: failureOccured == freezed
          ? _value.failureOccured
          : failureOccured // ignore: cast_nullable_to_non_nullable
              as bool,
      failure: failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc
abstract class _$InitialCopyWith<$Res>
    implements $AdditionalInfoStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
  @override
  $Res call(
      {Name name,
      Gender gender,
      Image photo,
      bool hasPhoto,
      bool showLoading,
      int activeStep,
      int doneStep,
      bool failureOccured,
      Failure failure});
}

/// @nodoc
class __$InitialCopyWithImpl<$Res>
    extends _$AdditionalInfoStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;

  @override
  $Res call({
    Object? name = freezed,
    Object? gender = freezed,
    Object? photo = freezed,
    Object? hasPhoto = freezed,
    Object? showLoading = freezed,
    Object? activeStep = freezed,
    Object? doneStep = freezed,
    Object? failureOccured = freezed,
    Object? failure = freezed,
  }) {
    return _then(_Initial(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Name,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender,
      photo: photo == freezed
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as Image,
      hasPhoto: hasPhoto == freezed
          ? _value.hasPhoto
          : hasPhoto // ignore: cast_nullable_to_non_nullable
              as bool,
      showLoading: showLoading == freezed
          ? _value.showLoading
          : showLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      activeStep: activeStep == freezed
          ? _value.activeStep
          : activeStep // ignore: cast_nullable_to_non_nullable
              as int,
      doneStep: doneStep == freezed
          ? _value.doneStep
          : doneStep // ignore: cast_nullable_to_non_nullable
              as int,
      failureOccured: failureOccured == freezed
          ? _value.failureOccured
          : failureOccured // ignore: cast_nullable_to_non_nullable
              as bool,
      failure: failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial(
      {required this.name,
      required this.gender,
      required this.photo,
      required this.hasPhoto,
      required this.showLoading,
      required this.activeStep,
      required this.doneStep,
      required this.failureOccured,
      required this.failure});

  @override
  final Name name;
  @override
  final Gender gender;
  @override
  final Image photo;
  @override
  final bool hasPhoto;
  @override
  final bool showLoading;
  @override
  final int activeStep;
  @override
  final int doneStep;
  @override
  final bool failureOccured;
  @override
  final Failure failure;

  @override
  String toString() {
    return 'AdditionalInfoState.initial(name: $name, gender: $gender, photo: $photo, hasPhoto: $hasPhoto, showLoading: $showLoading, activeStep: $activeStep, doneStep: $doneStep, failureOccured: $failureOccured, failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Initial &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.gender, gender) ||
                const DeepCollectionEquality().equals(other.gender, gender)) &&
            (identical(other.photo, photo) ||
                const DeepCollectionEquality().equals(other.photo, photo)) &&
            (identical(other.hasPhoto, hasPhoto) ||
                const DeepCollectionEquality()
                    .equals(other.hasPhoto, hasPhoto)) &&
            (identical(other.showLoading, showLoading) ||
                const DeepCollectionEquality()
                    .equals(other.showLoading, showLoading)) &&
            (identical(other.activeStep, activeStep) ||
                const DeepCollectionEquality()
                    .equals(other.activeStep, activeStep)) &&
            (identical(other.doneStep, doneStep) ||
                const DeepCollectionEquality()
                    .equals(other.doneStep, doneStep)) &&
            (identical(other.failureOccured, failureOccured) ||
                const DeepCollectionEquality()
                    .equals(other.failureOccured, failureOccured)) &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(gender) ^
      const DeepCollectionEquality().hash(photo) ^
      const DeepCollectionEquality().hash(hasPhoto) ^
      const DeepCollectionEquality().hash(showLoading) ^
      const DeepCollectionEquality().hash(activeStep) ^
      const DeepCollectionEquality().hash(doneStep) ^
      const DeepCollectionEquality().hash(failureOccured) ^
      const DeepCollectionEquality().hash(failure);

  @JsonKey(ignore: true)
  @override
  _$InitialCopyWith<_Initial> get copyWith =>
      __$InitialCopyWithImpl<_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Name name,
            Gender gender,
            Image photo,
            bool hasPhoto,
            bool showLoading,
            int activeStep,
            int doneStep,
            bool failureOccured,
            Failure failure)
        initial,
  }) {
    return initial(name, gender, photo, hasPhoto, showLoading, activeStep,
        doneStep, failureOccured, failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            Name name,
            Gender gender,
            Image photo,
            bool hasPhoto,
            bool showLoading,
            int activeStep,
            int doneStep,
            bool failureOccured,
            Failure failure)?
        initial,
  }) {
    return initial?.call(name, gender, photo, hasPhoto, showLoading, activeStep,
        doneStep, failureOccured, failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Name name,
            Gender gender,
            Image photo,
            bool hasPhoto,
            bool showLoading,
            int activeStep,
            int doneStep,
            bool failureOccured,
            Failure failure)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(name, gender, photo, hasPhoto, showLoading, activeStep,
          doneStep, failureOccured, failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AdditionalInfoState {
  const factory _Initial(
      {required Name name,
      required Gender gender,
      required Image photo,
      required bool hasPhoto,
      required bool showLoading,
      required int activeStep,
      required int doneStep,
      required bool failureOccured,
      required Failure failure}) = _$_Initial;

  @override
  Name get name => throw _privateConstructorUsedError;
  @override
  Gender get gender => throw _privateConstructorUsedError;
  @override
  Image get photo => throw _privateConstructorUsedError;
  @override
  bool get hasPhoto => throw _privateConstructorUsedError;
  @override
  bool get showLoading => throw _privateConstructorUsedError;
  @override
  int get activeStep => throw _privateConstructorUsedError;
  @override
  int get doneStep => throw _privateConstructorUsedError;
  @override
  bool get failureOccured => throw _privateConstructorUsedError;
  @override
  Failure get failure => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$InitialCopyWith<_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
