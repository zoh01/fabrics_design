import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class CheckoutRow extends StatelessWidget {
  final String title, value;

  const CheckoutRow({super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: GoogleFonts.robotoCondensed(
            fontWeight: FontWeight.w600,
            fontSize: ZohSizes.md,
          ),
        ),

        SizedBox(width: ZohSizes.md),

        /// dotted separator
        Expanded(
          child: DottedLine(
            dashLength: 6,
            dashGapLength: 4,
            lineThickness: 1.2,
            dashColor: ZohColors.primaryOpacity,
          ),
        ),

        SizedBox(width: ZohSizes.md),

        Text(
          value,
          style: GoogleFonts.robotoCondensed(
            fontWeight: FontWeight.bold,
            fontSize: ZohSizes.md,
          ),
        ),
      ],
    );
  }
}