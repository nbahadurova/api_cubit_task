import 'package:flutter/material.dart';
import 'package:api_task/data/models/products_model.dart';
import 'package:api_task/data/services/products_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('api task'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FutureBuilder(
            future: ProductsService().getProducts(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData) {
                return const Center(child: Text('No data available'));
              } else {
                final List<Welcome> products = snapshot.data!;
                return SizedBox(
                  height: MediaQuery.of(context).size.height - 110,
                  child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: products.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 14,
                            mainAxisSpacing: 14,
                            mainAxisExtent: 235,
                            crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return Container(
                        height: 250,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListView(
                          children: [
                            SizedBox(
                              height: 100,
                              width: 60,
                              child: Image.network(products[index].image!),
                            ),
                            Text(
                              products[index].title!,
                              style: TextStyle(fontSize: 8),
                            ),
                            Text(products[index].description!,
                              style: TextStyle(fontSize: 8),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
