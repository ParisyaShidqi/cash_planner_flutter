// To parse this JSON data, do
//
//     final timelyCashflowModel = timelyCashflowModelFromJson(jsonString);

import 'dart:convert';

TimelyCashflowModel timelyCashflowModelFromJson(String str) => TimelyCashflowModel.fromJson(json.decode(str));

String timelyCashflowModelToJson(TimelyCashflowModel data) => json.encode(data.toJson());

class TimelyCashflowModel {
    int? id;
    double? timelyCashflow;
    String? reason;
    String? dateTime;

    TimelyCashflowModel({
        this.id,
        this.timelyCashflow,
        this.reason,
        this.dateTime
    });

    factory TimelyCashflowModel.fromJson(Map<String, dynamic> json) => TimelyCashflowModel(
        id: json["id"],
        timelyCashflow: json["timely_cashflow"]?.toDouble(),
        reason: json["reason"],
        dateTime: json["datetime"]
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "timely_cashflow": timelyCashflow,
        "reason": reason,
        "datetime":dateTime
    };
}
