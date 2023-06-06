import 'package:flutter/material.dart';
import 'package:projetomobile/datas/product_data.dart';

class ProductTile extends StatelessWidget {
  final String type;
  final ProductData product;

  const ProductTile(this.type, this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: type == "grid"
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: 0.8,
                    child: Image.network(
                      product.images[0],
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Text(
                            product.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "R\$ ${product.price.toStringAsFixed(2)}",
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            : const Row(),
      ),
    );
  }
}
