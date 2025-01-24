import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'products_provider.dart';

class ProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Products'),
      ),
      body: productsProvider.products.isEmpty
          ? Center(child: Text('No products available.'))
          : ListView.builder(
        itemCount: productsProvider.products.length,
        itemBuilder: (context, index) {
          var product = productsProvider.products[index];
          return ListTile(
            leading: Image.network( product['imageUrl'],
            ),
            title: Text(product['title']),
            subtitle: Text('Price: ${product['price']} - Category: ${product['category']}'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                productsProvider.deleteProduct(product.id);
              },
            ),
          );
        },
      ),
    );
  }
}
