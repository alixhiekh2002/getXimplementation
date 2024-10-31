import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:flutter/material.dart';
import 'package:geetx/controller/demo_controller.dart';
import 'package:geetx/demo/my_detail_page.dart';
import 'package:get/get.dart';

class DemoScreen extends StatefulWidget {
  const DemoScreen({Key? key}) : super(key: key);

  @override
  DemoScreenState createState() => DemoScreenState();
}

class DemoScreenState extends State<DemoScreen> {
  CartController cartController = Get.put(CartController());
  // We can detect the location of the cart by this  GlobalKey<CartIconKey>

  @override
  Widget build(BuildContext context) {
    return AddToCartAnimation(
      // To send the library the location of the Cart icon
      cartKey: cartController.cartKey,
      height: 30,
      width: 30,
      opacity: 0.85,
      dragAnimation: const DragToCartAnimationOptions(
        rotation: true,
      ),
      jumpAnimation: const JumpAnimationOptions(),
      createAddToCartAnimation: (runAddToCartAnimation) {
        // You can run the animation by addToCartAnimationMethod, just pass trough the the global key of  the image as parameter
        cartController.runAddToCartAnimation = runAddToCartAnimation;
      },
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 49, 206, 241),
        appBar: AppBar(
          title: Text('GET X CART'),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 10),
              height: 630,
              child: GetBuilder<CartController>(
                builder: (getContext) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Set the number of columns
                      crossAxisSpacing: 10.0, // Spacing between columns
                      mainAxisSpacing: 10.0, // Spacing between rows
                      childAspectRatio:
                          1.0, // Adjust for item size (width/height ratio)
                    ),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return AppListItem(
                        onClick: listClick,
                        index: index,
                      );
                    },
                  );
                },
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 40),
                  height: 70,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.green,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      AddToCartIcon(
                        key: cartController.cartKey,
                        icon: const Icon(Icons.shopping_cart),
                        badgeOptions: const BadgeOptions(
                          active: true,
                          backgroundColor: Colors.red,
                        ),
                      ),
                      SizedBox(
                        width: 130,
                      ),
                      IconButton(
                        icon: const Icon(Icons.clean_hands),
                        onPressed: () {
                          cartController.showDialogBox(context);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void listClick(GlobalKey widgetKey) async {
    await cartController.runAddToCartAnimation(widgetKey);
    await cartController.cartKey.currentState!
        .runCartAnimation((++cartController.cartQuantityItems).toString());
  }
}
