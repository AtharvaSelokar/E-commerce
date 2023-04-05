import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);



  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

var  stringResponse;
var mapResponse;
var dataResponse;
var listResponse;

class _SecondScreenState extends State<SecondScreen> {
  Future GetApiCall()async{
    http.Response response;
     response= await http.get(Uri.parse("http://192.168.1.24:3000/product"));
     if(response.statusCode==200){
       setState(() {
         // stringResponse=response.body;
         mapResponse= jsonDecode(response.body);
         listResponse=mapResponse['data'];
       });
     }

  }
  @override
  void initState() {
    GetApiCall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(itemBuilder: (context,index){
        return Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(listResponse[index]["image"]),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(" Id : ${listResponse[index]["id"]}",style: TextStyle(fontSize: 25),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Product Name : ${listResponse[index]["name"]}.",style: TextStyle(fontSize: 28),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Product Price : ${listResponse[index]["price"]} Rs",style: TextStyle(fontSize: 24),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Product Quantity : ${listResponse[index]["quantity"]}",style: TextStyle(fontSize: 22),),
                ),
              ],
            ),
          ),
        );
      },
        itemCount: listResponse==null? 0: listResponse.length,
      )

    );
  }
}
