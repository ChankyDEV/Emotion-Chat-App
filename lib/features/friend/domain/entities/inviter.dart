import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/features/friend/domain/entities/invitation.dart';

class Inviter {
  final Invitation invitation;
  final ChatUser sender;

  const Inviter(
    this.invitation,
    this.sender,
  );
}
