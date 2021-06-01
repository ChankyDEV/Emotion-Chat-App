// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'more_info_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MoreInfoFormEventTearOff {
  const _$MoreInfoFormEventTearOff();

  _GenderPositionChanged genderPositionChanged({required int position}) {
    return _GenderPositionChanged(
      position: position,
    );
  }

  _NameChanged nameChanged({required String input}) {
    return _NameChanged(
      input: input,
    );
  }

  _UpdateUserInformations updateUserInformations() {
    return const _UpdateUserInformations();
  }

  _OpenNameTextField openNameTextField() {
    return const _OpenNameTextField();
  }

  _ButtonClicked buttonClicked() {
    return const _ButtonClicked();
  }

  _SendError sendError() {
    return const _SendError();
  }

  _ChooseProfileImage chooseProfileImage({required bool fromGallery}) {
    return _ChooseProfileImage(
      fromGallery: fromGallery,
    );
  }

  _RemoveProfileImage removeProfileImage() {
    return const _RemoveProfileImage();
  }
}

/// @nodoc
const $MoreInfoFormEvent = _$MoreInfoFormEventTearOff();

/// @nodoc
mixin _$MoreInfoFormEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int position) genderPositionChanged,
    required TResult Function(String input) nameChanged,
    required TResult Function() updateUserInformations,
    required TResult Function() openNameTextField,
    required TResult Function() buttonClicked,
    required TResult Function() sendError,
    required TResult Function(bool fromGallery) chooseProfileImage,
    required TResult Function() removeProfileImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int position)? genderPositionChanged,
    TResult Function(String input)? nameChanged,
    TResult Function()? updateUserInformations,
    TResult Function()? openNameTextField,
    TResult Function()? buttonClicked,
    TResult Function()? sendError,
    TResult Function(bool fromGallery)? chooseProfileImage,
    TResult Function()? removeProfileImage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GenderPositionChanged value)
        genderPositionChanged,
    required TResult Function(_NameChanged value) nameChanged,
    required TResult Function(_UpdateUserInformations value)
        updateUserInformations,
    required TResult Function(_OpenNameTextField value) openNameTextField,
    required TResult Function(_ButtonClicked value) buttonClicked,
    required TResult Function(_SendError value) sendError,
    required TResult Function(_ChooseProfileImage value) chooseProfileImage,
    required TResult Function(_RemoveProfileImage value) removeProfileImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GenderPositionChanged value)? genderPositionChanged,
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_UpdateUserInformations value)? updateUserInformations,
    TResult Function(_OpenNameTextField value)? openNameTextField,
    TResult Function(_ButtonClicked value)? buttonClicked,
    TResult Function(_SendError value)? sendError,
    TResult Function(_ChooseProfileImage value)? chooseProfileImage,
    TResult Function(_RemoveProfileImage value)? removeProfileImage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoreInfoFormEventCopyWith<$Res> {
  factory $MoreInfoFormEventCopyWith(
          MoreInfoFormEvent value, $Res Function(MoreInfoFormEvent) then) =
      _$MoreInfoFormEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$MoreInfoFormEventCopyWithImpl<$Res>
    implements $MoreInfoFormEventCopyWith<$Res> {
  _$MoreInfoFormEventCopyWithImpl(this._value, this._then);

  final MoreInfoFormEvent _value;
  // ignore: unused_field
  final $Res Function(MoreInfoFormEvent) _then;
}

/// @nodoc
abstract class _$GenderPositionChangedCopyWith<$Res> {
  factory _$GenderPositionChangedCopyWith(_GenderPositionChanged value,
          $Res Function(_GenderPositionChanged) then) =
      __$GenderPositionChangedCopyWithImpl<$Res>;
  $Res call({int position});
}

/// @nodoc
class __$GenderPositionChangedCopyWithImpl<$Res>
    extends _$MoreInfoFormEventCopyWithImpl<$Res>
    implements _$GenderPositionChangedCopyWith<$Res> {
  __$GenderPositionChangedCopyWithImpl(_GenderPositionChanged _value,
      $Res Function(_GenderPositionChanged) _then)
      : super(_value, (v) => _then(v as _GenderPositionChanged));

  @override
  _GenderPositionChanged get _value => super._value as _GenderPositionChanged;

  @override
  $Res call({
    Object? position = freezed,
  }) {
    return _then(_GenderPositionChanged(
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_GenderPositionChanged implements _GenderPositionChanged {
  const _$_GenderPositionChanged({required this.position});

  @override
  final int position;

  @override
  String toString() {
    return 'MoreInfoFormEvent.genderPositionChanged(position: $position)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GenderPositionChanged &&
            (identical(other.position, position) ||
                const DeepCollectionEquality()
                    .equals(other.position, position)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(position);

  @JsonKey(ignore: true)
  @override
  _$GenderPositionChangedCopyWith<_GenderPositionChanged> get copyWith =>
      __$GenderPositionChangedCopyWithImpl<_GenderPositionChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int position) genderPositionChanged,
    required TResult Function(String input) nameChanged,
    required TResult Function() updateUserInformations,
    required TResult Function() openNameTextField,
    required TResult Function() buttonClicked,
    required TResult Function() sendError,
    required TResult Function(bool fromGallery) chooseProfileImage,
    required TResult Function() removeProfileImage,
  }) {
    return genderPositionChanged(position);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int position)? genderPositionChanged,
    TResult Function(String input)? nameChanged,
    TResult Function()? updateUserInformations,
    TResult Function()? openNameTextField,
    TResult Function()? buttonClicked,
    TResult Function()? sendError,
    TResult Function(bool fromGallery)? chooseProfileImage,
    TResult Function()? removeProfileImage,
    required TResult orElse(),
  }) {
    if (genderPositionChanged != null) {
      return genderPositionChanged(position);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GenderPositionChanged value)
        genderPositionChanged,
    required TResult Function(_NameChanged value) nameChanged,
    required TResult Function(_UpdateUserInformations value)
        updateUserInformations,
    required TResult Function(_OpenNameTextField value) openNameTextField,
    required TResult Function(_ButtonClicked value) buttonClicked,
    required TResult Function(_SendError value) sendError,
    required TResult Function(_ChooseProfileImage value) chooseProfileImage,
    required TResult Function(_RemoveProfileImage value) removeProfileImage,
  }) {
    return genderPositionChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GenderPositionChanged value)? genderPositionChanged,
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_UpdateUserInformations value)? updateUserInformations,
    TResult Function(_OpenNameTextField value)? openNameTextField,
    TResult Function(_ButtonClicked value)? buttonClicked,
    TResult Function(_SendError value)? sendError,
    TResult Function(_ChooseProfileImage value)? chooseProfileImage,
    TResult Function(_RemoveProfileImage value)? removeProfileImage,
    required TResult orElse(),
  }) {
    if (genderPositionChanged != null) {
      return genderPositionChanged(this);
    }
    return orElse();
  }
}

