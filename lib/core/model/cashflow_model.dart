// To parse this JSON data, do
//
//     final cashflowModel = cashflowModelFromJson(jsonString);

import 'dart:convert';

CashflowModel cashflowModelFromJson(String str) =>
    CashflowModel.fromJson(json.decode(str));

String cashflowModelToJson(CashflowModel data) => json.encode(data.toJson());

class CashflowModel {
  int? id;
  double? cashflow;
  String? reason;
  String? dateTime;

  CashflowModel({this.id, this.cashflow, this.reason, this.dateTime});

  factory CashflowModel.fromJson(Map<String, dynamic> json) => CashflowModel(
      id: json["id"],
      cashflow: json["cashflow"]?.toDouble(),
      reason: json["reason"],
      dateTime: json["datetime"]);

  Map<String, dynamic> toJson() =>
      {"id": id, "cashflow": cashflow, "reason": reason, "datetime": dateTime};
}
