import 'package:flutter/material.dart';
import 'package:tiendabeta/store_product.dart';

enum StoreState {
  normal,
  details,
  cart,
}

class Storebloc with ChangeNotifier {
  StoreState storeState = StoreState.normal;
  List<StoreProduct> catalog = List.unmodifiable(storeProducts);
  List<StoreProductItem> cart = [];
  void changeToNormal() {
    storeState = StoreState.normal;
    notifyListeners();
  }
  void changeToCart() {
    storeState = StoreState.cart;
    notifyListeners();
  }

  void  deleteProduct (StoreProductItem productItem){
    cart.remove(productItem);
    notifyListeners();
  }

  void  addProduct (StoreProduct product){
    for (StoreProductItem item in cart) {
      if (item.product.name == product.name){
        item.incrmeent();
        notifyListeners();
        return;
      }
    }
    cart.add(StoreProductItem(product: product),);
    notifyListeners();
  }

  int totalCartElements() => cart.fold<int>(0,(previousValue,element) => previousValue + element.quantity);

  double totalPriceElements() => cart!.fold<double>(0.0,(previousValue,element) => previousValue + (element.quantity * element.product.price));

}


class StoreProductItem {
  StoreProductItem({this.quantity = 1,required this.product});
  int quantity;
  final StoreProduct product;

  void incrmeent() {
    quantity++;
  }
  void decrement() {}

}