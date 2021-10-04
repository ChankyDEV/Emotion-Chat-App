import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/data/models/invitation/invitation.dart';

class Inviter {
  final Invitation invitation;
  final ChatUser sender;

  Inviter(this.invitation, this.sender);
}
