import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../screens/ImageUpload.dart';


class MyImage extends StatefulWidget {
  final Function getApiUrl;
  const MyImage ({Key? key, required this.getApiUrl}): super(key: key);
  @override
  _MyImageState createState() => _MyImageState();
}

class _MyImageState extends State<MyImage> {
  late ImageUpload imageUpload;
  final image = TextEditingController();
  File? _imageFile;
  //Adding Child data
  Map<String, dynamic> data = {};
  @override
  void initState() {
    super.initState();
    imageUpload = ImageUpload();

  }
  //Adding Child data

  //endpoint

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().getImage(source: source);
    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
        image.text = pickedFile.path;
        String imagePath = image.text ;
        imageUpload.uploadFile(imagePath).then((value) {
          widget.getApiUrl(value);
        });


      }
    });
  }
  Future<void> _pickCam(ImageSource source) async {
    final pickedFile = await ImagePicker().getImage(source: source);
    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
        image.text = pickedFile.path;
        String imagePath = image.text ;
        imageUpload.uploadFile(imagePath).then((value) {
          widget.getApiUrl(value);
        });


      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left:15,right: 42),
              child: ElevatedButton.icon(onPressed: ()=> _pickImage(ImageSource.camera),
                icon:Icon(Icons.camera_alt_outlined), label: Text(' Cam '),),
            ),

            CircleAvatar(

              radius: 50,
              backgroundImage:
              _imageFile != null ? FileImage(_imageFile!) : null,
            ),
            const SizedBox(width: 20,),

            const SizedBox(width: 5,),

            ElevatedButton.icon(onPressed: ()=> _pickCam(ImageSource.gallery),
              icon:Icon(Icons.image), label: Text('Gallery'),),
       ],

        ),
        // TextField(
        //   controller: image,
        //   decoration: InputDecoration(labelText: 'Image Path'),
        // ),

        SizedBox(height: 30,),

      ],

    );
  }
}
