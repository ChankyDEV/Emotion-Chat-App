import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/data/models/auth/receiver.dart';
import 'package:emotion_chat/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:emotion_chat/blocs/auth/auth_cubit.dart';
import 'package:emotion_chat/repositories/user/i_user_repository.dart';
import 'package:emotion_chat/screens/core/consts/colors.dart';
import 'package:emotion_chat/screens/core/consts/styles.dart';

import '../../injectable_init.dart';

class Chats extends StatelessWidget {
  final List<Conversation> conversations = [
    Conversation(
      conversationID: '12345',
      lastMessage: Message(
          content: Content(
              value:
                  'Hello. I would like to talk with yout about last night. I would like to talk with yout about last night. I would like to talk with yout about last night.'),
          dateTime: DateTime.now(),
          senderID: '123',
          isRead: true),
      receiver: Receiver(
        uid: '321',
        name: Name(value: 'Female user'),
        hasOwnImage: false,
        profileImage: ProfileImage(url: ''),
        gender: Gender(value: GenderEnum.female),
      ),
    ),
    Conversation(
        conversationID: '09876',
        lastMessage: Message(
            content: Content(value: 'My name is George'),
            dateTime: DateTime.now(),
            senderID: '3213',
            isRead: false),
        receiver: Receiver(
            uid: '1231',
            name: Name(value: 'Male user'),
            hasOwnImage: true,
            profileImage: ProfileImage(url: ''),
            gender: Gender(value: GenderEnum.male))),
    Conversation(
      conversationID: '12345',
      lastMessage: Message(
          content: Content(value: 'Hello'),
          dateTime: DateTime.now(),
          senderID: '123',
          isRead: true),
      receiver: Receiver(
        uid: '321',
        name: Name(value: 'Female user'),
        hasOwnImage: false,
        profileImage: ProfileImage(url: ''),
        gender: Gender(value: GenderEnum.female),
      ),
    ),
    Conversation(
      conversationID: '12345',
      lastMessage: Message(
          content: Content(value: 'Hello'),
          dateTime: DateTime.now(),
          senderID: '123',
          isRead: true),
      receiver: Receiver(
        uid: '321',
        name: Name(value: 'Female user'),
        hasOwnImage: false,
        profileImage: ProfileImage(url: ''),
        gender: Gender(value: GenderEnum.female),
      ),
    ),
    Conversation(
        conversationID: '09876',
        lastMessage: Message(
            content: Content(value: 'My name is George'),
            dateTime: DateTime.now(),
            senderID: '3213',
            isRead: true),
        receiver: Receiver(
            uid: '1231',
            name: Name(value: 'Male user'),
            hasOwnImage: false,
            profileImage: ProfileImage(url: ''),
            gender: Gender(value: GenderEnum.male))),
    Conversation(
        conversationID: '09876',
        lastMessage: Message(
            content: Content(value: 'My name is George'),
            dateTime: DateTime.now(),
            senderID: '3213',
            isRead: true),
        receiver: Receiver(
            uid: '1231',
            name: Name(value: 'Male user'),
            hasOwnImage: false,
            profileImage: ProfileImage(url: ''),
            gender: Gender(value: GenderEnum.male))),
    Conversation(
        conversationID: '09876',
        lastMessage: Message(
            content: Content(value: 'My name is George'),
            dateTime: DateTime.now(),
            senderID: '3213',
            isRead: true),
        receiver: Receiver(
            uid: '1231',
            name: Name(value: 'Male user'),
            hasOwnImage: false,
            profileImage: ProfileImage(url: ''),
            gender: Gender(value: GenderEnum.male))),
    Conversation(
        conversationID: '09876',
        lastMessage: Message(
            content: Content(value: 'My name is George'),
            dateTime: DateTime.now(),
            senderID: '3213',
            isRead: true),
        receiver: Receiver(
            uid: '1231',
            name: Name(value: 'Male user'),
            hasOwnImage: false,
            profileImage: ProfileImage(url: ''),
            gender: Gender(value: GenderEnum.male))),
    Conversation(
        conversationID: '09876',
        lastMessage: Message(
            content: Content(value: 'My name is George'),
            dateTime: DateTime.now(),
            senderID: '3213',
            isRead: true),
        receiver: Receiver(
            uid: '1231',
            name: Name(value: 'Male user'),
            hasOwnImage: false,
            profileImage: ProfileImage(url: ''),
            gender: Gender(value: GenderEnum.male))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              key: Key('logout_messages_button'),
              onPressed: () async {
                await getIt<IUserRepository>().logout();
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [
          Expanded(
              flex: 2,
              child: Stack(
                children: [
                  Positioned(
                    left: 10,
                    top: 50,
                    child: Text(
                      'Messages',
                      style:
                          titleStyle.copyWith(color: whiteColor, fontSize: 26),
                    ),
                  ),
                  Positioned(
                    top: 55,
                    right: 10,
                    child: Row(
                      children: [
                        CircleIcon(
                          icon: Icons.edit,
                          onTap: () {
                            print('Edit');
                          },
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        CircleIcon(
                          icon: Icons.settings,
                          onTap: () {
                            print('Settings');
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              )),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              flex: 1,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                child: Container(
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.search,
                        color: whiteColor,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Search...',
                        style: textFormStyle.copyWith(
                            color: whiteColor.withOpacity(0.7)),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: whiteColor.withOpacity(0.5), width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                ),
              )),
          Expanded(
              flex: 10,
              child: ListView.builder(
                itemCount: conversations.length,
                itemBuilder: (context, index) {
                  var item = conversations[index];
                  return GestureDetector(
                    onTap: () => print(item.receiver.uid),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                width: 60,
                                height: 60,
                                decoration: !item.receiver.hasOwnImage
                                    ? BoxDecoration(
                                        color: whiteColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4.0)),
                                        shape: BoxShape.rectangle,
                                        image: DecorationImage(
                                            fit: BoxFit.scaleDown,
                                            image: AssetImage(item.receiver
                                                        .gender.value ==
                                                    GenderEnum.male
                                                ? 'assets/images/boy.png'
                                                : 'assets/images/girl.png')))
                                    : BoxDecoration(
                                        color: whiteColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4.0)),
                                        shape: BoxShape.rectangle,
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage(
                                                'assets/images/profileImage.jpg'))),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                flex: 8,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.receiver.name.value,
                                      style: bodyStyle,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    item.lastMessage.isRead
                                        ? Text(
                                            item.lastMessage.content.value,
                                            style: textFormStyle.copyWith(
                                                fontSize: 12,
                                                color: whiteColor
                                                    .withOpacity(0.5)),
                                            maxLines: 1,
                                            softWrap: false,
                                            overflow: TextOverflow.ellipsis,
                                          )
                                        : Text(
                                            item.lastMessage.content.value,
                                            style: textFormStyle.copyWith(
                                                fontSize: 12,
                                                color:
                                                    whiteColor.withOpacity(0.9),
                                                fontWeight: FontWeight.bold),
                                            maxLines: 1,
                                            softWrap: false,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                  ],
                                )),
                            Expanded(
                                flex: 3,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      alignment: Alignment.topRight,
                                      child: Text(
                                        formatDate(item.lastMessage.dateTime),
                                        style: textFormStyle.copyWith(
                                            color: whiteColor),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 18,
                                    ),
                                    item.lastMessage.isRead
                                        ? Container()
                                        : Container(
                                            width: 10,
                                            height: 10,
                                            alignment: Alignment.center,
                                            child: const SizedBox(),
                                            decoration: BoxDecoration(
                                                color:
                                                    whiteColor.withOpacity(0.8),
                                                shape: BoxShape.circle),
                                          )
                                  ],
                                )),
                            const SizedBox(
                              width: 10,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  );
                },
              )),
        ],
      ),
    );
  }
}

class CircleIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const CircleIcon({Key? key, required this.icon, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        child: Icon(
          icon,
          color: backgroundColor,
        ),
        decoration: BoxDecoration(shape: BoxShape.circle, color: whiteColor),
      ),
    );
  }
}
