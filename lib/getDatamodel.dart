import 'dart:convert';

List<GetDataModel> getDataModelFromJson(String str) => List<GetDataModel>.from(
    json.decode(str).map((x) => GetDataModel.fromJson(x)));

String getDataModelToJson(List<GetDataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetDataModel {
  int userId;
  int id;
  String title;
  String body;
  // String mail;

  GetDataModel({
    required this.userId,
    required this.id,
    required this.title,

    // required this.name,
    required this.body,
    // required this.mail,
  });

  factory GetDataModel.fromJson(Map<String, dynamic> json) => GetDataModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],

        // name: json["name"],
        body: json["body"],
        // mail: json["mail"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,

        // "name": name,
        "body": body,
        // "mail":mail,
      };
}

class GetListDataModel {
  List<GetDataModel> listModel;

  GetListDataModel({
    required this.listModel,
  });
}
