import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductsProvider extends ChangeNotifier {
  final CollectionReference _productsCollection = FirebaseFirestore.instance.collection('products');

  List<QueryDocumentSnapshot> _products = [];
  List<QueryDocumentSnapshot> get products => _products;

  ProductsProvider() {
    _fetchProducts();
  }

  void _fetchProducts() {
    _productsCollection.snapshots().listen((snapshot) {
      _products = snapshot.docs;
      notifyListeners();
    });
  }

  Future<void> deleteProduct(String productId) async {
    await _productsCollection.doc(productId).delete();
  }
}
