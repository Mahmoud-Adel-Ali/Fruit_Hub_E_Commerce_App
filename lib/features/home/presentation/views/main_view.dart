import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/cubits/best_products/best_products_cubit.dart';
import '../../../../core/cubits/products/products_cubit.dart';
import '../../../../core/repos/products_repo/products_repo.dart';
import '../../../../core/services/service_locator.dart';
import 'home_view.dart';
import 'products_view.dart';
import 'widgets/custom_bottom_navigation_bar.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});
  static const routeName = 'home_view';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductsCubit>(
          create: (context) => ProductsCubit(getit.get<ProductsRepo>()),
        ),
        BlocProvider<BestProductsCubit>(
          create: (context) => BestProductsCubit(getit.get<ProductsRepo>()),
        ),
      ],
      child: const MainViewBody(),
    );
  }
}

class MainViewBody extends StatefulWidget {
  const MainViewBody({super.key});

  @override
  State<MainViewBody> createState() => _MainViewBodyState();
}

class _MainViewBodyState extends State<MainViewBody> {
  //*__________________________________________________________

  @override
  void initState() {
    super.initState();
    context.read<ProductsCubit>().getProducts();
    context.read<BestProductsCubit>().getBestSellingProducts();
  }

  //*__________________________________________________________

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Home View Body
      body: IndexedStack(
        index: currentIndex,
        children: [
          const HomeView(), // Home View
          const ProductsView(), // Products View
          const HomeView(), // Cart View
          const HomeView(), // Profile View
        ],
      ),
      // custom bottom navigation bar
      bottomNavigationBar: CustomBottomNavigationBar(
        onItemTapped: (index) {
          currentIndex = index;
          setState(() {});
        },
      ),
    );
  }
}
