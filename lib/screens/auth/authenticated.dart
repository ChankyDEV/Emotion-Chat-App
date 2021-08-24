import 'package:emotion_chat/screens/core/consts/colors.dart';
import 'package:emotion_chat/screens/main/chats.dart';
import 'package:emotion_chat/screens/main/contact_list.dart';
import 'package:flutter/material.dart';

class Authenticated extends StatefulWidget {
  const Authenticated({
    Key? key,
  }) : super(key: key);

  @override
  _AuthenticatedState createState() => _AuthenticatedState();
}

class _AuthenticatedState extends State<Authenticated> {
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
            flex: 12,
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: IconButton(
                      onPressed: () {
                        pageController.jumpToPage(0);
                      },
                      icon: Icon(Icons.chat,
                          color: currentPage == 0 ? whiteColor : mBlack),
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      onPressed: () {
                        pageController.jumpToPage(1);
                      },
                      icon: Icon(Icons.people,
                          color: currentPage == 1 ? whiteColor : mBlack),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
