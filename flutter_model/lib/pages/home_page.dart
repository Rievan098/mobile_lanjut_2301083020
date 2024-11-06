import 'dart:math';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_model/model/produk.dart';
import 'package:flutter/src/widgets/image.dart' as img;

class HomePage extends StatelessWidget {
  final Faker faker = Faker();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Produk> data = List.generate(100, (index) {
      return Produk(
        "https://picsum.photos/id/$index/200/300",
        faker.food.restaurant(),
        10000 + Random().nextInt(100000),
        faker.lorem.sentence(),
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("Model"),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10, 
          
        ),
        itemBuilder: (context, index) {
          return GridTile(
            child: img.Image.network(
              data[index].imageUrl,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(child: CircularProgressIndicator());
              },
              errorBuilder: (context, error, stackTrace) {
                return Center(child: Icon(Icons.error));
              },
            ),
            footer: Container(
              color: Colors.amber,
              padding: EdgeInsets.all(8), // Added padding for better appearance
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Align text to start
                children: [
                  Text(
                    data[index].nama,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4), // Add spacing between texts
                  Text(data[index].desc),
                  SizedBox(height: 4),
                  Text(
                    '${data[index].harga}',
                    style: TextStyle(color: Colors.red), // Change text color
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: data.length,
      ),
    );
  }
}
