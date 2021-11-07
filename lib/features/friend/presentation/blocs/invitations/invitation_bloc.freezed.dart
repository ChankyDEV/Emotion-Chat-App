// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'invitation_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$InvitationEventTearOff {
  const _$InvitationEventTearOff();

  _AcceptInvitation accept(Invitation invitation) {
    return _AcceptInvitation(
      invitation,
    );
  }

  _DeleteInvitation delete(Invitation invitation) {
    return _DeleteInvitation(
      invitation,
    );
  }

  _InvitationsNumberChanged invitationsNumberChanged(List<Inviter> invites) {
    return _InvitationsNumberChanged(
      invites,
    );
  }

  _SendInvitation sendInvitation(String email) {
    return _SendInvitation(
      email,
    );
  }
}

/// @nodoc
const $InvitationEvent = _$InvitationEventTearOff();

/// @nodoc
mixin _$InvitationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Invitation invitation) accept,
    required TResult Function(Invitation invitation) delete,
    required TResult Function(List<Inviter> invites) invitationsNumberChanged,
    required TResult Function(String email) sendInvitation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Invitation invitation)? accept,
    TResult Function(Invitation invitation)? delete,
    TResult Function(List<Inviter> invites)? invitationsNumberChanged,
    TResult Function(String email)? sendInvitation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AcceptInvitation value) accept,
    required TResult Function(_DeleteInvitation value) delete,
    required TResult Function(_InvitationsNumberChanged value)
        invitationsNumberChanged,
    required TResult Function(_SendInvitation value) sendInvitation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AcceptInvitation value)? accept,
    TResult Function(_DeleteInvitation value)? delete,
    TResult Function(_InvitationsNumberChanged value)? invitationsNumberChanged,
    TResult Function(_SendInvitation value)? sendInvitation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvitationEventCopyWith<$Res> {
  factory $InvitationEventCopyWith(
          InvitationEvent value, $Res Function(InvitationEvent) then) =
      _$InvitationEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$InvitationEventCopyWithImpl<$Res>
    implements $InvitationEventCopyWith<$Res> {
  _$InvitationEventCopyWithImpl(this._value, this._then);

  final InvitationEvent _value;
  // ignore: unused_field
  final $Res Function(InvitationEvent) _then;
}

/// @nodoc
abstract class _$AcceptInvitationCopyWith<$Res> {
  factory _$AcceptInvitationCopyWith(
          _AcceptInvitation value, $Res Function(_AcceptInvitation) then) =
      __$AcceptInvitationCopyWithImpl<$Res>;
  $Res call({Invitation invitation});
}

/// @nodoc
class __$AcceptInvitationCopyWithImpl<$Res>
    extends _$InvitationEventCopyWithImpl<$Res>
    implements _$AcceptInvitationCopyWith<$Res> {
  __$AcceptInvitationCopyWithImpl(
      _AcceptInvitation _value, $Res Function(_AcceptInvitation) _then)
      : super(_value, (v) => _then(v as _AcceptInvitation));

  @override
  _AcceptInvitation get _value => super._value as _AcceptInvitation;

  @override
  $Res call({
    Object? invitation = freezed,
  }) {
    return _then(_AcceptInvitation(
      invitation == freezed
          ? _value.invitation
          : invitation // ignore: cast_nullable_to_non_nullable
              as Invitation,
    ));
  }
}

/// @nodoc

class _$_AcceptInvitation implements _AcceptInvitation {
  const _$_AcceptInvitation(this.invitation);

  @override
  final Invitation invitation;

  @override
  String toString() {
    return 'InvitationEvent.accept(invitation: $invitation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AcceptInvitation &&
            (identical(other.invitation, invitation) ||
                const DeepCollectionEquality()
                    .equals(other.invitation, invitation)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(invitation);

  @JsonKey(ignore: true)
  @override
  _$AcceptInvitationCopyWith<_AcceptInvitation> get copyWith =>
      __$AcceptInvitationCopyWithImpl<_AcceptInvitation>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Invitation invitation) accept,
    required TResult Function(Invitation invitation) delete,
    required TResult Function(List<Inviter> invites) invitationsNumberChanged,
    required TResult Function(String email) sendInvitation,
  }) {
    return accept(invitation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Invitation invitation)? accept,
    TResult Function(Invitation invitation)? delete,
    TResult Function(List<Inviter> invites)? invitationsNumberChanged,
    TResult Function(String email)? sendInvitation,
    required TResult orElse(),
  }) {
    if (accept != null) {
      return accept(invitation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AcceptInvitation value) accept,
    required TResult Function(_DeleteInvitation value) delete,
    required TResult Function(_InvitationsNumberChanged value)
        invitationsNumberChanged,
    required TResult Function(_SendInvitation value) sendInvitation,
  }) {
    return accept(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AcceptInvitation value)? accept,
    TResult Function(_DeleteInvitation value)? delete,
    TResult Function(_InvitationsNumberChanged value)? invitationsNumberChanged,
    TResult Function(_SendInvitation value)? sendInvitation,
    required TResult orElse(),
  }) {
    if (accept != null) {
      return accept(this);
    }
    return orElse();
  }
}

