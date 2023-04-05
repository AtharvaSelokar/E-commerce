import 'dart:io';
import 'package:ecommerce/function/SecondScreen.dart';
import 'package:ecommerce/models/ApiModel.dart';
import 'package:ecommerce/widgets/imagePicker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:path_provider/path_provider.dart';

import '../widgets/function.dart';
import '../widgets/Image PickerWidget.dart';
class Homepage extends StatelessWidget {

  TextEditingController _productName=TextEditingController();
  TextEditingController _ProductPrice=TextEditingController();
  TextEditingController _ProductQuantity=TextEditingController();
  TextEditingController _ProductImage=TextEditingController();
  ApiModel apiModel=ApiModel();
  String Url ="";


  ImagePickercControlller controlller=Get.put(ImagePickercControlller());
   Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:[InkWell(
          onTap: (){
          },
          child: Text('Add Products',style: TextStyle(fontSize: 35,fontWeight: FontWeight.w400),)),
        Padding(
          padding: const EdgeInsets.all(10),
          child: TextFormField(
            controller: _productName,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: "Product name ",
              hintText: "Enter Product name",
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: TextFormField(
            controller: _ProductPrice,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: "Product price ",
              hintText: "Enter Product price",
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: TextFormField(
            controller: _ProductQuantity,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: "Product quantity ",
              hintText: "Enter Product quantity",
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Container(
          child: MyImage(getApiUrl: (value){
          {
          Url =value;
          print("UPLOADED URL : $Url");
          }
          }),
        ),
        Padding(
            padding: const EdgeInsets.only(left: 6),
            child: ElevatedButton(

                onPressed: (){
                  // uploadFile();
                  final myData = MyData(
                    Productname: _productName.text,
                    price: _ProductPrice.text,
                    Quantity: _ProductQuantity.text,
                    Image: Url,

                  );

                  apiModel.loginUser(context ,myData);
                  _productName.clear();
                  _ProductPrice.clear();
                  _ProductImage.clear();
                  _ProductQuantity.clear();
                },
                child: Text('    Submit   ',))
        ),
        ElevatedButton(onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SecondScreen(),));

        }, child: Text('Next page'))
      ],

    );

  }





}
