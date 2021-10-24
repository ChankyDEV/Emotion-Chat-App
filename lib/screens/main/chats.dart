import 'package:emotion_chat/blocs/auth/auth_cubit.dart';
import 'package:emotion_chat/blocs/chats/chats_bloc.dart';
import 'package:emotion_chat/blocs/network/network_bloc.dart';
import 'package:emotion_chat/data/models/conversation/conversation.dart';
import 'package:emotion_chat/data/models/invitation/invitation_sender.dart';
import 'package:emotion_chat/screens/core/consts/colors.dart';
import 'package:emotion_chat/screens/core/consts/styles.dart';
import 'package:emotion_chat/screens/core/no_internet_connection_screen.dart';
import 'package:emotion_chat/screens/utils/loading.dart';
import 'package:emotion_chat/screens/utils/user_list_item.dart';
import 'package:emotion_chat/services/routing/routing_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class Chats extends StatefulWidget {
  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  @override
  void didChangeDependencies() {
    BlocProvider.of<ChatsBloc>(context).add(ChatsEvent.refresh());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NetworkBloc, NetworkState>(
      builder: (context, networkState) {
        return BlocBuilder<ChatsBloc, ChatsState>(
          builder: (context, state) {
            return WillPopScope(
              onWillPop: () => Future.value(false),
              child: state.loading
                  ? Loading()
                  : networkState.hasInternetConnection
                      ? Scaffold(
                          appBar: AppBar(
                            automaticallyImplyLeading: false,
                            backgroundColor: cDarkGrey,
                            elevation: 0,
                            actions: _buildActionIcons(
                              state.numberOfInviters,
                              state.inviters,
                            ),
                            title: Text(
                              'Messages',
                              style: titleStyle,
                            ),
                          ),
                          body: Center(
                            child: state.numberOfConversations > 0
                                ? Padding(
                                    padding: const EdgeInsets.only(top: 24.0),
                                    child: _buildConversations(
                                      state.conversations,
                                    ),
                                  )
                                : Text(
                                    'No active chats',
                                    style: titleStyle,
                                  ),
                          ),
                        )
                      : NoInternetConnectionScreen(),
            );
          },
        );
      },
    );
  }

  List<Widget> _buildActionIcons(
    String numberOfInvitations,
    List<Inviter> invitations,
  ) {
    return <Widget>[
      IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.edit,
          color: cWhite,
          size: 18.0,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 4.0),
        child: _buildIconButton(
          onTap: () async {
            await Navigator.of(context).pushNamed(
              Screens.invitations,
              arguments: invitations,
            );
          },
          icon: Icons.person_add,
          hasNumericalAddition: numberOfInvitations != '0',
          numericAddition: numberOfInvitations,
        ),
      ),
      IconButton(
        onPressed: () {
          GetIt.I.get<AuthCubit>().logout();
        },
        icon: Icon(
          Icons.settings,
          color: cWhite,
          size: 18.0,
        ),
      ),
    ];
  }

  Widget _buildIconButton({
    required VoidCallback onTap,
    required IconData icon,
    bool hasNumericalAddition = false,
    String numericAddition = '',
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          IconButton(
            onPressed: onTap,
            icon: Icon(
              icon,
              color: cWhite,
              size: 18.0,
            ),
          ),
          hasNumericalAddition
              ? Positioned(
                  top: 7,
                  right: 7,
                  child: Container(
                    alignment: Alignment.center,
                    width: 15,
                    height: 15,
                    child: Text(
                      numericAddition,
                      style: TextStyle(fontSize: 10.0),
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: cPurple,
                      border: Border.all(
                        color: cDarkGrey,
                        width: 1,
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  Widget _buildConversations(List<Conversation> conversations) {
    return ListView.separated(
      itemCount: conversations.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () async {
            await Navigator.of(context).pushNamed(
              Screens.activeChat,
              arguments: conversations[index].friend,
            );
            BlocProvider.of<ChatsBloc>(context).add(ChatsEvent.refresh());
          },
          child: _buildConversationItem(
            conversations[index],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          color: cWhite.withOpacity(0.2),
          thickness: 1.5,
          indent: 16,
          endIndent: 12,
        );
      },
    );
  }

  Widget _buildConversationItem(Conversation conversation) => UserListItem(
        user: conversation.friend,
        name: conversation.friend.name.value,
        isActive: true,
        message: conversation.lastMessage.content.value,
        time: conversation.lastMessage.createdAt,
      );
}
