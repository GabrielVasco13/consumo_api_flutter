class MessageModel {
  MessageModel({required this.id, required this.advice});

  final int id;
  final String advice;

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['id'],
      advice: json['advice'],
    );
  }
}
