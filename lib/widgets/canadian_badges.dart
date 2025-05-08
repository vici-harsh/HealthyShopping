import 'package:flutter/material.dart';
import '../models/product.dart';

class CanadianBadges extends StatelessWidget {
  final Product product;

  const CanadianBadges({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        if (product.hasCanadaOrganic)
          _buildBadge(
            'images/badge/canada_organic.jpeg',
            'Canada Organic Certified',
          ),
        if (product.hasFoodlandOntario)
          _buildBadge(
            'images/badge/foodland_ontario.webp',
            'Foodland Ontario Certified',
          ),
        if (product.hasCanadaGAP)
          _buildBadge(
            'images/badge/canada_gap.png',
            'CanadaG.A.P. Certified',
          ),
        _buildBadge(
          'images/badge/canada.png',
          'Product of Canada',
        ),
      ],
    );
  }

  Widget _buildBadge(String imagePath, String tooltip) {
    return Tooltip(
      message: tooltip,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 3,
            ),
          ],
        ),
        child: Image.asset(
          imagePath,
          width: 40,
          height: 40,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}