abstract class _AcceptInvitation implements InvitationEvent {
  const factory _AcceptInvitation(Invitation invitation) = _$_AcceptInvitation;

  Invitation get invitation => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$AcceptInvitationCopyWith<_AcceptInvitation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$DeleteInvitationCopyWith<$Res> {
  factory _$DeleteInvitationCopyWith(
          _DeleteInvitation value, $Res Function(_DeleteInvitation) then) =
      __$DeleteInvitationCopyWithImpl<$Res>;
  $Res call({Invitation invitation});
}

/// @nodoc
class __$DeleteInvitationCopyWithImpl<$Res>
    extends _$InvitationEventCopyWithImpl<$Res>
    implements _$DeleteInvitationCopyWith<$Res> {
  __$DeleteInvitationCopyWithImpl(
      _DeleteInvitation _value, $Res Function(_DeleteInvitation) _then)
      : super(_value, (v) => _then(v as _DeleteInvitation));

  @override
  _DeleteInvitation get _value => super._value as _DeleteInvitation;

  @override
  $Res call({
    Object? invitation = freezed,
  }) {
    return _then(_DeleteInvitation(
      invitation == freezed
          ? _value.invitation
          : invitation // ignore: cast_nullable_to_non_nullable
              as Invitation,
    ));
  }
}

/// @nodoc

class _$_DeleteInvitation implements _DeleteInvitation {
  const _$_DeleteInvitation(this.invitation);

  @override
  final Invitation invitation;

