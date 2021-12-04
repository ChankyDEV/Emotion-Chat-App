part of 'animatedbutton_cubit.dart';

@freezed
abstract class AnimatedButtonState with _$AnimatedButtonState {
  const factory AnimatedButtonState.initial({
    required bool isPressed,
    required bool isDisabled,
    required bool isProcessing,
  }) = _Initial;
}
