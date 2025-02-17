import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/features/main_user_screen/presentation/cubit/product_cubit.dart';
import 'package:my_app/features/main_user_screen/presentation/cubit/product_states.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductInitial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductLoaded) {
            return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final product = state.products[index];
                return ListTile(
                  title: Text(
                    product.title,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    product.description,
                    overflow: TextOverflow.ellipsis,
                  ),
                  leading: CircleAvatar(
                    radius: 30,
                    child: Text(
                      product.price.toString(),
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text('Error'));
          }
        },
      ),
    );
  }
}
