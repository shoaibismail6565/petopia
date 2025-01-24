import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addUserDetail(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .set(userInfoMap);
  }

  Future addFoodItem(Map<String, dynamic> userInfoMap, ) async {
    return await FirebaseFirestore.instance.collection("products").add(userInfoMap);
  }

  Future<Stream<QuerySnapshot>> getFoodItem() async {
    return await FirebaseFirestore.instance.collection("products").snapshots();
  }

  Future addFoodToCart(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(id).collection("Cart")
        .add(userInfoMap);
  }

  Future<Stream<QuerySnapshot>> getFoodCart(String id) async {
    return await FirebaseFirestore.instance.collection("users")
        .doc(id)
        .collection("Cart")
        .snapshots();
  }

  Future addOrder(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(id).collection("Order")
        .add(userInfoMap);
  }

  Future<Stream<QuerySnapshot>> getOrder(String id) async {
    return await FirebaseFirestore.instance.collection("users")
        .doc(id)
        .collection("Order")
        .snapshots();
  }
}
