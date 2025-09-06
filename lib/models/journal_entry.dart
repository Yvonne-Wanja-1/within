enum Mood { veryHappy, happy, neutral, sad, verySad }

class JournalEntry {
  final String id;
  final String userId;
  final DateTime date;
  final String content;
  final Mood mood;
  final List<String>? attachments;
  final bool isVoiceNote;

  JournalEntry({
    required this.id,
    required this.userId,
    required this.date,
    required this.content,
    required this.mood,
    this.attachments,
    this.isVoiceNote = false,
  });

  factory JournalEntry.fromJson(Map<String, dynamic> json) {
    return JournalEntry(
      id: json['id'] as String,
      userId: json['userId'] as String,
      date: DateTime.parse(json['date'] as String),
      content: json['content'] as String,
      mood: Mood.values.firstWhere(
        (e) => e.toString() == 'Mood.${json['mood']}',
      ),
      attachments: (json['attachments'] as List<dynamic>?)?.cast<String>(),
      isVoiceNote: json['isVoiceNote'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'date': date.toIso8601String(),
      'content': content,
      'mood': mood.toString().split('.').last,
      'attachments': attachments,
      'isVoiceNote': isVoiceNote,
    };
  }
}
