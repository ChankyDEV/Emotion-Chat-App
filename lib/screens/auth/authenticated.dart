import 'package:emotion_chat/screens/abstractions/custom_stateful_widget.dart';
import 'package:emotion_chat/screens/core/consts/colors.dart';
import 'package:emotion_chat/screens/main/chats.dart';
import 'package:emotion_chat/screens/main/contact_list.dart';
import 'package:emotion_chat/screens/utils/labeled_icon_button.dart';
import 'package:flutter/material.dart';

class Authenticated extends StatefulWidget {
  const Authenticated({
    Key? key,
  }) : super(key: key);

  @override
  _AuthenticatedState createState() => _AuthenticatedState();
}

class _AuthenticatedState extends CustomState<Authenticated> {
  late final PageController pageController;
  late int currentPage;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    currentPage = 0;
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!.toInt();
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 13,
            child: PageView(
              controller: pageController,
              children: [
                Chats(),
                ContactList(),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: screenWidth * 0.6,
              child: _buildIcons(),
              decoration: BoxDecoration(
                color: cWhite.withOpacity(0.2),
                borderRadius: BorderRadius.circular(4.0),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  Row _buildIcons() {
    return Row(
      children: [
        Expanded(
          child: LabeledIconButton(
            onPressed: () => pageController.jumpToPage(0),
            icon: Icons.chat,
            color: cWhite,
            noActiveColor: cDarkGrey,
            label: 'Chats',
            colorChangeCondition: currentPage == 0,
          ),
        ),
        Expanded(
          child: LabeledIconButton(
            onPressed: () => pageController.jumpToPage(1),
            icon: Icons.people,
            color: cWhite,
            noActiveColor: cDarkGrey,
            label: 'Friends',
            colorChangeCondition: currentPage == 1,
          ),
        ),
      ],
    );
  }
}
