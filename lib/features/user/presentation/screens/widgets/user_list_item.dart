import 'package:emotion_chat/features/user/domain/entities/user.dart';
import 'package:emotion_chat/features/user/presentation/models/num_extension.dart';
import 'package:emotion_chat/features/user/presentation/screens/widgets/user_profile_image.dart';
import 'package:emotion_chat/utils/presentation/consts/colors.dart';
import 'package:emotion_chat/utils/presentation/consts/styles.dart';
import 'package:flutter/material.dart';

class UserListItem extends StatelessWidget {
  final ChatUser user;
  final String name;
  final bool isActive;
  final DateTime? time;
  final String? message;

  const UserListItem({
    Key? key,
    required this.user,
    required this.name,
    this.isActive = false,
    this.time,
    this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          height: 75,
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                    child: Container(
                      height: 40.0,
                      width: 40.0,
                      child: UserProfileImage(
                        user: user,
                      ),
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 3,
                    decoration: BoxDecoration(
                      color: isActive ? Colors.green : Colors.red,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 7,
                  ),
                  buildName(),
                  const SizedBox(
                    height: 3,
                  ),
                  _buildLastMessage(context),
                ],
              ),
            ],
          ),
        ),
        _buildTime(),
      ],
    );
  }

  Widget _buildTime() {
    return time != null
        ? Positioned(
            bottom: 14,
            right: 10,
            child: Container(
              alignment: Alignment.center,
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: Text(
                '${time!.hour.toTwoDigitsString()}:${time!.minute.toTwoDigitsString()}',
                style: bodyStyle.copyWith(
                  fontSize: 11.0,
                  color: cWhite,
                ),
              ),
              decoration: BoxDecoration(
                color: cWhite.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
          )
        : const SizedBox();
  }

  Widget _buildLastMessage(BuildContext context) {
    return message != null
        ? Container(
            width: MediaQuery.of(context).size.width * 0.4,
            child: Text(
              message!,
              maxLines: 1,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: bodyStyle.copyWith(
                fontSize: 10.0,
                color: cWhite.withOpacity(0.5),
                fontWeight: FontWeight.normal,
              ),
            ),
          )
        : const SizedBox();
  }

  Text buildName() {
    return Text(
      name,
      style: titleStyle.copyWith(fontSize: 14.0),
    );
  }
}
