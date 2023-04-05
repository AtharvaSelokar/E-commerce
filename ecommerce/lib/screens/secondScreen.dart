// import 'dart:convert';
//
// import 'package:ecommerce/models/GetApiModel.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// class secondcreen extends StatelessWidget {
//    secondcreen({Key? key}) : super(key: key);
// List<GetApiModel>getApiModel=[];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder(
//         future: getData(),
//         builder: (context,snapshot) {
//           print(getApiModel);
//
//           if(snapshot.hasData){
//             print(getApiModel);
//
//             return ListView.builder(
//                 itemCount:getApiModel.length,
//                 itemBuilder:(context,index){
//                   return Container(
//                     height: 130,
//                     color: Colors.greenAccent,
//                     padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
//                     margin: EdgeInsets.all(10),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text("Id : ",style: TextStyle(fontSize: 15),),
//                         Text("Product Name : data",style: TextStyle(fontSize: 15),),
//                         Text("Product Price : data",style: TextStyle(fontSize: 15),),
//                         Text("Product Quantitiy: data",style: TextStyle(fontSize: 15),),
//                         Text("Image Url : data",style: TextStyle(fontSize: 15),),
//                       ],
//                     ),
//                   );
//                 }
//             );
//           }
//
//           else{return Center(child: Text('Loading'),);
//           }
//         }
//       ),
//
//     );
//
//   }
//   Future<List<GetApiModel>> getData()async{
//     final response= await http.get(Uri.parse('http://192.168.21.128:3000/product'));
//     var data =jsonDecode(response.body.toString());
//     if(response.statusCode==200){
//       for(Map<String, dynamic> index in data){
//         getApiModel.add(GetApiModel.fromJson(index));
//
//       }
//     return getApiModel;
//
//     }else{
//       return getApiModel;
//     }
//   }
// }
