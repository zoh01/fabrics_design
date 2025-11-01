import 'package:fabrics_design/utils/constants/image_strings.dart';

class FCategoryModel {
  final String name, image;
  FCategoryModel({required this.name, required this.image});
}

List<FCategoryModel> fCategoryModel = [
  FCategoryModel(name: 'American', image: ZohImageStrings.american),
  FCategoryModel(name: 'Italian', image: ZohImageStrings.italian),
  FCategoryModel(name: 'Wool', image: ZohImageStrings.wool),
  FCategoryModel(name: 'NetLace', image: ZohImageStrings.lace),
  FCategoryModel(name: 'Cashmere', image: ZohImageStrings.black),
];