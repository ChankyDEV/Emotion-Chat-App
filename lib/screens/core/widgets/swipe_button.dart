// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';

// class SwipeButton extends StatefulWidget {
//   final String title;
//   final Function onEnd;
//   final bool showGradient;
//   final Color onActionColor;
//   final Color standardColor;
//   final GlobalKey<FormState> formKey;
//   const SwipeButton(
//       {Key? key,
//       required this.title,
//       required this.onEnd,
//       this.showGradient = true,
//       required this.onActionColor,
//       required this.standardColor,
//       required this.formKey})
//       : super(key: key);

//   @override
//   _SwipeButtonState createState() => _SwipeButtonState();
// }

// class _SwipeButtonState extends State<SwipeButton>
//     with TickerProviderStateMixin {
//   final GlobalKey endContainerKey = GlobalKey();
//   final GlobalKey startContainerKey = GlobalKey();
//   bool isLoading = false;
//   late AnimationController _animationController;
//   late Animation<Color?> _colorBackground;
//   late Animation<double> _opacity;

//   @override
//   void initState() {
//     _animationController = AnimationController(
//       duration: Duration(milliseconds: 1000),
//       vsync: this,
//     );

//     _colorBackground =
//         ColorTween(begin: widget.standardColor, end: widget.onActionColor)
//             .animate(CurvedAnimation(
//       curve: Interval(0.5, 1, curve: Curves.ease),
//       parent: _animationController,
//     ));

//     _opacity = Tween<double>(begin: 1.0, end: 0.0).animate(CurvedAnimation(
//       curve: Interval(0.0, 0.55, curve: Curves.ease),
//       parent: _animationController,
//     ));

//     _animationController.addStatusListener((status) async {
//       if (status == AnimationStatus.completed) {
//         widget.onEnd();
//         setState(() {
//           isLoading = true;
//         });
//         if (widget.formKey.currentState!.validate()) {
//           print('Validation passed');
//         } else {
//           print('Form is not valid');
//         }
//         _animationController.reverse();
//       } else if (status == AnimationStatus.dismissed) {
//         if (isLoading == true) {
//           setState(() {
//             isLoading = false;
//           });
//         } else {
//           setState(() {
//             delta = 0.0;
//           });
//         }
//       }
//     });

//     super.initState();
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   double getObjectPositionByKey({GlobalKey<State<StatefulWidget>> key}) {
//     RenderObject? object = key.currentContext!.findRenderObject();
//     var objectOffset = object!.localToGlobal(Offset.zero);
//     var width = object.size.width;
//     return objectOffset.dx - (width * 0.25);
//   }

//   double leftPos = 0;
//   double startPos = 10;
//   bool canDragRight = true;
//   bool canDragLeft = true;
//   bool canBeDragged = true;
//   bool canStartAnimation = false;
//   double delta = 0;
//   double maxSlide = 0;

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;

//     return Stack(
//       children: [
//         AnimatedBuilder(
//             animation: _animationController,
//             builder: (context, child) {
//               return Container(
//                 width: width,
//                 height: height / 12,
//                 decoration: widget.showGradient
//                     ? BoxDecoration(
//                         gradient: LinearGradient(
//                           begin: Alignment.centerLeft,
//                           end: Alignment.centerRight,
//                           colors: [
//                             _colorBackground.value.withOpacity(0),
//                             _colorBackground.value,
//                           ],
//                           stops: [0.01, 0.5],
//                         ),
//                       )
//                     : BoxDecoration(color: _colorBackground.value),
//               );
//             }),
//         AnimatedPositioned(
//           duration: Duration(milliseconds: 200),
//           left: startPos + maxSlide * delta,
//           child: GestureDetector(
//             onHorizontalDragEnd: (details) {
//               if (delta > 0.7) {
//                 setState(() {
//                   delta = 0.95;
//                   _animationController.forward();
//                   canStartAnimation = true;
//                 });
//               } else {
//                 setState(() {
//                   delta = 0;
//                 });
//               }
//             },
//             onHorizontalDragStart: (details) {
//               setState(() {
//                 maxSlide = getObjectPositionByKey(key: endContainerKey);
//                 canDragRight = details.globalPosition.dx <= maxSlide;
//                 canDragLeft = details.globalPosition.dx >= startPos;
//                 canBeDragged = canDragLeft && canDragRight;
//               });
//             },
//             onHorizontalDragUpdate: (details) {
//               if (canBeDragged) {
//                 setState(() {
//                   leftPos = details.globalPosition.dx;
//                   delta = (leftPos - startPos - (width / 10)) / maxSlide;
//                 });
//               }
//             },
//             child: AnimatedBuilder(
//               animation: _animationController,
//               builder: (context, child) {
//                 return Opacity(opacity: _opacity.value, child: child);
//               },
//               child: Container(
//                 key: startContainerKey,
//                 margin: EdgeInsets.only(left: width / 12),
//                 alignment: Alignment.center,
//                 color: Colors.transparent,
//                 width: width / 5,
//                 height: height / 12,
//                 child: Text(
//                   widget.title.toUpperCase(),
//                   style: bodyStyle,
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             ),
//           ),
//         ),
//         AnimatedBuilder(
//           animation: _animationController,
//           builder: (context, child) {
//             return Positioned(
//               right: 30,
//               top: 0,
//               bottom: 0,
//               child: Container(
//                 key: endContainerKey,
//                 alignment: Alignment.center,
//                 margin: const EdgeInsets.all(8.0),
//                 width: 0.25 * width,
//                 height: 0.02 * height,
//                 child: isLoading
//                     ? Container(
//                         child: SpinKitHourGlass(
//                         size: 50,
//                         color: Colors.white,
//                       ))
//                     : Text(
//                         '',
//                         style: const TextStyle(
//                             fontSize: 16.0,
//                             fontStyle: FontStyle.italic,
//                             fontWeight: FontWeight.w600),
//                         textAlign: TextAlign.center,
//                       ),
//               ),
//             );
//           },
//         ),
//       ],
//     );
//   }
// }
