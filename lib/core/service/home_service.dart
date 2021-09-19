import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projet_last/globals.dart';
import 'package:projet_last/model/product_model.dart';

class HomeService {
  final CollectionReference _categoryCollectionRef =
      FirebaseFirestore.instance.collection('categories');

  final CollectionReference _productCollectionRef =
      FirebaseFirestore.instance.collection('products');
  final CollectionReference _productCollectionRef2 =
      FirebaseFirestore.instance.collection('products');

  // Firestore.instance.collection('fields').where('grower', isEqualTo: 1)
  // .snapshots().listen(
  //       (data) => print('grower ${data.documents[0]['name']}')
  // );

  Future<List<QueryDocumentSnapshot>> getCategory() async {
    var value = await _categoryCollectionRef.get();

    return value.docs;
  }

  // Future<List<QueryDocumentSnapshot>> getTest() async {
  //   var value = await _productCollectionRef2
  //       .where('categoryId', isEqualTo: )
  //       .get();
  //   return value.docs;
  // }

  Future<List<QueryDocumentSnapshot>> getBestSelling() async {
    var value = await _productCollectionRef.get();
    return value.docs;
  }

  // Future<List<QueryDocumentSnapshot>> getProductByCategory() async {
  //   var value = await _productCollectionRef.get();

  //   return value.docs;
  // }

  // Future<List<QueryDocumentSnapshot>> getProductByCategory() async {
  //   var value = await _productCollectionRef.get();

  //   return value.docs;
  // }

}
