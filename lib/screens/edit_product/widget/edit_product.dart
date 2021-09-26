import 'package:ecomerce/enums.dart';
import 'package:ecomerce/models/product.dart';
import 'package:ecomerce/models/products.dart';
import 'package:ecomerce/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class EditProduct extends StatefulWidget {
  const EditProduct({Key? key, required this.productId, required this.menu})
      : super(key: key);
  final int? productId;
  final MenuEditProduct menu;

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  final List<Color> _initColors = [
    const Color(0xFFF6625E),
    const Color(0xFF836DB8),
    const Color(0xFFDECB9C),
    Colors.white,
  ];
  final _imageController = TextEditingController();
  List<String> images = [];
  var _editProduct = Product(
      id: -1, images: [], colors: [], title: '', price: 0.0, description: '');
  var _initValue = {
    'title': '',
    'price': '',
    'description': '',
  };
  List<Color> colors = [];
  int imageSelect = 0;

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
      images = _editProduct.images;
      if (images.isNotEmpty) {
        _imageController.text = images[0];
      } else {
        _imageController.text = '';
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
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

  bool _isSelect(Color color) {
    return colors.contains(color);
  }

  void _imageSelecting(int index) {
    setState(() {
      imageSelect = index;
      _imageController.text = images[index];
    });
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
          scrollDirection: Axis.vertical,
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
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Title is empty';
                }
                return null;
              },
              onSaved: (value) {
                _editProduct = Product(
                  id: _editProduct.id,
                  title: value!,
                  description: _editProduct.description,
                  price: _editProduct.price,
                  images: _editProduct.images,
                  colors: _editProduct.colors,
                );
              },
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_priceFocusNode);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              initialValue: _initValue['price'],
              // controller: _priceController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                  labelText: 'Price', hintText: 'Enter price product'),
              maxLines: 1,
              focusNode: _priceFocusNode,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Price is empty';
                }
                return null;
              },
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_descriptionFocusNode);
              },
              onSaved: (value) {
                _editProduct = Product(
                  id: _editProduct.id,
                  title: _editProduct.title,
                  description: _editProduct.description,
                  price: double.parse(value!),
                  images: _editProduct.images,
                  colors: _editProduct.colors,
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              initialValue: _initValue['description'],
              decoration: const InputDecoration(
                  labelText: 'Description',
                  hintText: 'Enter description product'),
              keyboardType: TextInputType.text,
              maxLength: 130,
              maxLines: 4,
              focusNode: _descriptionFocusNode,
            ),
            const Text(
              'Pick color',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
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
                            color: _isSelect(_initColors[index])
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
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: images.isNotEmpty
                      ? <Widget>[
                          ...List.generate(
                            images.length,
                            (index) => GestureDetector(
                              onTap: () {
                                _imageSelecting(index);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      color: imageSelect == index
                                          ? kPrimaryColor
                                          : Colors.transparent,
                                    )),
                                height: 30,
                                width: 30,
                                margin: const EdgeInsets.only(right: 8),
                                child: Image.asset(images[index]),
                              ),
                            ),
                          ),
                          images.length < 4
                              ? Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Icon(Icons.add),
                                )
                              : Container(),
                          const Spacer(),
                          Container(
                            height: 140,
                            width: 140,
                            margin: const EdgeInsets.only(top: 10, right: 10),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: Image.asset(
                                  images[imageSelect],
                                  height: 100,
                                  width: 100,
                                ),
                              ),
                            ),
                          ),
                        ]
                      : <Widget>[
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Icon(Icons.add),
                          ),
                          const Spacer(),
                          Container(
                            height: 150,
                            width: 150,
                            margin: const EdgeInsets.only(top: 10, right: 10),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: Icon(Icons.image_search_outlined),
                              ),
                            ),
                          ),
                        ],
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Image URL',
                    hintText: 'Enter image url',
                    hintMaxLines: 1,
                  ),
                  controller: _imageController,
                  keyboardType: TextInputType.url,
                  maxLines: 1,
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                widget.menu == MenuEditProduct.edit
                    ? TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.grey.withOpacity(0.1),
                          primary: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          side: const BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () {},
                        child: Row(children: const <Widget>[
                          Icon(Icons.delete_outline),
                          Text('Delete'),
                        ]),
                      )
                    : Container(),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.grey.withOpacity(0.1),
                    primary: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    side: const BorderSide(
                      color: kPrimaryColor,
                    ),
                  ),
                  onPressed: () {},
                  child: Row(children: const <Widget>[
                    Icon(CupertinoIcons.arrow_up_right),
                    Text('Submit'),
                  ]),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