abstract class _GenderPositionChanged implements MoreInfoFormEvent {
  const factory _GenderPositionChanged({required int position}) =
      _$_GenderPositionChanged;

  int get position => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$GenderPositionChangedCopyWith<_GenderPositionChanged> get copyWith =>
      throw _privateConstructorUsedError;
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
    extends _$MoreInfoFormEventCopyWithImpl<$Res>
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
      input: input == freezed
          ? _value.input
          : input // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_NameChanged implements _NameChanged {
  const _$_NameChanged({required this.input});

  @override
  final String input;

  @override
  String toString() {
    return 'MoreInfoFormEvent.nameChanged(input: $input)';
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
    required TResult Function(int position) genderPositionChanged,
    required TResult Function(String input) nameChanged,
    required TResult Function() updateUserInformations,
    required TResult Function() openNameTextField,
    required TResult Function() buttonClicked,
    required TResult Function() sendError,
    required TResult Function(bool fromGallery) chooseProfileImage,
    required TResult Function() removeProfileImage,
  }) {
    return nameChanged(input);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int position)? genderPositionChanged,
    TResult Function(String input)? nameChanged,
    TResult Function()? updateUserInformations,
    TResult Function()? openNameTextField,
    TResult Function()? buttonClicked,
    TResult Function()? sendError,
    TResult Function(bool fromGallery)? chooseProfileImage,
    TResult Function()? removeProfileImage,
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
    required TResult Function(_GenderPositionChanged value)
        genderPositionChanged,
    required TResult Function(_NameChanged value) nameChanged,
    required TResult Function(_UpdateUserInformations value)
        updateUserInformations,
    required TResult Function(_OpenNameTextField value) openNameTextField,
    required TResult Function(_ButtonClicked value) buttonClicked,
    required TResult Function(_SendError value) sendError,
    required TResult Function(_ChooseProfileImage value) chooseProfileImage,
    required TResult Function(_RemoveProfileImage value) removeProfileImage,
  }) {
    return nameChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GenderPositionChanged value)? genderPositionChanged,
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_UpdateUserInformations value)? updateUserInformations,
    TResult Function(_OpenNameTextField value)? openNameTextField,
    TResult Function(_ButtonClicked value)? buttonClicked,
    TResult Function(_SendError value)? sendError,
    TResult Function(_ChooseProfileImage value)? chooseProfileImage,
    TResult Function(_RemoveProfileImage value)? removeProfileImage,
    required TResult orElse(),
  }) {
    if (nameChanged != null) {
      return nameChanged(this);
    }
    return orElse();
  }
}

abstract class _NameChanged implements MoreInfoFormEvent {
  const factory _NameChanged({required String input}) = _$_NameChanged;

