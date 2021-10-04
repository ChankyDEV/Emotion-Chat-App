import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:emotion_chat/data/models/auth/user.dart';
import 'package:emotion_chat/repositories/friends/friends_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'friends_bloc.freezed.dart';

part 'friends_event.dart';

part 'friends_state.dart';

class FriendsBloc extends Bloc<FriendsEvent, FriendsState> {
  final FriendsRepository _repository;

  FriendsBloc(this._repository)
      : super(
          FriendsState.initial(
            friends: <ChatUser>[],
          ),
        );

  void getAllFriends() async {
    final failureOrFriends = await _repository.getAllFriends();
    failureOrFriends.fold((failure) {
      this.add(FriendsEvent.friendsChanged(<ChatUser>[]));
    }, (friends) {
      this.add(FriendsEvent.friendsChanged(friends));
    });
  }

  @override
  Stream<FriendsState> mapEventToState(FriendsEvent event) async* {
    yield* event.map(friendsChanged: _friendsChanged);
  }

  Stream<FriendsState> _friendsChanged(
    _FriendsChanged value,
  ) async* {
    yield state.copyWith(friends: value.friends);
  }
}
