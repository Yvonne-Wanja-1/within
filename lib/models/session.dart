enum SessionType { video, audio, text }

class Session {
  final String id;
  final String userId;
  final String therapistId;
  final DateTime dateTime;
  final SessionType type;
  final bool isConfirmed;
  final String? notes;

  Session({
    required this.id,
    required this.userId,
    required this.therapistId,
    required this.dateTime,
    required this.type,
    this.isConfirmed = false,
    this.notes,
  });

  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
      id: json['id'] as String,
      userId: json['userId'] as String,
      therapistId: json['therapistId'] as String,
      dateTime: DateTime.parse(json['dateTime'] as String),
      type: SessionType.values.firstWhere(
        (e) => e.toString() == 'SessionType.${json['type']}',
      ),
      isConfirmed: json['isConfirmed'] as bool,
      notes: json['notes'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'therapistId': therapistId,
      'dateTime': dateTime.toIso8601String(),
      'type': type.toString().split('.').last,
      'isConfirmed': isConfirmed,
      'notes': notes,
    };
  }
}