  @override
  String toString() {
    return 'InvitationEvent.delete(invitation: $invitation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DeleteInvitation &&
            (identical(other.invitation, invitation) ||
                const DeepCollectionEquality()
                    .equals(other.invitation, invitation)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(invitation);

  @JsonKey(ignore: true)
  @override
  _$DeleteInvitationCopyWith<_DeleteInvitation> get copyWith =>
      __$DeleteInvitationCopyWithImpl<_DeleteInvitation>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Invitation invitation) accept,
    required TResult Function(Invitation invitation) delete,
    required TResult Function(List<Inviter> invites) invitationsNumberChanged,
    required TResult Function(String email) sendInvitation,
  }) {
    return delete(invitation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Invitation invitation)? accept,
    TResult Function(Invitation invitation)? delete,
    TResult Function(List<Inviter> invites)? invitationsNumberChanged,
    TResult Function(String email)? sendInvitation,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(invitation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AcceptInvitation value) accept,
    required TResult Function(_DeleteInvitation value) delete,
    required TResult Function(_InvitationsNumberChanged value)
        invitationsNumberChanged,
    required TResult Function(_SendInvitation value) sendInvitation,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AcceptInvitation value)? accept,
    TResult Function(_DeleteInvitation value)? delete,
    TResult Function(_InvitationsNumberChanged value)? invitationsNumberChanged,
    TResult Function(_SendInvitation value)? sendInvitation,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class _DeleteInvitation implements InvitationEvent {
  const factory _DeleteInvitation(Invitation invitation) = _$_DeleteInvitation;

  Invitation get invitation => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$DeleteInvitationCopyWith<_DeleteInvitation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$InvitationsNumberChangedCopyWith<$Res> {
  factory _$InvitationsNumberChangedCopyWith(_InvitationsNumberChanged value,
          $Res Function(_InvitationsNumberChanged) then) =
      __$InvitationsNumberChangedCopyWithImpl<$Res>;
  $Res call({List<Inviter> invites});
}

/// @nodoc
class __$InvitationsNumberChangedCopyWithImpl<$Res>
    extends _$InvitationEventCopyWithImpl<$Res>
    implements _$InvitationsNumberChangedCopyWith<$Res> {
  __$InvitationsNumberChangedCopyWithImpl(_InvitationsNumberChanged _value,
      $Res Function(_InvitationsNumberChanged) _then)
      : super(_value, (v) => _then(v as _InvitationsNumberChanged));

  @override
  _InvitationsNumberChanged get _value =>
      super._value as _InvitationsNumberChanged;

  @override
  $Res call({
    Object? invites = freezed,
  }) {
    return _then(_InvitationsNumberChanged(
      invites == freezed
          ? _value.invites
          : invites // ignore: cast_nullable_to_non_nullable
              as List<Inviter>,
    ));
  }
}

/// @nodoc

class _$_InvitationsNumberChanged implements _InvitationsNumberChanged {
  const _$_InvitationsNumberChanged(this.invites);

  @override
  final List<Inviter> invites;

  @override
  String toString() {
    return 'InvitationEvent.invitationsNumberChanged(invites: $invites)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _InvitationsNumberChanged &&
            (identical(other.invites, invites) ||
                const DeepCollectionEquality().equals(other.invites, invites)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(invites);

  @JsonKey(ignore: true)
  @override
  _$InvitationsNumberChangedCopyWith<_InvitationsNumberChanged> get copyWith =>
      __$InvitationsNumberChangedCopyWithImpl<_InvitationsNumberChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Invitation invitation) accept,
    required TResult Function(Invitation invitation) delete,
    required TResult Function(List<Inviter> invites) invitationsNumberChanged,
    required TResult Function(String email) sendInvitation,
  }) {
    return invitationsNumberChanged(invites);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Invitation invitation)? accept,
    TResult Function(Invitation invitation)? delete,
    TResult Function(List<Inviter> invites)? invitationsNumberChanged,
    TResult Function(String email)? sendInvitation,
    required TResult orElse(),
  }) {
    if (invitationsNumberChanged != null) {
      return invitationsNumberChanged(invites);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AcceptInvitation value) accept,
    required TResult Function(_DeleteInvitation value) delete,
    required TResult Function(_InvitationsNumberChanged value)
        invitationsNumberChanged,
    required TResult Function(_SendInvitation value) sendInvitation,
  }) {
    return invitationsNumberChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AcceptInvitation value)? accept,
    TResult Function(_DeleteInvitation value)? delete,
    TResult Function(_InvitationsNumberChanged value)? invitationsNumberChanged,
    TResult Function(_SendInvitation value)? sendInvitation,
    required TResult orElse(),
  }) {
    if (invitationsNumberChanged != null) {
      return invitationsNumberChanged(this);
    }
    return orElse();
  }
}

abstract class _InvitationsNumberChanged implements InvitationEvent {
  const factory _InvitationsNumberChanged(List<Inviter> invites) =
      _$_InvitationsNumberChanged;

  List<Inviter> get invites => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$InvitationsNumberChangedCopyWith<_InvitationsNumberChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SendInvitationCopyWith<$Res> {
  factory _$SendInvitationCopyWith(
          _SendInvitation value, $Res Function(_SendInvitation) then) =
      __$SendInvitationCopyWithImpl<$Res>;
  $Res call({String email});
}

/// @nodoc
class __$SendInvitationCopyWithImpl<$Res>
    extends _$InvitationEventCopyWithImpl<$Res>
    implements _$SendInvitationCopyWith<$Res> {
  __$SendInvitationCopyWithImpl(
      _SendInvitation _value, $Res Function(_SendInvitation) _then)
      : super(_value, (v) => _then(v as _SendInvitation));

  @override
  _SendInvitation get _value => super._value as _SendInvitation;

  @override
  $Res call({
    Object? email = freezed,
  }) {
    return _then(_SendInvitation(
      email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SendInvitation implements _SendInvitation {
  const _$_SendInvitation(this.email);

  @override
  final String email;

  @override
  String toString() {
    return 'InvitationEvent.sendInvitation(email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SendInvitation &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(email);

  @JsonKey(ignore: true)
  @override
  _$SendInvitationCopyWith<_SendInvitation> get copyWith =>
      __$SendInvitationCopyWithImpl<_SendInvitation>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Invitation invitation) accept,
    required TResult Function(Invitation invitation) delete,
    required TResult Function(List<Inviter> invites) invitationsNumberChanged,
    required TResult Function(String email) sendInvitation,
  }) {
    return sendInvitation(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Invitation invitation)? accept,
    TResult Function(Invitation invitation)? delete,
    TResult Function(List<Inviter> invites)? invitationsNumberChanged,
    TResult Function(String email)? sendInvitation,
    required TResult orElse(),
  }) {
    if (sendInvitation != null) {
      return sendInvitation(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AcceptInvitation value) accept,
    required TResult Function(_DeleteInvitation value) delete,
    required TResult Function(_InvitationsNumberChanged value)
        invitationsNumberChanged,
    required TResult Function(_SendInvitation value) sendInvitation,
  }) {
    return sendInvitation(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AcceptInvitation value)? accept,
    TResult Function(_DeleteInvitation value)? delete,
    TResult Function(_InvitationsNumberChanged value)? invitationsNumberChanged,
    TResult Function(_SendInvitation value)? sendInvitation,
    required TResult orElse(),
  }) {
    if (sendInvitation != null) {
      return sendInvitation(this);
    }
    return orElse();
  }
}

abstract class _SendInvitation implements InvitationEvent {
  const factory _SendInvitation(String email) = _$_SendInvitation;

