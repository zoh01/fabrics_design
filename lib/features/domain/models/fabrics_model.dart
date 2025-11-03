import 'package:fabrics_design/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

class FabricsModel {
  final String name, image, description, category;
  final double rating;
  final int review, price;
  List<Color> fColor;
  bool isCheck;

  FabricsModel({
    required this.name,
    required this.image,
    required this.description,
    required this.category,
    required this.rating,
    required this.review,
    required this.price,
    required this.fColor,
    required this.isCheck,
  });
}

List<FabricsModel> fabricsModel = [
  //id:1
  FabricsModel(
    name: "8 Star",
    image: ZohImageStrings.fabrics1,
    description: "",
    category: "Cashmere",
    rating: 4.9,
    review: 312,
    price: 8000,
    fColor: [
      Colors.black,
      Colors.blue,
      Colors.green
    ],
    isCheck: true,
  ),
  //id:2
  FabricsModel(
    name: "7 Star",
    image: ZohImageStrings.fabrics2,
    description: "",
    category: "American",
    rating: 4.9,
    review: 123,
    price: 7000,
    fColor: [
      Colors.black,
      Colors.blue,
      Colors.green
    ],
    isCheck: true,
  ),
  //id:3
  FabricsModel(
    name: "American",
    image: ZohImageStrings.fabrics3,
    description: "",
    category: "Italian",
    rating: 4.7,
    review: 263,
    price: 9500,
    fColor: [
      Colors.black,
      Colors.blue,
      Colors.green
    ],
    isCheck: true,
  ),
  //id:4
  FabricsModel(
    name: "German Wool",
    image: ZohImageStrings.fabrics4,
    description: "",
    category: "Wool",
    rating: 4.8,
    review: 208,
    price: 8000,
    fColor: [
      Colors.black,
      Colors.blue,
      Colors.green
    ],
    isCheck: true,
  ),
  //id:5
  FabricsModel(
    name: "Cashmere",
    image: ZohImageStrings.fabrics5,
    description: "",
    category: "Cashmere",
    rating: 4.8,
    review: 173,
    price: 9000,
    fColor: [
      Colors.black,
      Colors.blue,
      Colors.green
    ],
    isCheck: true,
  ),
  //id:6
  FabricsModel(
    name: "American",
    image: ZohImageStrings.fabrics6,
    description: "",
    category: "American",
    rating: 4.6,
    review: 184,
    price: 12000,
    fColor: [
      Colors.black,
      Colors.blue,
      Colors.green
    ],
    isCheck: true,
  ),
  //id:7
  FabricsModel(
    name: "10 Star",
    image: ZohImageStrings.fabrics7,
    description: "",
    category: "Italian",
    rating: 4.9,
    review: 192,
    price: 20000,
    fColor: [
      Colors.black,
      Colors.blue,
      Colors.green
    ],
    isCheck: true,
  ),
  //id:8
  FabricsModel(
    name: "American",
    image: ZohImageStrings.fabrics8,
    description: "",
    category: "Netlace",
    rating: 4.9,
    review: 102,
    price: 5000,
    fColor: [
      Colors.black,
      Colors.blue,
      Colors.green
    ],
    isCheck: true,
  ),
  //id:9
  FabricsModel(
    name: "Cashmere",
    image: ZohImageStrings.fabrics9,
    description: "",
    category: "Netlace",
    rating: 4.6,
    review: 123,
    price: 9000,
    fColor: [
      Colors.black,
      Colors.blue,
      Colors.green
    ],
    isCheck: true,
  ),
];

const myDesc1 = "Soft and luxurious fabrics";
const myDesc2 = " .Crafted from premium cutton for maximum comfort";
