import 'package:ecomerce/models/product.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ProductImage extends StatefulWidget {
  const ProductImage({Key? key, required this.product}) : super(key: key);
  final Product? product;

  @override
  State<ProductImage> createState() => _ProductImageState();
}

class _ProductImageState extends State<ProductImage> {
  int selectImage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(238),
          child: AspectRatio(
            aspectRatio: 1,
            child: Hero(
                tag: widget.product!.id.toString(),
                child: Image.asset(widget.product!.images[selectImage])),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ...List.generate(
              widget.product!.images.length,
              (index) => buildSmallImage(index),
            ),
          ],
        )
      ],
    );
  }

  GestureDetector buildSmallImage(index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectImage = index;
        });
      },
      child: AnimatedContainer(
        duration: defaultDuration,
        margin: const EdgeInsets.only(right: 15),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: kPrimaryColor.withOpacity(selectImage == index ? 1 : 0),
            )),
        height: getProportionateScreenWidth(48),
        width: getProportionateScreenWidth(48),
        child: Image.asset(widget.product!.images[index]),
      ),
    );
  }
}
