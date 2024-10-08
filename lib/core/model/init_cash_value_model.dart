// To parse this JSON data, do
//
//     final initCashValueModel = initCashValueModelFromJson(jsonString);

import 'dart:convert';

InitCashValueModel initCashValueModelFromJson(String str) => InitCashValueModel.fromJson(json.decode(str));

String initCashValueModelToJson(InitCashValueModel data) => json.encode(data.toJson());

class InitCashValueModel {
    double? initialCash;
    double? targetSaving;
    String? time;

    InitCashValueModel({
        this.initialCash,
        this.targetSaving,
        this.time,
    });

    factory InitCashValueModel.fromJson(Map<String, dynamic> json) => InitCashValueModel(
        initialCash: json["initial_cash"]?.toDouble(),
        targetSaving: json["target_saving"]?.toDouble(),
        time: json["time"],
    );

    Map<String, dynamic> toJson() => {
        "initial_cash": initialCash,
        "target_saving": targetSaving,
        "time": time,
    };
}
