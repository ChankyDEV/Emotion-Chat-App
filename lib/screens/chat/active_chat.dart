import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/screens/core/consts/colors.dart';
import 'package:emotion_chat/screens/core/consts/styles.dart';
import 'package:emotion_chat/screens/core/widgets/my_text_field.dart';
import 'package:flutter/material.dart';

class ActiveChat extends StatelessWidget {
  final ChatUser userToChatWith;

  const ActiveChat({
    required this.userToChatWith,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: cDarkGrey,
        title: _buildTitle(),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 7,
            child: _buildMessages(),
          ),
          _buildTextInput(),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Row(
      children: [
        Container(
          height: 35.0,
          width: 35.0,
          decoration: BoxDecoration(
            image: userToChatWith.hasOwnImage
                ? DecorationImage(
                    image: NetworkImage(userToChatWith.profileImage.url),
                    fit: BoxFit.fill,
                  )
                : null,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          userToChatWith.name.value,
          style: bodyStyle.copyWith(fontSize: 12.0),
        ),
      ],
    );
  }

  Widget _buildMessages() {
    final messages = <Message>[
      Message(
        content: Content(value: 'Yes, im here!'),
        dateTime: DateTime.now().subtract(const Duration(seconds: 1)),
        senderID: '12345',
      ),
      Message(
        content: Content(value: 'Are you there?'),
        dateTime: DateTime.now().subtract(const Duration(seconds: 5)),
        senderID: userToChatWith.uid,
      ),
      Message(
        content: Content(value: 'Hello'),
        dateTime: DateTime.now().subtract(const Duration(seconds: 10)),
        senderID: userToChatWith.uid,
      ),
      Message(
        content: Content(value: 'What u want?'),
        dateTime: DateTime.now(),
        senderID: '12345',
      ),
    ];

    messages.sort(
      (a, b) => a.dateTime.compareTo(b.dateTime),
    );
    final reversedMessages = messages.reversed.toList();
    return ListView.builder(
      reverse: true,
      itemCount: reversedMessages.length,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
          alignment: reversedMessages[index].senderID != userToChatWith.uid
              ? Alignment.centerRight
              : Alignment.centerLeft,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              reversedMessages[index].content.value,
              style: bodyStyle.copyWith(
                fontWeight: FontWeight.normal,
              ),
            ),
            decoration: BoxDecoration(
              color: cLightGrey,
              borderRadius: BorderRadius.circular(4.0),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTextInput() {
    return Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 10,
          child: Container(
            height: 80,
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: MyTextField(
              hint: 'Aa...',
              inputType: InputType.emailAddress,
              controller: TextEditingController(),
              suffixIcon: Icons.insert_emoticon_outlined,
              action: () {},
              isTextVisible: true,
              textInputAction: TextInputAction.done,
              onSubmitted: (value) {},
              validate: false,
              useOutlineInputBorder: true,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Center(
            child: IconButton(
              onPressed: () {
                //TODO: SEND MESSAGE
              },
              icon: Icon(
                Icons.send,
                color: cWhite,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
