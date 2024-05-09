import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tjclient/model/product/product.dart';

class HomeController extends GetxController{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference productCollection;

  List<Products> productList =[];
  List<Products> productShowInUI =[];

  @override
  Future<void> onInit() async {
    productCollection = firestore.collection('products');
    await fetchProducts();
    super.onInit();
  }
  fetchProducts() async{
    try {
      QuerySnapshot productSnapshot = await productCollection.get();
      final List<Products> retrievedProducts = productSnapshot.docs.map((doc) =>
          Products.fromJson(doc.data() as Map<String, dynamic>)).toList();
      productList.clear();
      productList.assignAll(retrievedProducts);
      productShowInUI.assignAll(productList);
    }catch(e){
      print(e);
    }finally{
      update();

    }
  }

  filterByMetal(List<String> metal){
    if(metal.isEmpty){
      productShowInUI = productList;
    }else{
      List<String> lowercaseMetal = metal.map((e) => e.toLowerCase()).toList();
      productShowInUI = productList.where((element) => lowercaseMetal.contains(element.material.toLowerCase())).toList();

    }

    update();
  }


  sortByPrice({required bool ascending}){
    List<Products> sortedProducts = List<Products>.from(productShowInUI);
    sortedProducts.sort((a,b) => ascending ? a.price.compareTo(b.price) : b.price.compareTo(a.price) );
    productShowInUI = sortedProducts;
    update();
  }

}