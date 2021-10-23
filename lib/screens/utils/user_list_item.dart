import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/screens/core/consts/colors.dart';
import 'package:emotion_chat/screens/core/consts/styles.dart';
import 'package:emotion_chat/screens/utils/UserProfileImage.dart';
import 'package:flutter/material.dart';

class UserListItem extends StatelessWidget {
  final ChatUser user;
  final String name;
  final String? status;
  final DateTime? time;
  final String? message;

  const UserListItem({
    Key? key,
    required this.user,
    required this.name,
    this.status,
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
              ClipRRect(
                borderRadius: BorderRadius.circular(4.0),
                child: Container(
                  height: 40.0,
                  width: 40.0,
                  child: UserProfileImage(
                    user: user,
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
                  _buildStatus(),
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
                '${time!.hour}:${time!.minute}',
                style: bodyStyle.copyWith(
                  fontSize: 11.0,
                  color: cWhite,
                ),
              ),
              decoration: BoxDecoration(
                color: cWhite.withOpacity(0.2),
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

  Widget _buildStatus() {
    return status != null
        ? Text(
            status!,
            style: titleStyle.copyWith(
              fontSize: 10.0,
              color: Colors.green,
              fontWeight: FontWeight.normal,
            ),
          )
        : const SizedBox();
  }
}
