part of 'friends_bloc.dart';

@freezed
class FriendsState with _$FriendsState {
  const factory FriendsState.initial({
    required List<ChatUser> friends,
  }) = _Initial;

}
