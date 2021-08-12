import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/data/enums/form_input.dart';
import 'package:emotion_chat/repositories/image_picker/i_image_picker_repository.dart';
import 'package:emotion_chat/screens/core/consts/colors.dart';
import 'package:emotion_chat/screens/core/consts/styles.dart';
import 'package:emotion_chat/screens/core/widgets/my_text_field.dart';
import 'package:flutter/material.dart';

class AdditionalUserInfoScreen extends StatefulWidget {
  const AdditionalUserInfoScreen({Key? key}) : super(key: key);

  @override
  _AdditionalUserInfoScreenState createState() =>
      _AdditionalUserInfoScreenState();
}

class _AdditionalUserInfoScreenState extends State<AdditionalUserInfoScreen> {
  late int _activeStepIndex;
  late int _doneStepIndex;
  final double _horizontalHeaderMargin = 20.0;
  late Widget _mainPageContent;
  final TextEditingController _nameController = TextEditingController();
  late String _name;
  late Gender _gender;
  late MyPickedFile _file;
  late GenderEnum _activeGender;

  @override
  void initState() {
    _activeStepIndex = 1;
    _doneStepIndex = 0;
    _activeGender = GenderEnum.male;
    _mainPageContent = _buildNameForm();
    _nameController.addListener(() {
      setState(() {
        _name = _nameController.value.text;
        print(_name);
      });
    });
    super.initState();
  }

  Widget _choosePage(int pageIndex) {
    switch (pageIndex) {
      case 1:
        return _buildNameForm();
      case 2:
        return _buildGenderSwitch();
      case 3:
        return _buildPhotoAdding();
      default:
        return _buildNameForm();
    }
  }

  void _showParticularStep({
    required int doneStepIndex,
    required int activeStepIndex,
  }) {
    setState(() {
      _doneStepIndex = doneStepIndex;
      _activeStepIndex = activeStepIndex;
      _mainPageContent = _choosePage(_activeStepIndex);
    });
  }

  void _showNextStep() {
    setState(() {
      if (_activeStepIndex < 3 && _doneStepIndex < 2) {
        _activeStepIndex++;
        _doneStepIndex++;
      } else {
        _activeStepIndex = 1;
        _doneStepIndex = 0;
      }
      _mainPageContent = _choosePage(_activeStepIndex);
    });
  }

