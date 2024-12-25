import 'package:flutter/material.dart';
import '../utils/util.dart';

class DetailsScreen extends StatelessWidget {
  final Map<String, dynamic> item;

  DetailsScreen({required this.item});

  @override
  Widget build(BuildContext context) {
    int quantity = 1;
    double totalPrice = item['price'];

    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Details"),
            actions: [
              Container(
                margin: EdgeInsets.only(right: 15),
                child: Icon(Icons.favorite_border),
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[300],
                  ),
                  child: Center(
                    child:
                        Icon(Icons.fastfood, size: 100, color: Colors.orange),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 47,
                  width: 201,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.black),
                  ),
                  child: Center(
                    child: Text(
                      "Ultra burgers",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  item['name'],
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      '\$${totalPrice.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 18),
                    ),
                    // SizedBox(width: 20),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Utils.buildRatingStars(item['rating']),
                    SizedBox(width: 10),
                    Text('${item['rating']} Stars'),
                  ],
                ),
                Spacer(),
                Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${totalPrice.toStringAsFixed(2)}',
                            style: TextStyle(fontSize: 18),
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove_circle_outline),
                                onPressed: () {
                                  setState(() {
                                    if (quantity > 1) {
                                      quantity--;
                                      totalPrice /= 2;
                                    } else {
                                      quantity = 0;
                                      totalPrice = 0;
                                    }
                                  });
                                },
                              ),
                              Text(
                                '$quantity',
                                style: TextStyle(fontSize: 18),
                              ),
                              IconButton(
                                icon: Icon(Icons.add_circle_outline),
                                onPressed: () {
                                  setState(() {
                                    if (quantity == 0) {
                                      quantity = 1;
                                      totalPrice = item['price'];
                                    } else {
                                      quantity++;
                                      totalPrice *= 2;
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Utils.showSnackbar(
                              context, '${item['name']} added to cart!');
                        },
                        child: Text('ADD TO CART'),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 50),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
