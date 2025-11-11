import 'package:fabrics_design/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';

class AddRemove extends StatelessWidget {
  const AddRemove({
    super.key,
    required this.onAdd,
    required this.onRemove,
    required this.currentNumber,
  });

  final VoidCallback onAdd;
  final VoidCallback onRemove;
  final int currentNumber;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Quantity",
          style: GoogleFonts.sora(
            fontWeight: FontWeight.w600,
            fontSize: ZohSizes.spaceBtwZoh,
            color: ZohColors.darkColor,
          ),
        ),
        const SizedBox(width: ZohSizes.md),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey,
            border: Border.all(color: ZohColors.secondaryColor.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(ZohSizes.sm),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              // ➖ Remove Button
              InkWell(
                onTap: onRemove,
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: ZohColors.white,
                    borderRadius: BorderRadius.circular(ZohSizes.sm)
                  ),
                  child: const Icon(
                    Iconsax.minus,
                    color: Colors.black,
                    size: 18,
                  ),
                ),
              ),

              // 🧮 Quantity Text
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: ZohSizes.spaceBtwZoh),
                child: Text(
                  currentNumber.toString(),
                  style: GoogleFonts.sora(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: ZohColors.darkColor,
                  ),
                ),
              ),

              // ➕ Add Button
              InkWell(
                onTap: onAdd,
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: ZohColors.black,
                    borderRadius: BorderRadius.circular(ZohSizes.sm)
                  ),
                  child: const Icon(
                    Iconsax.add,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