  String get input => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$NameChangedCopyWith<_NameChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$UpdateUserInformationsCopyWith<$Res> {
  factory _$UpdateUserInformationsCopyWith(_UpdateUserInformations value,
          $Res Function(_UpdateUserInformations) then) =
      __$UpdateUserInformationsCopyWithImpl<$Res>;
}

/// @nodoc
class __$UpdateUserInformationsCopyWithImpl<$Res>
    extends _$MoreInfoFormEventCopyWithImpl<$Res>
    implements _$UpdateUserInformationsCopyWith<$Res> {
  __$UpdateUserInformationsCopyWithImpl(_UpdateUserInformations _value,
      $Res Function(_UpdateUserInformations) _then)
      : super(_value, (v) => _then(v as _UpdateUserInformations));

  @override
  _UpdateUserInformations get _value => super._value as _UpdateUserInformations;
}

/// @nodoc

class _$_UpdateUserInformations implements _UpdateUserInformations {
  const _$_UpdateUserInformations();

  @override
  String toString() {
    return 'MoreInfoFormEvent.updateUserInformations()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _UpdateUserInformations);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int position) genderPositionChanged,
    required TResult Function(String input) nameChanged,
    required TResult Function() updateUserInformations,
    required TResult Function() openNameTextField,
    required TResult Function() buttonClicked,
    required TResult Function() sendError,
    required TResult Function(bool fromGallery) chooseProfileImage,
    required TResult Function() removeProfileImage,
  }) {
    return updateUserInformations();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int position)? genderPositionChanged,
    TResult Function(String input)? nameChanged,
    TResult Function()? updateUserInformations,
    TResult Function()? openNameTextField,
    TResult Function()? buttonClicked,
    TResult Function()? sendError,
    TResult Function(bool fromGallery)? chooseProfileImage,
    TResult Function()? removeProfileImage,
    required TResult orElse(),
  }) {
    if (updateUserInformations != null) {
      return updateUserInformations();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GenderPositionChanged value)
        genderPositionChanged,
    required TResult Function(_NameChanged value) nameChanged,
    required TResult Function(_UpdateUserInformations value)
        updateUserInformations,
    required TResult Function(_OpenNameTextField value) openNameTextField,
    required TResult Function(_ButtonClicked value) buttonClicked,
    required TResult Function(_SendError value) sendError,
    required TResult Function(_ChooseProfileImage value) chooseProfileImage,
    required TResult Function(_RemoveProfileImage value) removeProfileImage,
  }) {
    return updateUserInformations(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GenderPositionChanged value)? genderPositionChanged,
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_UpdateUserInformations value)? updateUserInformations,
    TResult Function(_OpenNameTextField value)? openNameTextField,
    TResult Function(_ButtonClicked value)? buttonClicked,
    TResult Function(_SendError value)? sendError,
    TResult Function(_ChooseProfileImage value)? chooseProfileImage,
    TResult Function(_RemoveProfileImage value)? removeProfileImage,
    required TResult orElse(),
  }) {
    if (updateUserInformations != null) {
      return updateUserInformations(this);
    }
    return orElse();
  }
}

abstract class _UpdateUserInformations implements MoreInfoFormEvent {
  const factory _UpdateUserInformations() = _$_UpdateUserInformations;
}

/// @nodoc
abstract class _$OpenNameTextFieldCopyWith<$Res> {
  factory _$OpenNameTextFieldCopyWith(
          _OpenNameTextField value, $Res Function(_OpenNameTextField) then) =
      __$OpenNameTextFieldCopyWithImpl<$Res>;
}

/// @nodoc
class __$OpenNameTextFieldCopyWithImpl<$Res>
    extends _$MoreInfoFormEventCopyWithImpl<$Res>
    implements _$OpenNameTextFieldCopyWith<$Res> {
  __$OpenNameTextFieldCopyWithImpl(
      _OpenNameTextField _value, $Res Function(_OpenNameTextField) _then)
      : super(_value, (v) => _then(v as _OpenNameTextField));

  @override
  _OpenNameTextField get _value => super._value as _OpenNameTextField;
}

/// @nodoc

class _$_OpenNameTextField implements _OpenNameTextField {
  const _$_OpenNameTextField();

