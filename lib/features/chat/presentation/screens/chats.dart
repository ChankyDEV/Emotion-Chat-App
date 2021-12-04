import 'package:emotion_chat/features/chat/domain/entities/conversation.dart';
import 'package:emotion_chat/features/chat/presentation/blocs/chats/chats_bloc.dart';
import 'package:emotion_chat/features/friend/domain/entities/inviter.dart';
import 'package:emotion_chat/features/network/presentation/screens/no_internet_connection_screen.dart';
import 'package:emotion_chat/features/routing/routing_service.dart';
import 'package:emotion_chat/features/user/presentation/blocs/auth/auth_cubit.dart';
import 'package:emotion_chat/features/user/presentation/screens/widgets/user_list_item.dart';
import 'package:emotion_chat/utils/presentation/abstraction/custom_state.dart';
import 'package:emotion_chat/utils/presentation/consts/colors.dart';
import 'package:emotion_chat/utils/presentation/consts/styles.dart';
import 'package:emotion_chat/utils/presentation/core/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class Chats extends StatefulWidget {
  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends CustomState<Chats> {
  @override
  void didChangeDependencies() {
    BlocProvider.of<ChatsBloc>(context).add(ChatsEvent.refresh());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatsBloc, ChatsState>(
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () => Future.value(false),
          child: state.loading
              ? Loading()
              : hasInternetConnection
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
          Icons.logout,
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
