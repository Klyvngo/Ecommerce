import 'package:ecomerce/components/rounded_icon_button.dart';
import 'package:ecomerce/constants.dart';
import 'package:ecomerce/models/product.dart';
import 'package:ecomerce/size_config.dart';
import 'package:flutter/material.dart';

class ColorsDot extends StatefulWidget {
  const ColorsDot({Key? key, required this.product}) : super(key: key);
  final Product? product;

  @override
  State<ColorsDot> createState() => _ColorsDotState();
}

class _ColorsDotState extends State<ColorsDot> {
  int _selected = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
      ),
      child: Row(
        children: <Widget>[
          ...List.generate(
            widget.product!.colors.length,
            (index) => GestureDetector(
              onTap: () {
                setState(() {
                  _selected = index;
                });
              },
              child: ColorDot(
                color: widget.product!.colors[index],
                isSelect: _selected == index,
              ),
            ),
          ),
          const Spacer(),
          RoundedIconButton(
            icon: Icons.remove,
            showShadow: true,
            press: () {},
          ),
          SizedBox(
            width: getProportionateScreenWidth(35),
          ),
          RoundedIconButton(
            icon: Icons.add,
            showShadow: true,
            press: () {},
          ),
        ],
      ),
    );
  }
}

class ColorDot extends StatelessWidget {
  const ColorDot({
    Key? key,
    required this.color,
    this.isSelect = false,
  }) : super(key: key);
  final Color? color;
  final bool? isSelect;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 3),
      padding: const EdgeInsets.all(3),
      height: getProportionateScreenWidth(40),
      width: getProportionateScreenWidth(40),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          color: isSelect! ? kPrimaryColor : Colors.transparent,
        ),
        shape: BoxShape.circle,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
