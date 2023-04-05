//
//
// import 'dart:convert';
//
// List<GetApiModel> getApiModelFromJson(String str) => List<GetApiModel>.from(json.decode(str));
//
// String getApiModelToJson(List<GetApiModel> data) => json.encode(List<dynamic>.from(data.map((e) => null)));
//
// class GetApiModel {
//   GetApiModel({
//     required this.status,
//     required this.data,
//     required this.message,
//   });
//
//   bool status;
//   List<Datum> data;
//   String message;
//
//   factory GetApiModel.fromJson(Map<String, dynamic> json) => GetApiModel(
//     status: json["status"],
//     data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//     message: json["message"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "status": status,
//     "data": List<dynamic>.from(data.map((x) => x.toJson())),
//     "message": message,
//   };
// }
//
// class Datum {
//   Datum({
//     required this.id,
//     required this.name,
//     required this.price,
//     required this.image,
//     required this.quantity,
//   });
//
//   int id;
//   String name;
//   String price;
//   String image;
//   int quantity;
//
//   factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//     id: json["id"],
//     name: json["name"],
//     price: json["price"],
//     image: json["image"],
//     quantity: json["quantity"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//     "price": price,
//     "image": image,
//     "quantity": quantity,
//   };
// }
