import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/cubits/products/products_cubit.dart';
import '../../../../../core/helper_functions/get_dummy_product.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../../home/presentation/views/widgets/products_grid_view.dart';

class ProductsGridViewBlocBuilder extends StatelessWidget {
  const ProductsGridViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          return ProductsGridView(products: state.products);
        } else if (state is ProductsFailure) {
          return CustomErrorWidget(
            msg: state.message,
            onRetry: () {
              context.read<ProductsCubit>().getProducts();
            },
          );
        } else {
          //* Loading state
          return Skeletonizer(
            enabled: true,
            child: ProductsGridView(products: dummyProducts),
          );
        }
      },
    );
  }
}
