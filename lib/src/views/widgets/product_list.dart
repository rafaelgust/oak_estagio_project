import 'package:flutter/material.dart';
import 'package:oak_estagio_project/src/models/product_model.dart';
import 'package:oak_estagio_project/src/views/widgets/product_widget.dart';

class ProductList extends StatelessWidget {
  final List<ProductModel> products;
  final void Function(ProductModel) fnEditProduct;
  final void Function(ProductModel) fnRemoveProduct;

  const ProductList({
    super.key,
    required this.products,
    required this.fnEditProduct,
    required this.fnRemoveProduct,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductWidget(
          product: products[index],
          onEdit: () => fnEditProduct(products[index]),
          onDelete: () => fnRemoveProduct(products[index]),
        );
      },
    );
  }
}
