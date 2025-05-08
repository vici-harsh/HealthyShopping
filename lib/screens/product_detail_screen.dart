import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../models/cart_item.dart';
import '../providers/cart_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'product-${product.id}',
              child: Image.asset(
                product.imageUrl,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey[200],
                  child: const Icon(Icons.food_bank, size: 100),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${product.price.toStringAsFixed(2)} / ${product.unit}',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      Chip(
                        label: Text(product.origin),
                        avatar: const Icon(Icons.location_pin, size: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 12,
                    runSpacing: 8,
                    children: [
                      if (product.hasCanadaOrganic)
                        _buildBadge(
                          'assets/images/badge/canada_organic.jpeg',
                          'Canada Organic Certified',
                          Icons.eco,
                        ),
                      if (product.hasFoodlandOntario)
                        _buildBadge(
                          'assets/images/badge/foodland_logo.webp',
                          'Ontario Certified',
                          Icons.local_florist,
                        ),
                      _buildBadge(
                        'assets/images/badge/canada.png',
                        'Product of Canada',
                        Icons.flag,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Divider(height: 1, thickness: 1),

            _buildSection(context, 'Description', product.description),
            _buildSection(context, 'Variety & Size', '${product.variety}\nSize: ${product.size}'),
            _buildNutritionSection(context),

            if (product.hasCanadaOrganic || product.hasFoodlandOntario)
              _buildSection(
                context,
                'Certifications',
                '${product.hasCanadaOrganic ? '• Canada Organic Certified\n' : ''}'
                    '${product.hasFoodlandOntario ? '• Ontario Certified' : ''}',
              ),

            _buildSection(
              context,
              'Packaging',
              '${product.packaging['type']}\n${product.packaging['details']}',
            ),
            _buildSection(
              context,
              'Serving Suggestions',
              product.servingSuggestions.map((s) => '• $s').join('\n'),
            ),
            _buildSection(
              context,
              'Traceability',
              'Code: ${product.foodTraceabilityCode}',
            ),
            _buildSection(context, 'Seasonality', product.seasonality),
            _buildAllergenSection(context),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Consumer<CartProvider>(
                builder: (context, cart, _) {
                  final cartItem = cart.items.cast<CartItem?>().firstWhere(
                        (item) => item?.productId == product.id,
                    orElse: () => null,
                  );

                  if (cartItem != null) {
                    return _buildQuantityControls(cart, cartItem);
                  } else {
                    return ElevatedButton(
                      onPressed: () {
                        cart.addItem(product);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Added ${product.name} to cart'),
                            duration: const Duration(seconds: 1),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: const Text('Add to Cart'),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBadge(String imagePath, String tooltip, IconData fallbackIcon) {
    return Tooltip(
      message: tooltip,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(50),
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Image.asset(
          imagePath,
          width: 40,
          height: 40,
          errorBuilder: (context, error, stackTrace) => Container(
            color: Colors.grey[200],
            child: Icon(fallbackIcon, size: 30, color: Colors.black54),
          ),
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.green[800],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const Divider(height: 24, thickness: 1),
        ],
      ),
    );
  }

  Widget _buildNutritionSection(BuildContext context) {
    final nutritionRows = product.nutrition.entries.map((e) => TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(e.key),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(e.value.split('|')[0]),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(e.value.split('|')[1]),
        ),
      ],
    )).toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Nutritional Value (per 100g)',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.green[800],
            ),
          ),
          const SizedBox(height: 8),
          Table(
            columnWidths: const {
              0: FlexColumnWidth(2),
              1: FlexColumnWidth(1.5),
              2: FlexColumnWidth(1),
            },
            border: TableBorder(
              horizontalInside: BorderSide(color: Colors.grey.withAlpha(128)),
            ),
            children: [
              const TableRow(
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey)),
                ),
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Text('Nutrient', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Text('Amount', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Text('%DV', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              ...nutritionRows,
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAllergenSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Allergen Information',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.green[800],
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: product.allergens.entries.map((e) => Chip(
              label: Text(e.key),
              backgroundColor: e.value ? Colors.green[50] : Colors.red[50],
              side: BorderSide(
                color: e.value ? Colors.green : Colors.red,
                width: 1,
              ),
            )).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildQuantityControls(CartProvider cart, CartItem item) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: () {
            if (item.quantity > 1) {
              cart.updateQuantity(item.productId, item.quantity - 1);
            } else {
              cart.removeItem(item.productId);
            }
          },
        ),
        Container(
          width: 40,
          alignment: Alignment.center,
          child: Text(
            item.quantity.toString(),
            style: const TextStyle(fontSize: 18),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () => cart.updateQuantity(item.productId, item.quantity + 1),
        ),
      ],
    );
  }
}