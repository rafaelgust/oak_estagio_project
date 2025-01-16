import 'package:flutter/material.dart';
import 'package:oak_estagio_project/src/controllers/product_controller.dart';
import 'package:oak_estagio_project/src/views/widgets/product_list.dart';
import 'package:oak_estagio_project/src/views/widgets/register_product.dart';

import '../models/product_model.dart';
import 'widgets/edit_product.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.title});

  final String title;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ProductController _controller = ProductController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  late AlertDialog insertDialog = AlertDialog(
    title: Text("Cadastro de Produto"),
    content: RegisterProduct(
      onSave: (product) {
        _controller.insertProduct(product);
        Navigator.pop(context);
      },
    ),
    actions: [
      TextButton(
        onPressed: () {
          if (!mounted) return;
          Navigator.pop(context);
        },
        child: Text("Fechar"),
      ),
    ],
  );

  void _openInsert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return insertDialog;
      },
    );
  }

  void _openDialogChangeProduct(ProductModel product) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Editar Produto"),
          content: EditProduct(
            product: product,
            onSave: (product) {
              _controller.updateProduct(product);
              Navigator.pop(context);
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (!mounted) return;
                Navigator.pop(context);
              },
              child: Text("Fechar"),
            ),
          ],
        );
      },
    );
  }

  void _removeProduct(ProductModel product) {
    _controller.removeProduct(product);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, snapshot) {
          return ProductList(
            products: _controller.products,
            fnRemoveProduct: _removeProduct,
            fnEditProduct: _openDialogChangeProduct,
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _openInsert,
        tooltip: 'Adicionar',
        label: Row(
          spacing: 4.0,
          children: [
            const Icon(Icons.add),
            Text('Adicionar Produto'),
          ],
        ),
      ),
    );
  }
}
