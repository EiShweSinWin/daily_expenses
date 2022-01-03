class ExpenseModel {
  int? id;
  int? type;
  double? amount;
  String? date;
  String? reason;

  ExpenseModel({this.id, this.type, this.amount, this.date, this.reason});

  ExpenseModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    type = json['type'];
    // int? iamount = json['amount'];
    // amount = iamount!.toDouble();
    amount = json['amount'];
    date = json['date'];
    reason = json['reason'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['amount'] = amount;
    data['date'] = date;
    data['reason'] = reason;

    return data;
  }

  @override
  String toString() {
    return '$amount';
  }
}
