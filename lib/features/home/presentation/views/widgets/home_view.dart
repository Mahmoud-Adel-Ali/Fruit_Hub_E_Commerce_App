import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/cubits/products/products_cubit.dart';
import '../../../../../core/repos/products_repo/products_repo.dart';
import '../../../../../core/services/service_locator.dart';
import 'home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductsCubit>(
      create: (context) => ProductsCubit(getit.get<ProductsRepo>()),
      child: const HomeViewBody(),
    );
  }
}
