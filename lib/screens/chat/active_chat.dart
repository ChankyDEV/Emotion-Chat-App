import 'package:emotion_chat/blocs/active_chat/active_chat_bloc.dart';
import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/screens/abstractions/custom_state.dart';
import 'package:emotion_chat/screens/core/consts/colors.dart';
import 'package:emotion_chat/screens/core/consts/styles.dart';
import 'package:emotion_chat/screens/core/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActiveChat extends StatefulWidget {
  final ChatUser userToChatWith;

  const ActiveChat({
    required this.userToChatWith,
    Key? key,
  }) : super(key: key);

  @override
  _ActiveChatState createState() => _ActiveChatState();
}

class _ActiveChatState extends CustomState<ActiveChat> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: cDarkGrey,
        title: _buildTitle(),
      ),
      body: BlocBuilder<ActiveChatBloc, ActiveChatState>(
        builder: (context, state) {
          return Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    flex: 9,
                    child: _buildMessages(state.messages),
                  ),
                  _buildTextInput(),
                ],
              ),
              Align(
                alignment: Alignment.topCenter,
                child: hasInternetConnection
                    ? const SizedBox()
                    : Container(
                        color: Colors.transparent,
                        padding: const EdgeInsets.all(4.0),
                        height: screenHeight * 0.03,
                        child: Text(
                          'No internet connection',
                          style: bodyStyle.copyWith(
                            color: Colors.red,
                            fontSize: 10.0,
                          ),
                        ),
                      ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTitle() {
    return Row(
      children: [
        widget.userToChatWith.hasOwnImage
            ? Container(
                height: 35.0,
                width: 35.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.userToChatWith.profileImage.url),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.circle,
                ),
              )
            : const SizedBox(),
        SizedBox(
          width: widget.userToChatWith.hasOwnImage ? 10 : 0,
        ),
        Text(
          widget.userToChatWith.name.value,
          style: bodyStyle.copyWith(fontSize: 12.0),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Sad/Other',
                style: bodyStyle.copyWith(fontSize: 12.0),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _buildMessages(List<Message> messages) {
    return NotificationListener(
      child: ListView.builder(
        reverse: true,
        itemCount: messages.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
            alignment: isActualUserMessage(messages, index)
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                messages[index].content.value,
                style: bodyStyle.copyWith(
                  fontWeight: FontWeight.normal,
                  fontSize: 13.0,
                  fontStyle: FontStyle.normal,
                ),
              ),
              decoration: BoxDecoration(
                color: isActualUserMessage(messages, index)
                    ? cPurple.withOpacity(0.5)
                    : darkAccentColor,
                borderRadius: BorderRadius.circular(4.0),
              ),
            ),
          );
        },
      ),
      onNotification: (notification) {
        if (notification is ScrollEndNotification) {
          BlocProvider.of<ActiveChatBloc>(context)
              .add(ActiveChatEvent.onScrollToEnd());
          return true;
        }
        return false;
      },
    );
  }

  bool isActualUserMessage(List<Message> messages, int index) =>
      messages[index].senderUid != widget.userToChatWith.uuid;

  Widget _buildTextInput() {
    return Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 10,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: MyTextField(
              hint: 'Aa...',
              inputType: InputType.emailAddress,
              controller: _controller,
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
                BlocProvider.of<ActiveChatBloc>(context).add(
                  ActiveChatEvent.sendMessage(_controller.value.text),
                );
                _controller.clear();
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
