class MyData {
  String Productname;
  String price;
  String Image;
  String Quantity;


  MyData({required this.Productname, required this.price,required this.Image,required this.Quantity});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Productname'] = this.Productname;
    data['price'] = this.price;
    data['Image'] =this.Image;
    data['Quantity'] = this.Quantity;
    return data;
  }
}