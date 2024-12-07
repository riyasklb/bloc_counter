// To parse this JSON data, do
//
//     final getListModel = getListModelFromJson(jsonString);

import 'dart:convert';

List<GetListModel> getListModelFromJson(String str) => List<GetListModel>.from(json.decode(str).map((x) => GetListModel.fromJson(x)));

String getListModelToJson(List<GetListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetListModel {
    int userId;
    int id;
    String title;
    String body;

    GetListModel({
        required this.userId,
        required this.id,
        required this.title,
        required this.body,
    });

    factory GetListModel.fromJson(Map<String, dynamic> json) => GetListModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );


@override
String toString() {
    return "User ID : $userId";
}
    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
        
    };
}
