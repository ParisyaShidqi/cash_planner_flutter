// To parse this JSON data, do
//
//     final historyModel = historyModelFromJson(jsonString);

import 'dart:convert';

HistoryModel historyModelFromJson(String str) =>
    HistoryModel.fromJson(json.decode(str));

String historyModelToJson(HistoryModel data) => json.encode(data.toJson());

class HistoryModel {
  int? id;
  double? history;
  String? reason;
  String? dateTime;
  String? type;

  HistoryModel({this.id, this.history, this.reason, this.dateTime, this.type});

  factory HistoryModel.fromJson(Map<String, dynamic> json) => HistoryModel(
      id: json["id"],
      history: json["history"]?.toDouble(),
      reason: json["reason"],
      dateTime: json["datetime"],
      type: json["type"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "history": history,
        "reason": reason,
        "datetime": dateTime,
        "type": type
      };
}
