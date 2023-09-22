class TransactionModel {
  DateTime? time;
  String? status; //Failed,Successful, Pending
  String? transactionReference;
  String? type; //debit, credit
  TransactionModel(
      {this.status, this.time, this.transactionReference, this.type});
}
