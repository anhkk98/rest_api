import 'dart:convert';

import 'package:http/http.dart' as http;

class ProductImg {
  final int id;
  final String name;
  final List<ImageP> images;

  ProductImg({this.id, this.name, this.images});

  factory ProductImg.fromJson(Map<String, dynamic> parsedJson){

    var list = parsedJson['images'] as List;
    // print(list.runtimeType);
    List<ImageP> imagesList = list.map((i) => ImageP.fromJson(i)).toList();


    return ProductImg(
        id: parsedJson['id'],
        name: parsedJson['name'],
        images: imagesList

    );
  }
}

class ImageP {
  final int imageId;
  final String imageName;

  ImageP({this.imageId, this.imageName});

  factory ImageP.fromJson(Map<String, dynamic> parsedJson){
    return ImageP(
        imageId:parsedJson['id'],
        imageName:parsedJson['imageName']
    );
  }
}

// List<Product> parseProducts(String responseBody) {
//   final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
//   return parsed.map<Product>((json) => Product.fromJson(json)).toList();
// }


Future<ProductImg> loadProduct() async {
  var response = await http.get('https://raw.githubusercontent.com/PoojaB26/ParsingJSON-Flutter/master/assets/product.json');
  final jsonResponse = json.decode(response.body);
  ProductImg product = new ProductImg.fromJson(jsonResponse);
  return product;
}