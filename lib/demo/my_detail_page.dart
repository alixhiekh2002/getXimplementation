import 'package:flutter/material.dart';

class AppListItem extends StatelessWidget {
  final GlobalKey widgetKey = GlobalKey();
  final int index;
  final void Function(GlobalKey) onClick;

  AppListItem({super.key, required this.onClick, required this.index});

  List imagePathArray = [
    'assets/sushi.png',
    'assets/bigapple.png',
    'assets/flour.png',
    'assets/carrot.png',
    'assets/flour.png',
    'assets/pulses.png',
    'assets/sushi.png',
    'assets/carrot.png',
    'assets/bigapple.png',
    'assets/sushi.png',
  ];

  List titleArray = [
    'Men Boots',
    'Converse Shoes',
    'High Heels',
    'Running Shoes For Men',
    'Jogging Shoes',
    'Casual Shoes',
    'Sneakers',
    'Red Sneakers',
    'Pumps-High Heels',
    'Black Sports Shoes',
  ];

  @override
  Widget build(BuildContext context) {
    Widget mandatoryContainer = Container(
      key: widgetKey,
      width: 60,
      height: 60,
      color: Colors.transparent,
      child: Image.asset(
        imagePathArray[index],
        width: 60,
        height: 60,
      ),
    );

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [Colors.blue, Colors.green])),
      child: Column(
        children: [
          mandatoryContainer,
          Text(
            titleArray[index],
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          ElevatedButton(
            onPressed: () => onClick(widgetKey),
            child: Text("Add to Cart"),
          ),
        ],
      ),
    );
  }
}


// Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
//       child: Card(
//         color: Color(0xFFDAFFFB),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10.0)
//         ),
//         child: ListTile(
//           contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 20.0),
//           onTap: () => onClick(widgetKey),
//           leading: mandatoryContainer,
//           title: Text(
//             titleArray[index],
//             style: TextStyle(fontSize: 18.0, fontFamily: 'qa', fontWeight: FontWeight.bold),
//           ),
//         ),
//       ),
//     );