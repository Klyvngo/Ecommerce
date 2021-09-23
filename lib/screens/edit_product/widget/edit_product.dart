import 'package:ecomerce/models/product.dart';
import 'package:ecomerce/models/products.dart';
import 'package:ecomerce/size_config.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

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
  final List<Color> _initColors = [
    const Color(0xFFF6625E),
    const Color(0xFF836DB8),
    const Color(0xFFDECB9C),
    Colors.white,
  ];
  final List<String> images = [];
  var _editProduct = Product(
      id: -1, images: [], colors: [], title: '', price: 0.0, description: '');
  var _initValue = {
    'title': '',
    'price': '',
    'description': '',
  };
  List<Color> colors = [];

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
      colors = _editProduct.colors;
    }
  }

  void _checkColor(int index) {
    if (colors.contains(_initColors[index])) {
      setState(() {
        colors.remove(_initColors[index]);
      });
    } else {
      setState(() {
        colors.add(_initColors[index]);
      });
    }
  }

  bool isSelect(Color color) {
    return colors.contains(color);
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
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              initialValue: _initValue['title'],
              decoration: const InputDecoration(
                labelText: 'Title',
                hintText: 'Enter title product',
              ),
              maxLines: 1,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              initialValue: _initValue['price'],
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                  labelText: 'Price', hintText: 'Enter price product'),
              maxLines: 1,
            ),
            Text(
              'Pick color',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            Row(
              children: [
                ...List.generate(
                  _initColors.length,
                  (index) => GestureDetector(
                    onTap: () {
                      _checkColor(index);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 3),
                      padding: const EdgeInsets.all(3),
                      height: getProportionateScreenWidth(40),
                      width: getProportionateScreenWidth(40),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: isSelect(_initColors[index])
                                ? kPrimaryColor
                                : Colors.transparent,
                          )),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: _initColors[index],
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
