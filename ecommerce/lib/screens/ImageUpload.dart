import 'package:dio/dio.dart';

typedef void StringCallback(String val);

class ImageUpload {

  Future<String> uploadFile(String filePath) async {
    Dio dio = Dio();
    String url = "http://192.168.1.24:3000/file/upload";
    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(filePath),
    });
    Response response = await dio.post(
        url, data: formData, options: Options(method: 'POST',
        responseType: ResponseType.json));
    String fileUrl = response.data['filepaths'][0];
    // print(fileUrl);
    return (fileUrl);


  }

}
