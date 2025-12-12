import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/cubits/products/products_cubit.dart';
import '../../../../../core/helper_functions/get_dummy_product.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import 'best_selling_grid_view.dart';

class BestSellingGridViewBlocBuilder extends StatelessWidget {
  const BestSellingGridViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          return BestSellingGridView(products: state.products);
        } else if (state is ProductsFailure) {
          return CustomErrorWidget(msg: state.message);
        } else {
          //* Loading state
          return Skeletonizer(
            enabled: true,
            child: BestSellingGridView(products: dummyProducts),
          );
        }
      },
    );
  }
}
