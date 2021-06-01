import 'package:emotion_chat/screens/core/consts/colors.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class GenderSwitch extends StatefulWidget {
  final PageController genderController;
  const GenderSwitch({Key? key, required this.genderController})
      : super(key: key);
  @override
  _GenderSwitchState createState() => _GenderSwitchState();
}

class _GenderSwitchState extends State<GenderSwitch>
    with TickerProviderStateMixin {
  late AnimationController _maleAnimationController;
  late AnimationController _femaleAnimationController;
  late AnimationController _nonBinaryAnimationController;

  late Animation<Color?> _maleIconColor;
  late Animation<Color?> _maleBackgroundColor;
  late Animation<double> _maleSize;

  late Animation<Color?> _femaleIconColor;
  late Animation<Color?> _femaleBackgroundColor;
  late Animation<double> _femaleSize;

  late Animation<Color?> _nonBinaryIconColor;
  late Animation<Color?> _nonBinaryBackgroundColor;
  late Animation<double> _nonBinarySize;

  final Offset _offset = Offset(0, 0);
  @override
  void initState() {
    double beginSize = 1;
    double endSize = 1.1;

    _maleAnimationController =
        AnimationController(duration: Duration(milliseconds: 200), vsync: this);
    _femaleAnimationController =
        AnimationController(duration: Duration(milliseconds: 200), vsync: this);
    _nonBinaryAnimationController =
        AnimationController(duration: Duration(milliseconds: 200), vsync: this);

    _maleIconColor = ColorTween(
      begin: purpleAccent,
      end: Colors.grey[300],
    ).animate(CurvedAnimation(
      curve: Interval(0, 0.7, curve: Curves.linearToEaseOut),
      parent: _maleAnimationController,
    ));
    _maleBackgroundColor = ColorTween(
      begin: Colors.grey[300],
      end: purpleAccent,
    ).animate(CurvedAnimation(
      curve: Interval(0, 1, curve: Curves.linearToEaseOut),
      parent: _maleAnimationController,
    ));
    _maleSize = TweenSequence([
      TweenSequenceItem(
        tween: Tween<double>(begin: beginSize, end: endSize),
        weight: 50,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: endSize, end: beginSize),
        weight: 50,
      ),
    ]).animate(_maleAnimationController);

    _femaleIconColor = ColorTween(
      begin: Colors.green,
      end: Colors.grey[300],
    ).animate(CurvedAnimation(
      curve: Interval(0, 0.7, curve: Curves.linearToEaseOut),
      parent: _femaleAnimationController,
    ));
    _femaleBackgroundColor = ColorTween(
      begin: Colors.grey[300],
      end: Colors.green,
    ).animate(CurvedAnimation(
      curve: Interval(0, 1, curve: Curves.linearToEaseOut),
      parent: _femaleAnimationController,
    ));
    _femaleSize = TweenSequence([
      TweenSequenceItem(
        tween: Tween<double>(begin: beginSize, end: endSize),
        weight: 50,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: endSize, end: beginSize),
        weight: 50,
      ),
    ]).animate(_femaleAnimationController);

    _nonBinaryIconColor = ColorTween(
      begin: Colors.teal,
      end: Colors.grey[300],
    ).animate(CurvedAnimation(
      curve: Interval(0, 0.7, curve: Curves.linearToEaseOut),
      parent: _nonBinaryAnimationController,
    ));
    _nonBinaryBackgroundColor =
        ColorTween(begin: Colors.grey[300], end: Colors.teal)
            .animate(CurvedAnimation(
      curve: Interval(0, 1, curve: Curves.linearToEaseOut),
      parent: _nonBinaryAnimationController,
    ));
    _nonBinarySize = TweenSequence([
      TweenSequenceItem(
        tween: Tween<double>(begin: beginSize, end: endSize),
        weight: 50,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: endSize, end: beginSize),
        weight: 50,
      ),
    ]).animate(_nonBinaryAnimationController);

    _maleAnimationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.symmetric(vertical: 64.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          AnimatedGenderItem(
            forwardController: _maleAnimationController,
            firstReverseController: _femaleAnimationController,
            secondReverseController: _nonBinaryAnimationController,
            genderController: widget.genderController,
            containerSize: _maleSize,
            backgroundColor: _maleBackgroundColor,
            iconColor: _maleIconColor,
            offset: _offset,
            icon: MdiIcons.genderMale,
            animateToPage: 0,
          ),
          AnimatedGenderItem(
            forwardController: _femaleAnimationController,
            firstReverseController: _maleAnimationController,
            secondReverseController: _nonBinaryAnimationController,
            genderController: widget.genderController,
            containerSize: _femaleSize,
            backgroundColor: _femaleBackgroundColor,
            iconColor: _femaleIconColor,
            offset: _offset,
            icon: MdiIcons.genderFemale,
            animateToPage: 1,
          ),
          AnimatedGenderItem(
            forwardController: _nonBinaryAnimationController,
            firstReverseController: _maleAnimationController,
            secondReverseController: _femaleAnimationController,
            genderController: widget.genderController,
            containerSize: _nonBinarySize,
            backgroundColor: _nonBinaryBackgroundColor,
            iconColor: _nonBinaryIconColor,
            offset: _offset,
            icon: MdiIcons.genderNonBinary,
            animateToPage: 2,
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _maleAnimationController.dispose();
    _femaleAnimationController.dispose();
    _nonBinaryAnimationController.dispose();
    super.dispose();
  }
}

class AnimatedGenderItem extends StatelessWidget {
  final AnimationController forwardController;
  final AnimationController firstReverseController;
  final AnimationController secondReverseController;
  final PageController genderController;
  final Animation<double> containerSize;
  final Animation<Color?> iconColor;
  final Animation<Color?> backgroundColor;
  final int animateToPage;
  final Offset offset;
  final IconData icon;

  const AnimatedGenderItem(
      {Key? key,
      required this.forwardController,
      required this.firstReverseController,
      required this.secondReverseController,
      required this.containerSize,
      required this.iconColor,
      required this.backgroundColor,
      required this.genderController,
      required this.offset,
      required this.icon,
      required this.animateToPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
      animation: forwardController,
      builder: (context, _) {
        return GestureDetector(
          onTap: () {
            forwardController.forward();
            if (firstReverseController.status == AnimationStatus.completed) {
              firstReverseController.reverse(from: 0.5);
            }
            if (secondReverseController.status == AnimationStatus.completed) {
              secondReverseController.reverse(from: 0.5);
            }
            genderController.animateToPage(animateToPage,
                duration: Duration(milliseconds: 200), curve: Curves.linear);
          },
          child: Transform.scale(
            origin: offset,
            scale: containerSize.value,
            child: Container(
              alignment: Alignment.center,
              height: 0.22 * width,
              width: 0.22 * width,
              child: Icon(
                icon,
                size: 0.13 * width,
                color: iconColor.value,
              ),
              decoration: BoxDecoration(
                color: backgroundColor.value,
                borderRadius: BorderRadius.circular(4.0),
              ),
            ),
          ),
        );
      },
    );
  }
}
