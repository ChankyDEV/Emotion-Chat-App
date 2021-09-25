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
    final inviter = inviters[index];
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      height: 80,
      child: Row(
        children: [
          inviter.sender.hasOwnImage
              ? Container(
                  height: 70.0,
                  width: 60.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(inviter.sender.profileImage.url),
                      fit: BoxFit.fill,
                    ),
                    shape: BoxShape.circle,
                  ),
                )
              : Container(
                  width: 60,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.red,
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
                style: titleStyle.copyWith(fontSize: 17.0),
              ),
              const SizedBox(height: 5,),
              Text(
                inviter.sender.emailAddress.value,
                style: bodyStyle.copyWith(fontSize: 12.0, color: cWhite.withOpacity(0.5)),
              ),
            ],
          )

        ],
      ),
    );
  }
}
