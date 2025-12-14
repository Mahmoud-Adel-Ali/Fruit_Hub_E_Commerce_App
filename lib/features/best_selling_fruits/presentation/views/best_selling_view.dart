import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/cubits/best_products/best_products_cubit.dart';
import '../../../../core/repos/products_repo/products_repo.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import 'best_selling_view_body.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});
  static const String routeName = 'best_selling_view';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BestProductsCubit>(
      create: (context) => BestProductsCubit(getit.get<ProductsRepo>()),
      child: Scaffold(
        appBar: customAppBar(context, title: 'الأكثر مبيعًا'),
        body: BestSellingViewBody(),
      ),
    );
  }
}
