import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  GlobalKey<CartIconKey> cartKey = GlobalKey<CartIconKey>();
  late Function(GlobalKey) runAddToCartAnimation;
  
  var cartQuantityItems = 0;
  Future<void> showDialogBox(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(
                Icons.warning,
                color: Colors.orange,
              ),
              SizedBox(width: 8),
              Text('Confirmation'),
            ],
          ),
          content: Text('Do you want to proceed?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Add your action for 'No' button here
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () {
              cartQuantityItems = 0;
                cartKey.currentState!.runClearCartAnimation();
                Navigator.of(context).pop();
                // Add your action for 'Yes' button here
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }
}
