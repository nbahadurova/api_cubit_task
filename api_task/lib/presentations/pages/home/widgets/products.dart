// import 'package:flutter/material.dart';
// import 'package:api_task/data/models/products_model.dart';
// import 'package:api_task/data/services/products_service.dart';

// class Products extends StatelessWidget {

//   const Products({ super.key });

//    @override
//    Widget build(BuildContext context) {
//        return FutureBuilder(
//         future: ProductsService.getProducts(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return Center(child: Text('Error: ${snapshot.error}'));
//         } else if (!snapshot.hasData) {
//           return const Center(child: Text('No data available'));
//         } else {
//           final List<Welcome> products = snapshot.data!;
//           return Container(
//           height: 200,
//           width: 150,
//           decoration: BoxDecoration(
//             color: Colors.grey,
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child:  Column(
//             children: [
//              Image.network(products[0].image)
//             ],
//           ),
//          );
//         }
//         },
         
//        );
//   }
// }