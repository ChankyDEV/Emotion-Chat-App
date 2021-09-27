import 'dart:ui';

import 'package:emotion_chat/blocs/invitations/invitation_bloc.dart';
import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/data/models/invitation/invitation.dart';
import 'package:emotion_chat/data/models/invitation/invitation_sender.dart';
import 'package:emotion_chat/screens/core/consts/colors.dart';
import 'package:emotion_chat/screens/core/consts/styles.dart';
import 'package:emotion_chat/screens/core/widgets/my_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Invitations extends StatefulWidget {
  const Invitations({
    Key? key,
  }) : super(key: key);

  @override
  _InvitationsState createState() => _InvitationsState();
}

class _InvitationsState extends State<Invitations> {
  late final TextEditingController _invitationEmailController;

  @override
  void initState() {
    _invitationEmailController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InvitationBloc, InvitationState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: Text(
                'Invitations',
                style: titleStyle,
              ),
              backgroundColor: cDarkGrey,
              elevation: 0,
            ),
            body: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: _buildSendingInvitationTextField(context, state),
                ),
                Expanded(
                  flex: 10,
                  child: _buildInvitationList(context, state),
                ),
              ],
            ));
      },
    );
  }

  Widget _buildSendingInvitationTextField(
    BuildContext context,
    InvitationState state,
  ) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: MyTextField(
        hint: 'Search and send invitation',
        prefixIcon: Icons.search,
        inputType: InputType.emailAddress,
        controller: _invitationEmailController,
        action: () {
          BlocProvider.of<InvitationBloc>(context).add(
            InvitationEvent.sendInvitation(
              _invitationEmailController.value.text,
            ),
          );
        },
        suffixIcon: Icons.send,
        isTextVisible: true,
        textInputAction: TextInputAction.done,
        onSubmitted: (value) {},
      ),
    );
  }

  Widget _buildInvitationList(
    BuildContext context,
    InvitationState state,
  ) {
    return state.inviters.isNotEmpty
        ? ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (ctx, ind) => _buildInvitationItem(
              ctx,
              ind,
              state.inviters,
            ),
            separatorBuilder: (_, __) {
              return Container(
                height: 20,
                color: cWhite.withOpacity(0.1),
              );
            },
            itemCount: state.numberOfInviters,
          )
        : Center(
            child: Text(
              'There is no invitation',
              style: titleStyle,
            ),
          );
  }

  Widget _buildInvitationItem(
    BuildContext context,
    int index,
    List<Inviter> inviters,
  ) {
    final inviter = inviters[index];
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      height: 80,
      child: Row(
        children: [
          Container(
            height: 70.0,
            width: 60.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: inviter.sender.hasOwnImage
                    ? NetworkImage(inviter.sender.profileImage.url)
                    : AssetImage('assets/images/user.png') as ImageProvider,
                fit: BoxFit.fitWidth,
              ),
              shape: BoxShape.circle,
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
                inviter.sender.name.value,
                style: titleStyle.copyWith(fontSize: 14.0),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                inviter.sender.emailAddress.value,
                style: bodyStyle.copyWith(
                    fontSize: 10.0, color: cWhite.withOpacity(0.5)),
              ),
            ],
          ),
          Expanded(child: const SizedBox()),
          _buildAcceptDeclineButtons(
            context,
            width: 50,
            height: 40,
            onAccept: () => _accept(context, inviter.invitation),
            onDecline: () => _decline(context, inviter.invitation),
          ),
        ],
      ),
    );
  }

  Widget _buildAcceptDeclineButtons(
    BuildContext context, {
    required double width,
    required double height,
    required VoidCallback onAccept,
    required VoidCallback onDecline,
  }) {
    return Row(
      children: [
        GestureDetector(
          onTap: onAccept,
          child: Container(
            width: width,
            height: height,
            child: Icon(
              Icons.done,
              color: Colors.green,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              gradient: RadialGradient(
                colors: [
                  cWhite.withOpacity(0.1),
                  cWhite.withOpacity(0.2),
                ],
                radius: 3.0,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        GestureDetector(
          onTap: onDecline,
          child: Container(
            width: width,
            height: height,
            child: Icon(
              Icons.clear,
              color: Colors.red,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              gradient: RadialGradient(
                colors: [
                  cWhite.withOpacity(0.1),
                  cWhite.withOpacity(0.2),
                ],
                radius: 3.0,
              ),
            ),
          ),
        )
      ],
    );
  }

  void _accept(BuildContext context, Invitation invitation) =>
      BlocProvider.of<InvitationBloc>(context).add(
        InvitationEvent.accept(invitation),
      );

  void _decline(BuildContext context, Invitation invitation) =>
      BlocProvider.of<InvitationBloc>(context).add(
        InvitationEvent.delete(invitation),
      );
}
