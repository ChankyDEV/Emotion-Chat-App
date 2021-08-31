import 'package:emotion_chat/blocs/auth/auth_cubit.dart';
import 'package:emotion_chat/data/models/invitation/invitation.dart';
import 'package:emotion_chat/repositories/invitation/invitation_repository.dart';
import 'package:emotion_chat/screens/core/consts/colors.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class Chats extends StatefulWidget {
  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  late final Stream<List<Invitation>> invitations;

  @override
  void initState() {
    _initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                GetIt.I.get<AuthCubit>().logout();
              },
              icon: Icon(
                Icons.logout,
                color: cWhite,
              )),
        ],
      ),
      body: StreamBuilder(
        stream: invitations,
        builder: (context, snapshot) {
          return Center(
            child: Text((snapshot.data as List<Invitation>).first.senderUid),
          );
        },
      ),
    );
  }

  void _initialize() async {
    invitations = await GetIt.I.get<InvitationRepository>().invitations;
    invitations.listen((event) {
      event.forEach((element) {
        print(element.createdAt);
      });
    });
  }
}
