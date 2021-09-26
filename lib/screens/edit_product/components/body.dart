import 'package:ecomerce/enums.dart';
import 'package:ecomerce/models/product.dart';
import 'package:ecomerce/models/products.dart';
import 'package:ecomerce/screens/edit_product/update_product_screen.dart';
import 'package:ecomerce/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
      ),
      child: ListView.builder(
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: GestureDetector(
            key: Key(demoProducts[index].id.toString()),
            onTap: () {
              setState(() {
                Navigator.of(context).pushNamed(UpdateProduct.routeName,
                    arguments: [demoProducts[index].id, MenuEditProduct.edit]);
              });
            },
            child: CardProduct(
              prod: demoProducts[index],
            ),
          ),
        ),
        itemCount: demoProducts.length,
      ),
    );
  }
}

class CardProduct extends StatelessWidget {
  const CardProduct({Key? key, required this.prod}) : super(key: key);
  final Product? prod;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(
                getProportionateScreenWidth(10),
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(prod!.images[0]),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              prod!.title,
              maxLines: 2,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            Text(
              '\$${prod!.price}',
              style: const TextStyle(color: Colors.red),
            ),
          ],
        )
      ],
    );
  }
}
