import 'package:fabrics_design/utils/constants/image_strings.dart';

import '../../../utils/constants/image_strings.dart';

class FabricsModel {
  final String image, name, discount;
  final double price;

  FabricsModel({
    required this.image,
    required this.name,
    required this.discount,
    required this.price,
  });
}

List<FabricsModel> fabricsModel = [
  FabricsModel(
    image: ZohImageStrings.fabrics3,
    name: 'American Wool',
    discount: "20",
    price: 13,
  ),
  FabricsModel(
    image: ZohImageStrings.fabrics1,
    name: 'Italian Wool',
    discount: "15",
    price: 13,
  ),
  FabricsModel(
    image: ZohImageStrings.fabrics8,
    name: 'German Wool',
    discount: "15",
    price: 13,
  ),
  FabricsModel(
    image: ZohImageStrings.fabrics4,
    name: 'American Wool',
    discount: "20",
    price: 13,
  ),
  FabricsModel(
    image: ZohImageStrings.fabrics5,
    name: 'Swiss Voile',
    discount: "15",
    price: 13,
  ),
  FabricsModel(
    image: ZohImageStrings.fabrics6,
    name: 'Italian Wool',
    discount: "15",
    price: 14,
  ),
  FabricsModel(
    image: ZohImageStrings.fabrics3,
    name: 'German Wool',
    discount: "15",
    price: 16,
  ),
];
