enum MessageType { text, voice, attachment }

class Message {
  final String id;
  final String senderId;
  final String receiverId;
  final DateTime timestamp;
  final String content;
  final MessageType type;
  final String? attachmentUrl;
  final bool isEncrypted;
  final bool isRead;

  Message({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.timestamp,
    required this.content,
    required this.type,
    this.attachmentUrl,
    this.isEncrypted = true,
    this.isRead = false,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'] as String,
      senderId: json['senderId'] as String,
      receiverId: json['receiverId'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      content: json['content'] as String,
      type: MessageType.values.firstWhere(
        (e) => e.toString() == 'MessageType.${json['type']}',
      ),
      attachmentUrl: json['attachmentUrl'] as String?,
      isEncrypted: json['isEncrypted'] as bool? ?? true,
      isRead: json['isRead'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'senderId': senderId,
      'receiverId': receiverId,
      'timestamp': timestamp.toIso8601String(),
      'content': content,
      'type': type.toString().split('.').last,
      'attachmentUrl': attachmentUrl,
      'isEncrypted': isEncrypted,
      'isRead': isRead,
    };
  }
}
