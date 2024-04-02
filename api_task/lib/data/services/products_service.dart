import 'dart:io';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:api_task/data/endpoints.dart';
import 'package:api_task/data/models/products_model.dart';


class ProductsService {
  Future<List<Welcome>> getProducts() async {
    try {
       final endpoint = Endpoints.productsUrl;
      final url = Uri.parse(endpoint);
      final response = await http.get(url);
      List<dynamic> json = jsonDecode(response.body);
      List<Welcome> products = json.map((e) => Welcome.fromJson(e)).toList();

      if (response.statusCode == 200) {
        return products;
      }
      throw Exception();
    } on SocketException catch(e){
      throw SocketException('$e');
    }
    catch (e) {
      throw Exception();
    }
    
  }
}