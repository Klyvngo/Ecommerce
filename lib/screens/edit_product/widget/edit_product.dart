import 'package:ecomerce/models/product.dart';
import 'package:ecomerce/models/products.dart';
import 'package:ecomerce/size_config.dart';
import 'package:flutter/material.dart';

class EditProduct extends StatefulWidget {
  const EditProduct({Key? key, required this.productId}) : super(key: key);
  final int? productId;

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _priceController = TextEditingController();
  final _descriptionController = TextEditingController();
  final List<Color> colors = [];
  final List<String> images = [];
  var _editProduct = Product(
      id: -1, images: [], colors: [], title: '', price: 0.0, description: '');
  var _initValue = {
    'title': '',
    'price': '',
    'description': '',
  };

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.productId != -1) {
      _editProduct =
          demoProducts.firstWhere((prod) => prod.id == widget.productId);
      _initValue = {
        'title': _editProduct.title,
        'price': _editProduct.price.toString(),
        'description': _editProduct.description,
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
      ),
      child: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            TextFormField(
              initialValue: _initValue['title'],
              decoration: InputDecoration(
                labelText: 'Title',
                hintText: 'Enter title product',
              ),
              maxLines: 1,
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              initialValue: _initValue['price'],
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Price'),
              maxLines: 1,
            )
          ],
        ),
      ),
    );
  }
}
