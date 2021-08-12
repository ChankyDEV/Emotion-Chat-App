import 'package:emotion_chat/blocs/auth/auth_cubit.dart';
import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/data/models/auth/receiver.dart';
import 'package:emotion_chat/helpers/helpers.dart';
import 'package:emotion_chat/repositories/user/i_user_repository.dart';
import 'package:emotion_chat/screens/core/consts/colors.dart';
import 'package:emotion_chat/screens/core/consts/styles.dart';
import 'package:emotion_chat/screens/main/chats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injectable_init.dart';

class ContactList extends StatelessWidget {
  List<Receiver> contactList = [
    Receiver(
        uid: '123',
        name: Name(value: 'Kamil'),
        profileImage: ProfileImage.empty(),
        hasOwnImage: false,
        gender: Gender(value: GenderEnum.male)),
    Receiver(
        uid: '123',
        name: Name(value: 'Patryk'),
        profileImage: ProfileImage.empty(),
        hasOwnImage: false,
        gender: Gender(value: GenderEnum.male)),
    Receiver(
        uid: '123',
        name: Name(value: 'Ania'),
        profileImage: ProfileImage.empty(),
        hasOwnImage: false,
        gender: Gender(value: GenderEnum.male)),
    Receiver(
        uid: '123',
        name: Name(value: 'Izabela'),
        profileImage: ProfileImage.empty(),
        hasOwnImage: false,
        gender: Gender(value: GenderEnum.male)),
    Receiver(
        uid: '123',
        name: Name(value: 'Piotr'),
        profileImage: ProfileImage.empty(),
        hasOwnImage: false,
        gender: Gender(value: GenderEnum.male)),
    Receiver(
        uid: '123',
        name: Name(value: 'Robert'),
        profileImage: ProfileImage.empty(),
        hasOwnImage: false,
        gender: Gender(value: GenderEnum.male)),
    Receiver(
        uid: '123',
        name: Name(value: 'Eryk'),
        profileImage: ProfileImage.empty(),
        hasOwnImage: false,
        gender: Gender(value: GenderEnum.male)),
    Receiver(
        uid: '123',
        name: Name(value: 'Monika'),
        profileImage: ProfileImage.empty(),
        hasOwnImage: false,
        gender: Gender(value: GenderEnum.male)),
    Receiver(
        uid: '123',
        name: Name(value: 'Alicja'),
        profileImage: ProfileImage.empty(),
        hasOwnImage: false,
        gender: Gender(value: GenderEnum.male)),
    Receiver(
        uid: '123',
        name: Name(value: 'Marek'),
        profileImage: ProfileImage.empty(),
        hasOwnImage: false,
        gender: Gender(value: GenderEnum.male)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Stack(
                children: [
                  Positioned(
                    left: 10,
                    top: 50,
                    child: Text(
                      'Contacts',
                      style:
                          titleStyle.copyWith(color: whiteColor, fontSize: 26),
                    ),
                  ),
                ],
              )),
          Expanded(
              flex: 5,
              child: ListView.builder(
                itemCount: contactList.length,
                itemBuilder: (context, index) {
                  var item = contactList[index];
                  return Column(
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
                              decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4.0)),
                                  shape: BoxShape.rectangle,
                                  image: DecorationImage(
                                      fit: BoxFit.scaleDown,
                                      image: AssetImage(
                                          item.gender.value == GenderEnum.male
                                              ? 'assets/images/boy.png'
                                              : 'assets/images/girl.png'))),
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
                                    item.name.value,
                                    style: bodyStyle,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              )),
                          Expanded(
                              flex: 3,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [],
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
                  );
                },
              )),
        ],
      ),
    );
  }
}