  @override
  String toString() {
    return 'MoreInfoFormEvent.openNameTextField()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _OpenNameTextField);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int position) genderPositionChanged,
    required TResult Function(String input) nameChanged,
    required TResult Function() updateUserInformations,
    required TResult Function() openNameTextField,
    required TResult Function() buttonClicked,
    required TResult Function() sendError,
    required TResult Function(bool fromGallery) chooseProfileImage,
    required TResult Function() removeProfileImage,
  }) {
    return openNameTextField();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int position)? genderPositionChanged,
    TResult Function(String input)? nameChanged,
    TResult Function()? updateUserInformations,
    TResult Function()? openNameTextField,
    TResult Function()? buttonClicked,
    TResult Function()? sendError,
    TResult Function(bool fromGallery)? chooseProfileImage,
    TResult Function()? removeProfileImage,
    required TResult orElse(),
  }) {
    if (openNameTextField != null) {
      return openNameTextField();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GenderPositionChanged value)
        genderPositionChanged,
    required TResult Function(_NameChanged value) nameChanged,
    required TResult Function(_UpdateUserInformations value)
        updateUserInformations,
    required TResult Function(_OpenNameTextField value) openNameTextField,
    required TResult Function(_ButtonClicked value) buttonClicked,
    required TResult Function(_SendError value) sendError,
    required TResult Function(_ChooseProfileImage value) chooseProfileImage,
    required TResult Function(_RemoveProfileImage value) removeProfileImage,
  }) {
    return openNameTextField(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GenderPositionChanged value)? genderPositionChanged,
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_UpdateUserInformations value)? updateUserInformations,
    TResult Function(_OpenNameTextField value)? openNameTextField,
    TResult Function(_ButtonClicked value)? buttonClicked,
    TResult Function(_SendError value)? sendError,
    TResult Function(_ChooseProfileImage value)? chooseProfileImage,
    TResult Function(_RemoveProfileImage value)? removeProfileImage,
    required TResult orElse(),
  }) {
    if (openNameTextField != null) {
      return openNameTextField(this);
    }
    return orElse();
  }
}

abstract class _OpenNameTextField implements MoreInfoFormEvent {
  const factory _OpenNameTextField() = _$_OpenNameTextField;
}

/// @nodoc
abstract class _$ButtonClickedCopyWith<$Res> {
  factory _$ButtonClickedCopyWith(
          _ButtonClicked value, $Res Function(_ButtonClicked) then) =
      __$ButtonClickedCopyWithImpl<$Res>;
}

/// @nodoc
class __$ButtonClickedCopyWithImpl<$Res>
    extends _$MoreInfoFormEventCopyWithImpl<$Res>
    implements _$ButtonClickedCopyWith<$Res> {
  __$ButtonClickedCopyWithImpl(
      _ButtonClicked _value, $Res Function(_ButtonClicked) _then)
      : super(_value, (v) => _then(v as _ButtonClicked));

  @override
  _ButtonClicked get _value => super._value as _ButtonClicked;
}

/// @nodoc

class _$_ButtonClicked implements _ButtonClicked {
  const _$_ButtonClicked();

  @override
  String toString() {
    return 'MoreInfoFormEvent.buttonClicked()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _ButtonClicked);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int position) genderPositionChanged,
    required TResult Function(String input) nameChanged,
    required TResult Function() updateUserInformations,
    required TResult Function() openNameTextField,
    required TResult Function() buttonClicked,
    required TResult Function() sendError,
    required TResult Function(bool fromGallery) chooseProfileImage,
    required TResult Function() removeProfileImage,
  }) {
    return buttonClicked();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int position)? genderPositionChanged,
    TResult Function(String input)? nameChanged,
    TResult Function()? updateUserInformations,
    TResult Function()? openNameTextField,
    TResult Function()? buttonClicked,
    TResult Function()? sendError,
    TResult Function(bool fromGallery)? chooseProfileImage,
    TResult Function()? removeProfileImage,
    required TResult orElse(),
  }) {
    if (buttonClicked != null) {
      return buttonClicked();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GenderPositionChanged value)
        genderPositionChanged,
    required TResult Function(_NameChanged value) nameChanged,
    required TResult Function(_UpdateUserInformations value)
        updateUserInformations,
    required TResult Function(_OpenNameTextField value) openNameTextField,
    required TResult Function(_ButtonClicked value) buttonClicked,
    required TResult Function(_SendError value) sendError,
    required TResult Function(_ChooseProfileImage value) chooseProfileImage,
    required TResult Function(_RemoveProfileImage value) removeProfileImage,
  }) {
    return buttonClicked(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GenderPositionChanged value)? genderPositionChanged,
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_UpdateUserInformations value)? updateUserInformations,
    TResult Function(_OpenNameTextField value)? openNameTextField,
    TResult Function(_ButtonClicked value)? buttonClicked,
    TResult Function(_SendError value)? sendError,
    TResult Function(_ChooseProfileImage value)? chooseProfileImage,
    TResult Function(_RemoveProfileImage value)? removeProfileImage,
    required TResult orElse(),
  }) {
    if (buttonClicked != null) {
      return buttonClicked(this);
    }
    return orElse();
  }
}

abstract class _ButtonClicked implements MoreInfoFormEvent {
  const factory _ButtonClicked() = _$_ButtonClicked;
}

/// @nodoc
abstract class _$SendErrorCopyWith<$Res> {
  factory _$SendErrorCopyWith(
          _SendError value, $Res Function(_SendError) then) =
      __$SendErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$SendErrorCopyWithImpl<$Res>
    extends _$MoreInfoFormEventCopyWithImpl<$Res>
    implements _$SendErrorCopyWith<$Res> {
  __$SendErrorCopyWithImpl(_SendError _value, $Res Function(_SendError) _then)
      : super(_value, (v) => _then(v as _SendError));

  @override
  _SendError get _value => super._value as _SendError;
}

/// @nodoc

class _$_SendError implements _SendError {
  const _$_SendError();

