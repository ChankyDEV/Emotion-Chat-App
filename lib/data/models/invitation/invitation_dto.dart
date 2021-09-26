import 'package:emotion_chat/data/models/invitation/invitation.dart';

class InvitationDTO extends Invitation {
  InvitationDTO(DateTime createdAt, String senderUid)
      : super(createdAt, senderUid);
}
