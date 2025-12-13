import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_section_header.dart';
import '../best_selling_view.dart';
import 'best_selling_grid_view_bloc_builder.dart';

class BestSellingSection extends StatelessWidget {
  const BestSellingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSectionHeader(
          title: "الاكثر مبيعا",
          trilling: Text("المزيد", style: AppTextStyles.semiBold13),
          onPressed: () {
            Navigator.pushNamed(context, BestSellingView.routeName);
          },
        ),
        SizedBox(height: 8),
        BestSellingGridViewBlocBuilder(),
      ],
    );
  }
}
