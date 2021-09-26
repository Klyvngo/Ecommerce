import 'package:ecomerce/models/product.dart';
import 'package:flutter/material.dart';

class Products with ChangeNotifier {
  List<Product> _items = [];
  String? authToken = '';
  String? userId;
  Products(this._items, [this.authToken, this.userId]);
  List<Product> get items {
    return [..._items];
  }

  List<Product> get itemsFavo {
    return _items.where((prod) => prod.isFavourite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  //Future void fetch product
  Future<void> fetchProduct() async {}
  //Future void add product
  //Future void del product
  //Future void edit product
}

List<Product> demoProducts = [
  Product(
    id: 1,
    images: [
      "https://2.pik.vn/2021af77a707-929b-49f2-a707-7082c2776b5a.png",
      "https://2.pik.vn/202169f41434-dba4-4509-9675-f295871d9d8a.png",
      "https://2.pik.vn/2021e4573d63-2d56-4cd9-9074-aa6a59fad554.png",
      "https://2.pik.vn/202113c35866-ee24-46d9-b71d-a58b7a32a2a0.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Wireless Controller for PS4™",
    price: 64.99,
    description: description,
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 2,
    images: [
      "https://2.pik.vn/2021db6a6fd3-6e47-4335-8b0c-7c7486def201.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Nike Sport White - Man Pant",
    price: 50.5,
    description: description,
    rating: 4.1,
    isPopular: true,
  ),
  Product(
    id: 3,
    images: [
      "https://2.pik.vn/2021c8e1575b-1d2e-4a8f-8e7a-acd354dafd51.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Gloves XC Omega - Polygon",
    price: 36.55,
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 4,
    images: [
      "https://2.pik.vn/2021b9773c9e-ee2d-40fa-b3e8-7a26492b7679.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Logitech Head",
    price: 20.20,
    description: description,
    rating: 4.1,
    isFavourite: true,
  ),
];

const String description =
    "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";
