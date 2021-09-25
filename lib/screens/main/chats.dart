import 'package:emotion_chat/blocs/auth/auth_cubit.dart';
import 'package:emotion_chat/blocs/chats/chats_bloc.dart';
import 'package:emotion_chat/screens/core/consts/colors.dart';
import 'package:emotion_chat/screens/core/consts/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class Chats extends StatefulWidget {
  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatsBloc, ChatsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: cDarkGrey,
            elevation: 0,
            actions: _buildActionIcons(state.numberOfInvitation),
            title: Text(
              'Messages',
              style: titleStyle,
            ),
          ),
          body: Text('xD'),
        );
      },
    );
  }

  List<Widget> _buildActionIcons(String numberOfInvitations) {
    return <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 4.0),
        child: _buildIconButton(
          onTap: () async {
            // TODO: CHANGE SCREEN
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
          Icons.edit,
          color: cWhite,
          size: 18.0,
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
    return Stack(
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
    );
  }
}
