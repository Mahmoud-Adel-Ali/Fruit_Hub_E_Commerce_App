import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_section_header.dart';
import 'products_grid_view_bloc_builder.dart';

class ProductsSection extends StatelessWidget {
  const ProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSectionHeader(
          title: "الاكثر مبيعا",
          trilling: Text("المزيد", style: AppTextStyles.semiBold13),
          onPressed: () {
          },
        ),
        SizedBox(height: 8),
        ProductsGridViewBlocBuilder(),
      ],
    );
  }
}
