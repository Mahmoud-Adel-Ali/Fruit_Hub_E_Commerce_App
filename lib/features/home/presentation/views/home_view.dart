import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/cubits/products/products_cubit.dart';
import '../../../../core/repos/products_repo/products_repo.dart';
import '../../../../core/services/service_locator.dart';
import 'widgets/home_view_app_bar.dart';
import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductsCubit>(
      create: (context) => ProductsCubit(getit.get<ProductsRepo>()),
      child: Scaffold(
        // Home View App Bar
        appBar: homeViewAppBar(),

        // Home View Body
        body: const HomeViewBody(),
      ),
    );
  }
}