  @override
  String toString() {
    return 'MoreInfoFormEvent.sendError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _SendError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int position) genderPositionChanged,
    required TResult Function(String input) nameChanged,
    required TResult Function() updateUserInformations,
    required TResult Function() openNameTextField,
    required TResult Function() buttonClicked,
    required TResult Function() sendError,
    required TResult Function(bool fromGallery) chooseProfileImage,
    required TResult Function() removeProfileImage,
  }) {
    return sendError();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int position)? genderPositionChanged,
    TResult Function(String input)? nameChanged,
    TResult Function()? updateUserInformations,
    TResult Function()? openNameTextField,
    TResult Function()? buttonClicked,
    TResult Function()? sendError,
    TResult Function(bool fromGallery)? chooseProfileImage,
    TResult Function()? removeProfileImage,
    required TResult orElse(),
  }) {
    if (sendError != null) {
      return sendError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GenderPositionChanged value)
        genderPositionChanged,
    required TResult Function(_NameChanged value) nameChanged,
    required TResult Function(_UpdateUserInformations value)
        updateUserInformations,
    required TResult Function(_OpenNameTextField value) openNameTextField,
    required TResult Function(_ButtonClicked value) buttonClicked,
    required TResult Function(_SendError value) sendError,
    required TResult Function(_ChooseProfileImage value) chooseProfileImage,
    required TResult Function(_RemoveProfileImage value) removeProfileImage,
  }) {
    return sendError(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GenderPositionChanged value)? genderPositionChanged,
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_UpdateUserInformations value)? updateUserInformations,
    TResult Function(_OpenNameTextField value)? openNameTextField,
    TResult Function(_ButtonClicked value)? buttonClicked,
    TResult Function(_SendError value)? sendError,
    TResult Function(_ChooseProfileImage value)? chooseProfileImage,
    TResult Function(_RemoveProfileImage value)? removeProfileImage,
    required TResult orElse(),
  }) {
    if (sendError != null) {
      return sendError(this);
    }
    return orElse();
  }
}

abstract class _SendError implements MoreInfoFormEvent {
  const factory _SendError() = _$_SendError;
}

/// @nodoc
abstract class _$ChooseProfileImageCopyWith<$Res> {
  factory _$ChooseProfileImageCopyWith(
          _ChooseProfileImage value, $Res Function(_ChooseProfileImage) then) =
      __$ChooseProfileImageCopyWithImpl<$Res>;
  $Res call({bool fromGallery});
}

/// @nodoc
class __$ChooseProfileImageCopyWithImpl<$Res>
    extends _$MoreInfoFormEventCopyWithImpl<$Res>
    implements _$ChooseProfileImageCopyWith<$Res> {
  __$ChooseProfileImageCopyWithImpl(
      _ChooseProfileImage _value, $Res Function(_ChooseProfileImage) _then)
      : super(_value, (v) => _then(v as _ChooseProfileImage));

  @override
  _ChooseProfileImage get _value => super._value as _ChooseProfileImage;

  @override
  $Res call({
    Object? fromGallery = freezed,
  }) {
    return _then(_ChooseProfileImage(
      fromGallery: fromGallery == freezed
          ? _value.fromGallery
          : fromGallery // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ChooseProfileImage implements _ChooseProfileImage {
  const _$_ChooseProfileImage({required this.fromGallery});

  @override
  final bool fromGallery;

  @override
  String toString() {
    return 'MoreInfoFormEvent.chooseProfileImage(fromGallery: $fromGallery)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ChooseProfileImage &&
            (identical(other.fromGallery, fromGallery) ||
                const DeepCollectionEquality()
                    .equals(other.fromGallery, fromGallery)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(fromGallery);

  @JsonKey(ignore: true)
  @override
  _$ChooseProfileImageCopyWith<_ChooseProfileImage> get copyWith =>
      __$ChooseProfileImageCopyWithImpl<_ChooseProfileImage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int position) genderPositionChanged,
    required TResult Function(String input) nameChanged,
    required TResult Function() updateUserInformations,
    required TResult Function() openNameTextField,
    required TResult Function() buttonClicked,
    required TResult Function() sendError,
    required TResult Function(bool fromGallery) chooseProfileImage,
    required TResult Function() removeProfileImage,
  }) {
    return chooseProfileImage(fromGallery);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int position)? genderPositionChanged,
    TResult Function(String input)? nameChanged,
    TResult Function()? updateUserInformations,
    TResult Function()? openNameTextField,
    TResult Function()? buttonClicked,
    TResult Function()? sendError,
    TResult Function(bool fromGallery)? chooseProfileImage,
    TResult Function()? removeProfileImage,
    required TResult orElse(),
  }) {
    if (chooseProfileImage != null) {
      return chooseProfileImage(fromGallery);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GenderPositionChanged value)
        genderPositionChanged,
    required TResult Function(_NameChanged value) nameChanged,
    required TResult Function(_UpdateUserInformations value)
        updateUserInformations,
    required TResult Function(_OpenNameTextField value) openNameTextField,
    required TResult Function(_ButtonClicked value) buttonClicked,
    required TResult Function(_SendError value) sendError,
    required TResult Function(_ChooseProfileImage value) chooseProfileImage,
    required TResult Function(_RemoveProfileImage value) removeProfileImage,
  }) {
    return chooseProfileImage(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GenderPositionChanged value)? genderPositionChanged,
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_UpdateUserInformations value)? updateUserInformations,
    TResult Function(_OpenNameTextField value)? openNameTextField,
    TResult Function(_ButtonClicked value)? buttonClicked,
    TResult Function(_SendError value)? sendError,
    TResult Function(_ChooseProfileImage value)? chooseProfileImage,
    TResult Function(_RemoveProfileImage value)? removeProfileImage,
    required TResult orElse(),
  }) {
    if (chooseProfileImage != null) {
      return chooseProfileImage(this);
    }
    return orElse();
  }
}

