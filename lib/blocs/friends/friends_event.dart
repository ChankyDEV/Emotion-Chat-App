part of 'friends_bloc.dart';

@freezed
class FriendsEvent with _$FriendsEvent {
  const factory FriendsEvent.friendsChanged(List<ChatUser> friends) =
      _FriendsChanged;
}
