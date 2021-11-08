import 'package:emotion_chat/features/friend/domain/entities/invitation.dart';
import 'package:emotion_chat/features/user/domain/entities/user.dart';

class Inviter {
  final Invitation invitation;
  final ChatUser sender;

  const Inviter(
    this.invitation,
    this.sender,
  );
}