abstract class _ChooseProfileImage implements MoreInfoFormEvent {
  const factory _ChooseProfileImage({required bool fromGallery}) =
      _$_ChooseProfileImage;

  bool get fromGallery => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$ChooseProfileImageCopyWith<_ChooseProfileImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$RemoveProfileImageCopyWith<$Res> {
  factory _$RemoveProfileImageCopyWith(
          _RemoveProfileImage value, $Res Function(_RemoveProfileImage) then) =
      __$RemoveProfileImageCopyWithImpl<$Res>;
}

/// @nodoc
class __$RemoveProfileImageCopyWithImpl<$Res>
    extends _$MoreInfoFormEventCopyWithImpl<$Res>
    implements _$RemoveProfileImageCopyWith<$Res> {
  __$RemoveProfileImageCopyWithImpl(
      _RemoveProfileImage _value, $Res Function(_RemoveProfileImage) _then)
      : super(_value, (v) => _then(v as _RemoveProfileImage));

  @override
  _RemoveProfileImage get _value => super._value as _RemoveProfileImage;
}

/// @nodoc

class _$_RemoveProfileImage implements _RemoveProfileImage {
  const _$_RemoveProfileImage();

  @override
  String toString() {
    return 'MoreInfoFormEvent.removeProfileImage()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _RemoveProfileImage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int position) genderPositionChanged,
    required TResult Function(String input) nameChanged,
    required TResult Function() updateUserInformations,
    required TResult Function() openNameTextField,
    required TResult Function() buttonClicked,
    required TResult Function() sendError,
    required TResult Function(bool fromGallery) chooseProfileImage,
    required TResult Function() removeProfileImage,
  }) {
    return removeProfileImage();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int position)? genderPositionChanged,
    TResult Function(String input)? nameChanged,
    TResult Function()? updateUserInformations,
    TResult Function()? openNameTextField,
    TResult Function()? buttonClicked,
    TResult Function()? sendError,
    TResult Function(bool fromGallery)? chooseProfileImage,
    TResult Function()? removeProfileImage,
    required TResult orElse(),
  }) {
    if (removeProfileImage != null) {
      return removeProfileImage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GenderPositionChanged value)
        genderPositionChanged,
    required TResult Function(_NameChanged value) nameChanged,
    required TResult Function(_UpdateUserInformations value)
        updateUserInformations,
    required TResult Function(_OpenNameTextField value) openNameTextField,
    required TResult Function(_ButtonClicked value) buttonClicked,
    required TResult Function(_SendError value) sendError,
    required TResult Function(_ChooseProfileImage value) chooseProfileImage,
    required TResult Function(_RemoveProfileImage value) removeProfileImage,
  }) {
    return removeProfileImage(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GenderPositionChanged value)? genderPositionChanged,
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_UpdateUserInformations value)? updateUserInformations,
    TResult Function(_OpenNameTextField value)? openNameTextField,
    TResult Function(_ButtonClicked value)? buttonClicked,
    TResult Function(_SendError value)? sendError,
    TResult Function(_ChooseProfileImage value)? chooseProfileImage,
    TResult Function(_RemoveProfileImage value)? removeProfileImage,
    required TResult orElse(),
  }) {
    if (removeProfileImage != null) {
      return removeProfileImage(this);
    }
    return orElse();
  }
}

abstract class _RemoveProfileImage implements MoreInfoFormEvent {
  const factory _RemoveProfileImage() = _$_RemoveProfileImage;
}

/// @nodoc
class _$MoreInfoFormStateTearOff {
  const _$MoreInfoFormStateTearOff();

