import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/repositories/friends/friends_repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ContactList extends StatefulWidget {
  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  @override
  void initState() {
    _getFriends();
    super.initState();
  }

  Future<List<ChatUser>> _getFriends() async {
    final friends = await GetIt.I.get<FriendsRepository>().getAllFriends();
    return friends.fold((l) => <ChatUser>[], (r) => r);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getFriends(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final friends = snapshot.data as List<ChatUser>;
          return ListView.builder(
            itemCount: friends.length,
            itemBuilder: (context, index) {
              final friend = friends[index];
              return Card(child: Text(friend.name.value));
            },
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
