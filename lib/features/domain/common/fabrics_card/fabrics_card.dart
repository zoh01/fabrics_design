import 'package:fabrics_design/features/domain/models/fabrics_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/helper_functions/helper_functions.dart';
import '../fabrics_details/fabrics_details.dart';

class FabricsCard extends StatefulWidget {
  final FabricsModel fabricsItems;
  const FabricsCard({super.key, required this.fabricsItems});

  @override
  State<FabricsCard> createState() => _FabricsCardState();
}

class _FabricsCardState extends State<FabricsCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final fabrics = widget.fabricsItems;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => FabricsDetails(fabricsDetails: fabrics),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              Colors.white.withOpacity(0.8),
              Colors.grey.shade200.withOpacity(0.6),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: ZohColors.darkColor.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🖼️ Image Section
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                  child: Image.asset(
                    fabrics.image,
                    width: double.infinity,
                    height: ZohHelperFunctions.screenHeight() * 0.22,
                    fit: BoxFit.cover,
                  ),
                ),

                // 💰 Discount Tag
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: ZohColors.secondaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      "-${fabrics.discount}%",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                // ❤️ Favorite Icon
                Positioned(
                  top: 10,
                  right: 10,
                  child: InkWell(
                    onTap: () => setState(() => isFavorite = !isFavorite),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.redAccent : ZohColors.darkColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // 🧵 Fabric Info
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fabrics.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: ZohColors.darkColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.star, color: ZohColors.secondaryColor, size: 18),
                      const SizedBox(width: 3),
                      Text(
                        fabrics.rating.toStringAsFixed(1),
                        style: GoogleFonts.inter(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        "(${fabrics.review} reviews)",
                        style: GoogleFonts.inter(
                          color: Colors.grey.shade600,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // 💸 Price and Add Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "#${fabrics.price.toStringAsFixed(0)}",
                        style: GoogleFonts.sora(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: ZohColors.primaryColor,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: ZohColors.primaryColor,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(Icons.add, color: Colors.white, size: 20),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