  _Initial initial(
      {required int genderPosition,
      required Name name,
      required bool isNameTextFieldOpened,
      required bool isButtonClicked,
      required bool hasErrors,
      required Image profileImage,
      required bool updateUpWentWell,
      required bool isImageUploaded}) {
    return _Initial(
      genderPosition: genderPosition,
      name: name,
      isNameTextFieldOpened: isNameTextFieldOpened,
      isButtonClicked: isButtonClicked,
      hasErrors: hasErrors,
      profileImage: profileImage,
      updateUpWentWell: updateUpWentWell,
      isImageUploaded: isImageUploaded,
    );
  }
}

/// @nodoc
const $MoreInfoFormState = _$MoreInfoFormStateTearOff();

/// @nodoc
mixin _$MoreInfoFormState {
  int get genderPosition => throw _privateConstructorUsedError;
  Name get name => throw _privateConstructorUsedError;
  bool get isNameTextFieldOpened => throw _privateConstructorUsedError;
  bool get isButtonClicked => throw _privateConstructorUsedError;
  bool get hasErrors => throw _privateConstructorUsedError;
  Image get profileImage => throw _privateConstructorUsedError;
  bool get updateUpWentWell => throw _privateConstructorUsedError;
  bool get isImageUploaded => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int genderPosition,
            Name name,
            bool isNameTextFieldOpened,
            bool isButtonClicked,
            bool hasErrors,
            Image profileImage,
            bool updateUpWentWell,
            bool isImageUploaded)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int genderPosition,
            Name name,
            bool isNameTextFieldOpened,
            bool isButtonClicked,
            bool hasErrors,
            Image profileImage,
            bool updateUpWentWell,
            bool isImageUploaded)?
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
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MoreInfoFormStateCopyWith<MoreInfoFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoreInfoFormStateCopyWith<$Res> {
  factory $MoreInfoFormStateCopyWith(
          MoreInfoFormState value, $Res Function(MoreInfoFormState) then) =
      _$MoreInfoFormStateCopyWithImpl<$Res>;
  $Res call(
      {int genderPosition,
      Name name,
      bool isNameTextFieldOpened,
      bool isButtonClicked,
      bool hasErrors,
      Image profileImage,
      bool updateUpWentWell,
      bool isImageUploaded});
}

