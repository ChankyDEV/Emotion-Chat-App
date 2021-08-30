class Invitation {
  final DateTime createdAt;
  final String senderUid;

  Invitation(this.createdAt, this.senderUid);

  // factory Invitation.fromJson(Map<String, dynamic>? json) {
  //   return Invitation(
  //     json!['createdAt'],
  //     json!['senderUid'],
  //   );
  // }
}
