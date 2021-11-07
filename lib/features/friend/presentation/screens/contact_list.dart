import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/features/friend/presentation/blocs/friends/friends_bloc.dart';
import 'package:emotion_chat/features/network/presentation/blocs/network/network_bloc.dart';
import 'package:emotion_chat/features/routing/routing_service.dart';
import 'package:emotion_chat/screens/core/consts/colors.dart';
import 'package:emotion_chat/screens/core/consts/styles.dart';
import 'package:emotion_chat/screens/core/no_internet_connection_screen.dart';
import 'package:emotion_chat/screens/core/widgets/my_text_field.dart';
import 'package:emotion_chat/screens/utils/user_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactList extends StatefulWidget {
  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NetworkBloc, NetworkState>(
      builder: (context, networkState) {
        return BlocBuilder<FriendsBloc, FriendsState>(
          builder: (context, state) {
            return WillPopScope(
              onWillPop: () => Future.value(false),
              child: networkState.hasInternetConnection
                  ? Scaffold(
                      appBar: AppBar(
                        automaticallyImplyLeading: false,
                        backgroundColor: cDarkGrey,
                        elevation: 0,
                        actions: _buildActionIcons(),
                        title: Text(
                          'Friends',
                          style: titleStyle,
                        ),
                      ),
                      body: Column(
                        children: [
                          // Expanded(
                          //   flex: 1,
                          //   child: const SizedBox(), //_buildSearchBar(),
                          // ),
                          const SizedBox(
                            height: 20,
                          ),
                          Expanded(
                            flex: 10,
                            child: _buildFriends(state.friends),
                          ),
                        ],
                      ),
                    )
                  : NoInternetConnectionScreen(),
            );
          },
        );
      },
    );
  }

  List<Widget> _buildActionIcons() {
    return <Widget>[
      IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.person_add,
          color: cWhite,
          size: 18.0,
        ),
      ),
      IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.settings,
          color: cWhite,
          size: 18.0,
        ),
      ),
    ];
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: MyTextField(
        hint: 'Search...',
        prefixIcon: Icons.search,
        inputType: InputType.emailAddress,
        controller: TextEditingController(),
        action: () {},
        isTextVisible: true,
        textInputAction: TextInputAction.done,
        onSubmitted: (value) {},
      ),
    );
  }

  Widget _buildFriends(List<ChatUser> friends) {
    return ListView.separated(
      itemCount: friends.length,
      itemBuilder: (context, index) {
        final friend = friends[index];
        return GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              Screens.activeChat,
              arguments: friend,
            );
          },
          child: UserListItem(
            user: friend,
            name: friend.name.value,
            isActive: true,
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
}