  String get email => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$SendInvitationCopyWith<_SendInvitation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$InvitationStateTearOff {
  const _$InvitationStateTearOff();

  _Initial initial(
      {required List<Inviter> inviters, required int numberOfInviters}) {
    return _Initial(
      inviters: inviters,
      numberOfInviters: numberOfInviters,
    );
  }
}

/// @nodoc
const $InvitationState = _$InvitationStateTearOff();

/// @nodoc
mixin _$InvitationState {
  List<Inviter> get inviters => throw _privateConstructorUsedError;
  int get numberOfInviters => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Inviter> inviters, int numberOfInviters)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Inviter> inviters, int numberOfInviters)? initial,
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
  $InvitationStateCopyWith<InvitationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvitationStateCopyWith<$Res> {
  factory $InvitationStateCopyWith(
          InvitationState value, $Res Function(InvitationState) then) =
      _$InvitationStateCopyWithImpl<$Res>;
  $Res call({List<Inviter> inviters, int numberOfInviters});
}

/// @nodoc
class _$InvitationStateCopyWithImpl<$Res>
    implements $InvitationStateCopyWith<$Res> {
  _$InvitationStateCopyWithImpl(this._value, this._then);

  final InvitationState _value;
  // ignore: unused_field
  final $Res Function(InvitationState) _then;

  @override
  $Res call({
    Object? inviters = freezed,
    Object? numberOfInviters = freezed,
  }) {
    return _then(_value.copyWith(
      inviters: inviters == freezed
          ? _value.inviters
          : inviters // ignore: cast_nullable_to_non_nullable
              as List<Inviter>,
      numberOfInviters: numberOfInviters == freezed
          ? _value.numberOfInviters
          : numberOfInviters // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$InitialCopyWith<$Res>
    implements $InvitationStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
  @override
  $Res call({List<Inviter> inviters, int numberOfInviters});
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$InvitationStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;

  @override
  $Res call({
    Object? inviters = freezed,
    Object? numberOfInviters = freezed,
  }) {
    return _then(_Initial(
      inviters: inviters == freezed
          ? _value.inviters
          : inviters // ignore: cast_nullable_to_non_nullable
              as List<Inviter>,
      numberOfInviters: numberOfInviters == freezed
          ? _value.numberOfInviters
          : numberOfInviters // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial({required this.inviters, required this.numberOfInviters});

  @override
  final List<Inviter> inviters;
  @override
  final int numberOfInviters;

  @override
  String toString() {
    return 'InvitationState.initial(inviters: $inviters, numberOfInviters: $numberOfInviters)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Initial &&
            (identical(other.inviters, inviters) ||
                const DeepCollectionEquality()
                    .equals(other.inviters, inviters)) &&
            (identical(other.numberOfInviters, numberOfInviters) ||
                const DeepCollectionEquality()
                    .equals(other.numberOfInviters, numberOfInviters)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(inviters) ^
      const DeepCollectionEquality().hash(numberOfInviters);

  @JsonKey(ignore: true)
  @override
  _$InitialCopyWith<_Initial> get copyWith =>
      __$InitialCopyWithImpl<_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Inviter> inviters, int numberOfInviters)
        initial,
  }) {
    return initial(inviters, numberOfInviters);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Inviter> inviters, int numberOfInviters)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(inviters, numberOfInviters);
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

abstract class _Initial implements InvitationState {
  const factory _Initial(
      {required List<Inviter> inviters,
      required int numberOfInviters}) = _$_Initial;

  @override
  List<Inviter> get inviters => throw _privateConstructorUsedError;
  @override
  int get numberOfInviters => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$InitialCopyWith<_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
