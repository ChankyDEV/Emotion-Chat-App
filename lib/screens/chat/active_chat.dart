import 'package:emotion_chat/blocs/active_chat/active_chat_bloc.dart';
import 'package:emotion_chat/constants/data.dart';
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
  State<ActiveChat> createState() => _ActiveChatState();
}

class _ActiveChatState extends State<ActiveChat> {
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
          return Column(
            children: [
              Expanded(
                flex: 7,
                child: _buildMessages(state.messages),
              ),
              _buildTextInput(),
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
    return ListView.builder(
      reverse: true,
      itemCount: messages.length,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
          alignment: messages[index].senderUid != widget.userToChatWith.uuid
              ? Alignment.centerRight
              : Alignment.centerLeft,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              messages[index].content.value,
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
