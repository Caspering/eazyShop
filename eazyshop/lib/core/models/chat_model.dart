class Chat {
  String? id;
  String? userId;
  String? receiverId;
  List? messages;
  Chat({
    this.id,
    this.messages,
    this.receiverId,
    this.userId,
  });
  Chat.fromMap(Map<String, dynamic> snapshot, this.id)
      : userId = snapshot['userId'],
        messages = snapshot['messages'],
        receiverId = snapshot['receiverId'];

  toJson() {
    return {"userId": userId, "receiverId": receiverId, "messages": messages};
  }
}
