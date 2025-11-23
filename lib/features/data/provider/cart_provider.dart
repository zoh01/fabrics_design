import 'package:fabrics_design/features/domain/models/cart_model.dart';
import 'package:fabrics_design/features/domain/models/fabrics_model.dart';
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  // private list _carts to store cart items, each represented by a CartModel
  List<CartModel> _carts = [];

  // getter for _Carts to access the list of cart items
  List<CartModel> get carts => _carts;

  // setter for _carts. updates the cart list and notifies listeners when it changes.
  set carts(List<CartModel> carts) {
    _carts = carts;
    notifyListeners(); // Notifies any widget listening to this provider to rebuild.
  }

  //  adds a product to the cart.
  addCart(FabricsModel fabricsModel) {
    if (fabricsExist(fabricsModel)) {
      // find the index of the product in the cart
      int index = _carts.indexWhere(
        (element) => element.fabricsModel == fabricsModel,
      );
      // increments the quantity of the product by 1 if it already exists.
      _carts[index].quantity = _carts[index].quantity + 1;
    } else {
      // add a new CartModel item with quantity 1 if the product doesn't exist in the cart
      _carts.add(CartModel(fabricsModel: fabricsModel, quantity: 1));
    }
    notifyListeners(); // update
  }

  //increase the quantity of a specific product in the cart by 1,
  addQuantity(FabricsModel fabrics) {
    // finds the index of the product in the cart.
    int index = _carts.indexWhere((element) => element.fabricsModel == fabrics);
    // increments the quantity by 1.
    _carts[index].quantity = _carts[index].quantity + 1;
    notifyListeners(); // Update the quantity change
  }

  // Decreases the quantity of a specific product in the cart by 1.
  reduceQuantity(FabricsModel fabrics) {
    // find the index of the product in the cart
    int index = _carts.indexWhere(
      (elements) => elements.fabricsModel == fabrics,
    );
    // decrease the quantity by 1.
    _carts[index].quantity = _carts[index].quantity - 1;
    notifyListeners(); // Update the quantity change
  }

  // Remove Fabrics from cart screen
  void removeFromCart(FabricsModel fabrics) {
    _carts.removeWhere((element) => element.fabricsModel == fabrics);
    notifyListeners();
  }

  // Check if a product already exists in the cart.
// return true if the product is in the cart, false otherwise
  fabricsExist(FabricsModel fabricsModel) {
    if (_carts.indexWhere((element) => element.fabricsModel == fabricsModel) == -1) {
      return false;
    } else {
      return true;
    }
}
// calculates the total price of all items in the cart
double totalCart(){
    double total = 0; // Initialize the total to 0
  for(var i = 0; i<_carts.length;i++){
    // adds the price for each cart item (quantity)
    total = total +_carts[i].quantity*_carts[i].fabricsModel.price;
  }
  return total;  // Returns the total price of all cart items.
}
}
