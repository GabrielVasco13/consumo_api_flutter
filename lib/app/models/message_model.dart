class MessageModel {
  final int id;
  final String advice;

  MessageModel({required this.id, required this.advice});

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['id'] as int,
      advice: json['advice'] as String,
    );
  }
}
