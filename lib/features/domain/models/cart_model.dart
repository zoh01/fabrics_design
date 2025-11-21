import 'package:fabrics_design/features/domain/models/fabrics_model.dart';

class CartModel {
  final FabricsModel fabricsModel;
  int quantity;

  CartModel({required this.fabricsModel, required this.quantity});
}