  void _changeGender(GenderEnum activeGender) {
    setState(() {
      _activeGender = activeGender;
      _mainPageContent = _choosePage(_activeStepIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _showNextStep,
        child: Icon(
          _activeStepIndex == 3 ? Icons.done : Icons.arrow_right_alt_sharp,
          color: cDarkGrey,
        ),
        backgroundColor: cWhite,
      ),
      backgroundColor: cDarkGrey,
      body: Column(
        children: [
          Expanded(
              flex: 15,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                color: cWhite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: _horizontalHeaderMargin,
                    ),
                    Expanded(
                      child: _step(
                        Icons.drive_file_rename_outline,
                        cDarkGrey,
                        cWhite,
                        2.0,
                        12.0,
                        active: _activeStepIndex == 1,
                        done: _doneStepIndex == 1 || _doneStepIndex == 2,
                        onTap: () => _showParticularStep(
                          doneStepIndex: 0,
                          activeStepIndex: 1,
                        ),
                      ),
                    ),
                    Expanded(
                      child: _dotsSeparator(
                        cDarkGrey,
                        4,
                        3,
                        done: _doneStepIndex == 1 || _doneStepIndex == 2,
                      ),
                    ),
                    Expanded(
                      child:
                          _step(Icons.people_alt, cDarkGrey, cWhite, 2.0, 12.0,
                              active: _activeStepIndex == 2,
                              done: _doneStepIndex == 2,
                              onTap: () => _showParticularStep(
                                    doneStepIndex: 1,
                                    activeStepIndex: 2,
                                  )),
                    ),
                    Expanded(
                      child: _dotsSeparator(
                        cDarkGrey,
                        4,
                        3,
                        done: _doneStepIndex == 2,
                      ),
                    ),
                    Expanded(
                      child: _step(Icons.assignment_ind_outlined, cDarkGrey,
                          cWhite, 2.0, 12.0,
                          active: _activeStepIndex == 3,
                          done: _doneStepIndex == 3,
                          onTap: () => _showParticularStep(
                                doneStepIndex: 2,
                                activeStepIndex: 3,
                              )),
                    ),
                    SizedBox(
                      width: _horizontalHeaderMargin,
                    ),
                  ],
                ),
              )),
          Expanded(
              flex: 85,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                color: cDarkGrey,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: _mainPageContent,
                  transitionBuilder: (child, animation) {
                    return ScaleTransition(
                      child: child,
                      scale: animation,
                    );
                  },
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildNameForm() {
    return Column(
      key: ValueKey(1),
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(flex: 20, child: const SizedBox()),
        Expanded(
          flex: 10,
          child: Text(
            'How your friends gonna call you!',
            textAlign: TextAlign.center,
            style: titleStyle.copyWith(fontSize: 18.0),
          ),
        ),
        Expanded(
          flex: 25,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 40.0, vertical: 0.0),
            child: MyTextField(
              controller: _nameController,
              formInput: FormInput.emailAddress,
              hint: 'What is your name...',
              prefixIcon: Icons.mail_outline,
              suffixIcon: Icons.clear,
              action: () => _nameController.clear(),
              isTextVisible: true,
              textInputAction: TextInputAction.next,
              onSubmitted: _showNextStep,
            ),
          ),
        ),
        Expanded(flex: 25, child: const SizedBox()),
      ],
    );
  }

  Widget _buildGenderSwitch() {
    return Column(key: ValueKey(2), children: [
      Expanded(
        flex: 20,
        child: Center(
          child: Text(
            'How to address you?',
            textAlign: TextAlign.center,
            style: titleStyle.copyWith(fontSize: 18.0),
          ),
        ),
      ),
      Expanded(
        flex: 22,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 8.0),
          child: GestureDetector(
            onTap: () => _changeGender(GenderEnum.male),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                'Male',
                textAlign: TextAlign.center,
                style: titleStyle.copyWith(
                    fontSize: 18.0,
                    color:
                        _activeGender == GenderEnum.male ? cDarkGrey : cWhite),
              ),
              decoration: BoxDecoration(
                color: _activeGender == GenderEnum.male ? cWhite : cDarkGrey,
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                border:
                    Border.all(color: cWhite.withOpacity(0.75), width: 1.25),
              ),
            ),
          ),
        ),
      ),
      Expanded(
        flex: 22,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 8.0),
          child: GestureDetector(
            onTap: () => _changeGender(GenderEnum.female),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                'Female',
                textAlign: TextAlign.center,
                style: titleStyle.copyWith(
                    fontSize: 18.0,
                    color: _activeGender == GenderEnum.female
                        ? cDarkGrey
                        : cWhite),
              ),
              decoration: BoxDecoration(
                color: _activeGender == GenderEnum.female ? cWhite : cDarkGrey,
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                border:
                    Border.all(color: cWhite.withOpacity(0.75), width: 1.25),
              ),
            ),
          ),
        ),
      ),
      Expanded(
        flex: 22,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 8.0),
          child: GestureDetector(
            onTap: () => _changeGender(GenderEnum.none),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                'Other',
                textAlign: TextAlign.center,
                style: titleStyle.copyWith(
                    fontSize: 18.0,
                    color:
                        _activeGender == GenderEnum.none ? cDarkGrey : cWhite),
              ),
              decoration: BoxDecoration(
                color: _activeGender == GenderEnum.none ? cWhite : cDarkGrey,
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                border:
                    Border.all(color: cWhite.withOpacity(0.75), width: 1.25),
              ),
            ),
          ),
        ),
      ),
      Expanded(flex: 14, child: const SizedBox()),
    ]);
  }

  Widget _buildPhotoAdding() {
    return Column(
      children: [
        Expanded(
          flex: 20,
          child: Center(
            child: Text(
              'How your friends gonna see you!',
              textAlign: TextAlign.center,
              style: titleStyle.copyWith(fontSize: 18.0),
            ),
          ),
        ),
        Expanded(
            flex: 70,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 36, vertical: 8.0),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.add_a_photo_outlined,
                    color: cWhite.withOpacity(0.75),
                    size: 40,
                  ),
                  decoration: BoxDecoration(
                    color: cDarkGrey,
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    border: Border.all(
                        color: cWhite.withOpacity(0.75), width: 1.25),
                  ),
                ),
              ),
            )),
        Expanded(flex: 10, child: const SizedBox()),
      ],
    );
  }

  Widget _step(
    IconData iconData,
    Color outsideColor,
    Color insideColor,
    double stripWidth,
    double size, {
    bool done = false,
    bool active = false,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.all(stripWidth),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.all(done || active ? size : size - 2),
          child: Icon(
            iconData,
            color:
                done || active ? outsideColor : outsideColor.withOpacity(0.5),
          ),
          decoration: BoxDecoration(
            color: insideColor,
            shape: BoxShape.circle,
          ),
        ),
        decoration: BoxDecoration(
          color: done || active ? outsideColor : outsideColor.withOpacity(0.5),
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  Widget _dotsSeparator(
    Color color,
    int amount,
    double size, {
    bool done = false,
  }) {
    List<Widget> dots = [];
    for (var i = 0; i < amount; i++) {
      dots.add(
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: done ? color : color.withOpacity(0.3),
            shape: BoxShape.circle,
          ),
        ),
      );
      if (i != 0 || i != amount - 1) {
        dots.add(SizedBox(
          width: size,
        ));
      }
    }
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: dots,
      ),
    );
  }
}