/// @nodoc
class _$MoreInfoFormStateCopyWithImpl<$Res>
    implements $MoreInfoFormStateCopyWith<$Res> {
  _$MoreInfoFormStateCopyWithImpl(this._value, this._then);

  final MoreInfoFormState _value;
  // ignore: unused_field
  final $Res Function(MoreInfoFormState) _then;

  @override
  $Res call({
    Object? genderPosition = freezed,
    Object? name = freezed,
    Object? isNameTextFieldOpened = freezed,
    Object? isButtonClicked = freezed,
    Object? hasErrors = freezed,
    Object? profileImage = freezed,
    Object? updateUpWentWell = freezed,
    Object? isImageUploaded = freezed,
  }) {
    return _then(_value.copyWith(
      genderPosition: genderPosition == freezed
          ? _value.genderPosition
          : genderPosition // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Name,
      isNameTextFieldOpened: isNameTextFieldOpened == freezed
          ? _value.isNameTextFieldOpened
          : isNameTextFieldOpened // ignore: cast_nullable_to_non_nullable
              as bool,
      isButtonClicked: isButtonClicked == freezed
          ? _value.isButtonClicked
          : isButtonClicked // ignore: cast_nullable_to_non_nullable
              as bool,
      hasErrors: hasErrors == freezed
          ? _value.hasErrors
          : hasErrors // ignore: cast_nullable_to_non_nullable
              as bool,
      profileImage: profileImage == freezed
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as Image,
      updateUpWentWell: updateUpWentWell == freezed
          ? _value.updateUpWentWell
          : updateUpWentWell // ignore: cast_nullable_to_non_nullable
              as bool,
      isImageUploaded: isImageUploaded == freezed
          ? _value.isImageUploaded
          : isImageUploaded // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$InitialCopyWith<$Res>
    implements $MoreInfoFormStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
  @override
  $Res call(
      {int genderPosition,
      Name name,
      bool isNameTextFieldOpened,
      bool isButtonClicked,
      bool hasErrors,
      Image profileImage,
      bool updateUpWentWell,
      bool isImageUploaded});
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$MoreInfoFormStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;

  @override
  $Res call({
    Object? genderPosition = freezed,
    Object? name = freezed,
    Object? isNameTextFieldOpened = freezed,
    Object? isButtonClicked = freezed,
    Object? hasErrors = freezed,
    Object? profileImage = freezed,
    Object? updateUpWentWell = freezed,
    Object? isImageUploaded = freezed,
  }) {
    return _then(_Initial(
      genderPosition: genderPosition == freezed
          ? _value.genderPosition
          : genderPosition // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Name,
      isNameTextFieldOpened: isNameTextFieldOpened == freezed
          ? _value.isNameTextFieldOpened
          : isNameTextFieldOpened // ignore: cast_nullable_to_non_nullable
              as bool,
      isButtonClicked: isButtonClicked == freezed
          ? _value.isButtonClicked
          : isButtonClicked // ignore: cast_nullable_to_non_nullable
              as bool,
      hasErrors: hasErrors == freezed
          ? _value.hasErrors
          : hasErrors // ignore: cast_nullable_to_non_nullable
              as bool,
      profileImage: profileImage == freezed
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as Image,
      updateUpWentWell: updateUpWentWell == freezed
          ? _value.updateUpWentWell
          : updateUpWentWell // ignore: cast_nullable_to_non_nullable
              as bool,
      isImageUploaded: isImageUploaded == freezed
          ? _value.isImageUploaded
          : isImageUploaded // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial(
      {required this.genderPosition,
      required this.name,
      required this.isNameTextFieldOpened,
      required this.isButtonClicked,
      required this.hasErrors,
      required this.profileImage,
      required this.updateUpWentWell,
      required this.isImageUploaded});

  @override
  final int genderPosition;
  @override
  final Name name;
  @override
  final bool isNameTextFieldOpened;
  @override
  final bool isButtonClicked;
  @override
  final bool hasErrors;
  @override
  final Image profileImage;
  @override
  final bool updateUpWentWell;
  @override
  final bool isImageUploaded;

  @override
  String toString() {
    return 'MoreInfoFormState.initial(genderPosition: $genderPosition, name: $name, isNameTextFieldOpened: $isNameTextFieldOpened, isButtonClicked: $isButtonClicked, hasErrors: $hasErrors, profileImage: $profileImage, updateUpWentWell: $updateUpWentWell, isImageUploaded: $isImageUploaded)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Initial &&
            (identical(other.genderPosition, genderPosition) ||
                const DeepCollectionEquality()
                    .equals(other.genderPosition, genderPosition)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.isNameTextFieldOpened, isNameTextFieldOpened) ||
                const DeepCollectionEquality().equals(
                    other.isNameTextFieldOpened, isNameTextFieldOpened)) &&
            (identical(other.isButtonClicked, isButtonClicked) ||
                const DeepCollectionEquality()
                    .equals(other.isButtonClicked, isButtonClicked)) &&
            (identical(other.hasErrors, hasErrors) ||
                const DeepCollectionEquality()
                    .equals(other.hasErrors, hasErrors)) &&
            (identical(other.profileImage, profileImage) ||
                const DeepCollectionEquality()
                    .equals(other.profileImage, profileImage)) &&
            (identical(other.updateUpWentWell, updateUpWentWell) ||
                const DeepCollectionEquality()
                    .equals(other.updateUpWentWell, updateUpWentWell)) &&
            (identical(other.isImageUploaded, isImageUploaded) ||
                const DeepCollectionEquality()
                    .equals(other.isImageUploaded, isImageUploaded)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(genderPosition) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(isNameTextFieldOpened) ^
      const DeepCollectionEquality().hash(isButtonClicked) ^
      const DeepCollectionEquality().hash(hasErrors) ^
      const DeepCollectionEquality().hash(profileImage) ^
      const DeepCollectionEquality().hash(updateUpWentWell) ^
      const DeepCollectionEquality().hash(isImageUploaded);

  @JsonKey(ignore: true)
  @override
  _$InitialCopyWith<_Initial> get copyWith =>
      __$InitialCopyWithImpl<_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int genderPosition,
            Name name,
            bool isNameTextFieldOpened,
            bool isButtonClicked,
            bool hasErrors,
            Image profileImage,
            bool updateUpWentWell,
            bool isImageUploaded)
        initial,
  }) {
    return initial(genderPosition, name, isNameTextFieldOpened, isButtonClicked,
        hasErrors, profileImage, updateUpWentWell, isImageUploaded);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int genderPosition,
            Name name,
            bool isNameTextFieldOpened,
            bool isButtonClicked,
            bool hasErrors,
            Image profileImage,
            bool updateUpWentWell,
            bool isImageUploaded)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(
          genderPosition,
          name,
          isNameTextFieldOpened,
          isButtonClicked,
          hasErrors,
          profileImage,
          updateUpWentWell,
          isImageUploaded);
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

abstract class _Initial implements MoreInfoFormState {
  const factory _Initial(
      {required int genderPosition,
      required Name name,
      required bool isNameTextFieldOpened,
      required bool isButtonClicked,
      required bool hasErrors,
      required Image profileImage,
      required bool updateUpWentWell,
      required bool isImageUploaded}) = _$_Initial;

  @override
  int get genderPosition => throw _privateConstructorUsedError;
  @override
  Name get name => throw _privateConstructorUsedError;
  @override
  bool get isNameTextFieldOpened => throw _privateConstructorUsedError;
  @override
  bool get isButtonClicked => throw _privateConstructorUsedError;
  @override
  bool get hasErrors => throw _privateConstructorUsedError;
  @override
  Image get profileImage => throw _privateConstructorUsedError;
  @override
  bool get updateUpWentWell => throw _privateConstructorUsedError;
  @override
  bool get isImageUploaded => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$InitialCopyWith<_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
