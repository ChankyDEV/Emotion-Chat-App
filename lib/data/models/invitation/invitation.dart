class Invitation {
  final DateTime createdAt;
  final String senderUid;

  Invitation(
    this.createdAt,
    this.senderUid,
  );

  factory Invitation.fromJson(Map<String, dynamic> json) {
    return Invitation(
      json['createdAt'],
      json['senderUid'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'createdAt': createdAt, 'senderUid': senderUid};
  }

  factory Invitation.empty() {
    return Invitation(
      DateTime.now(),
      '',
    );
  }

  bool get isEmpty => this.senderUid.isEmpty;
}
