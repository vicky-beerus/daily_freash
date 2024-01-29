import 'package:dailyfreash/CART/PROVIDER/cart_provider.dart';
import 'package:dailyfreash/CUSTOM_WIDGETS/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartBadge extends StatelessWidget {
  const CartBadge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Badge(
      label: CustomText(txt: Provider.of<CartProivder>(context,listen: true).cartList.length.toString()),
      child: Icon(
        Icons.shopping_cart,
        color: Colors.white,
      ),
    );
  }
}

