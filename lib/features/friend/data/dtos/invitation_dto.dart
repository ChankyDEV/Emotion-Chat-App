import 'package:emotion_chat/features/friend/domain/entities/invitation.dart';

class InvitationDTO extends Invitation {
  InvitationDTO(DateTime createdAt, String senderUid)
      : super(createdAt, senderUid);
}
