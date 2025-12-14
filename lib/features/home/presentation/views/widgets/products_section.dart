import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/cubits/products/products_cubit.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/widgets/custom_section_header.dart';
import 'products_grid_view_bloc_builder.dart';

class ProductsSection extends StatelessWidget {
  const ProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    int productsLength = context.read<ProductsCubit>().productsLength;
    return Column(
      children: [
        CustomSectionHeader(
          title: "$productsLength نتائج",
          trilling: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.lightGrey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: SvgPicture.asset(Assets.imagesFilterIcon2),
          ),
          onPressed: () {},
        ),
        SizedBox(height: 8),
        ProductsGridViewBlocBuilder(),
      ],
    );
  }
}
