import 'package:emotion_chat/blocs/invitations/invitation_bloc.dart';
import 'package:emotion_chat/data/models/invitation/invitation_sender.dart';
import 'package:emotion_chat/screens/core/consts/colors.dart';
import 'package:emotion_chat/screens/core/consts/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Invitations extends StatelessWidget {
  const Invitations({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InvitationBloc, InvitationState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: cDarkGrey,
            elevation: 0,
          ),
          body: ListView.separated(
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
          ),
        );
      },
    );
  }

  Widget _buildInvitationItem(
    BuildContext context,
    int index,
    List<Inviter> inviters,
  ) {
    return Container(
      height: 80,
      child: Row(
        children: [
          Text(
            inviters[index].sender.name.value,
            style: titleStyle,
          ),
          const SizedBox(width: 30,),
          Text(
            inviters[index].invitation.createdAt.toLocal().toString(),
            style: bodyStyle,
          ),
        ],
      ),
    );
  }
}
