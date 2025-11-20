import 'package:fabrics_design/features/domain/common/fabrics_details/fabrics_details.dart';
import 'package:fabrics_design/features/domain/models/category_model.dart';
import 'package:fabrics_design/features/domain/models/fabrics_model.dart';
import 'package:fabrics_design/features/presentation/screens/category_fabrics/widgets/category_card.dart';
import 'package:fabrics_design/utils/constants/colors.dart';
import 'package:fabrics_design/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CategoryFabrics extends StatelessWidget {
  final String category;
  final List<FabricsModel> categoryFabrics;

  const CategoryFabrics({
    super.key,
    required this.category,
    required this.categoryFabrics,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: ZohSizes.md),
        // ---------- TOP BAR (Back + Search) ----------
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: ZohSizes.md),
          child: Row(
            children: [
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 18,
                    color: Colors.black87,
                  ),
                ),
              ),

              const SizedBox(width: ZohSizes.md),

              // Search Field
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "$category Fabrics",
                      hintStyle: const TextStyle(color: Colors.black38),
                      prefixIcon: const Icon(
                        Icons.search_rounded,
                        color: Colors.black54,
                        size: 24,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 15,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: ZohSizes.lg),

        // ---------- FILTERS ----------
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: ZohSizes.md),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                filterCategory.length,
                    (index) {
                  final isActive = index == 0;
                  return Padding(
                    padding: EdgeInsets.only(right: ZohSizes.sm),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: ZohSizes.md,
                        vertical: ZohSizes.xs,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: isActive ? ZohColors.primaryColor : Colors.white,
                        border: Border.all(
                          color: isActive
                              ? ZohColors.primaryColor
                              : Colors.black.withOpacity(0.2),
                        ),
                        boxShadow: [
                          if (isActive)
                            BoxShadow(
                              color: ZohColors.primaryColor.withOpacity(.3),
                              blurRadius: 12,
                              offset: Offset(0, 4),
                            ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Text(
                            filterCategory[index],
                            style: TextStyle(
                              color: isActive ? Colors.white : Colors.black87,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: ZohSizes.xs),
                          Icon(
                            isActive
                                ? Icons.filter_alt_rounded
                                : Icons.keyboard_arrow_down_rounded,
                            size: 18,
                            color: isActive ? Colors.white : Colors.black87,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),

        const SizedBox(height: ZohSizes.lg),

        // ---------- GRID ----------
        Expanded(
          child: categoryFabrics.isEmpty
              ? const Center(
            child: Text(
              "No Items Available in this category",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          )
              : Padding(
            padding: const EdgeInsets.symmetric(horizontal: ZohSizes.sm),
            child: GridView.builder(
              itemCount: categoryFabrics.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.61,
                crossAxisSpacing: ZohSizes.md,
                mainAxisSpacing: ZohSizes.iconXs,
              ),
              itemBuilder: (context, index) {
                final fabrics = categoryFabrics[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            FabricsDetails(fabricsDetails: fabrics),
                      ),
                    );
                  },
                  child: CategoryCard(fabrics: fabrics),
                );
              },
            ),
          ),
        ),
      ],
    ),
    ),
    );
  }
}
