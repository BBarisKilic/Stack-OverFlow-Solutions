import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/home_view_model.dart';
import 'widgets/product_item.dart';

class ProductView extends StatefulWidget {
  const ProductView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HomeViewModel>(context, listen: false).getProducts();
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const Text('New Arrivals'),
              const SizedBox(height: 10),
              Expanded(
                child: Consumer<HomeViewModel>(
                  builder: (_, model, __) {
                    if (model.state == ViewState.idle) {
                      return const Center(
                        child: CircularProgressIndicator(color: Colors.black),
                      );
                    }
                    if (model.products.isEmpty) {
                      return const Center(
                        child: CircularProgressIndicator(color: Colors.black),
                      );
                    }

                    return GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 0.75,
                      ),
                      itemBuilder: (context, index) =>
                          ProductItem(product: model.products[index]),
                      itemCount: model.products.length,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
}
