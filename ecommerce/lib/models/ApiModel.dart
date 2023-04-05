import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../widgets/function.dart';



class ApiModel {

  Future loginUser(BuildContext context , MyData data) async {
    final  url = Uri.parse('http://192.168.1.24:3000/product');
    print("IMAGE : ${data.Image}");
    final myData = {
      "name" : data.Productname,
      "price" : data.price,
      "image" : data.Image,
      "quantity": data.Quantity,
    };

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(myData),
      );
      print(response.body);

    } catch (error) {
      print(error);

    }
  }

}