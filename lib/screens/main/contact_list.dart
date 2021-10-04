import 'package:emotion_chat/constants/blocs.dart';
import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/screens/core/consts/colors.dart';
import 'package:emotion_chat/screens/core/consts/styles.dart';
import 'package:emotion_chat/screens/core/widgets/my_text_field.dart';
import 'package:emotion_chat/services/routing/routing_service.dart';
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
    return BlocBuilder<FriendsBloc, FriendsState>(
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () => Future.value(false),
          child: Scaffold(
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
                Expanded(
                  flex: 1,
                  child: _buildSearchBar(),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  flex: 10,
                  child: _buildFriends(state.friends),
                ),
              ],
            ),
          ),
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
    return ListView.builder(
      itemCount: friends.length,
      itemBuilder: (context, index) {
        final friend = friends[index];
        return GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              Screens.chat,
              arguments: friend,
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            height: 80,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4.0),
                  child: Container(
                    height: 60.0,
                    width: 60.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: friend.hasOwnImage
                              ? NetworkImage(friend.profileImage.url)
                              : AssetImage('assets/images/user.png')
                                  as ImageProvider,
                          fit: BoxFit.fill),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Active',
                      style: titleStyle.copyWith(
                        fontSize: 10.0,
                        color: Colors.green,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Text(
                      friend.name.value,
                      style: titleStyle.copyWith(fontSize: 14.0),
                    ),
                  ],
                ),
                Expanded(child: const SizedBox()),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      Screens.chat,
                      arguments: friend,
                    );
                  },
                  icon: Icon(
                    Icons.message,
                    color: cWhite,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
