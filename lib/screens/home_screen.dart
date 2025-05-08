import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';
import '../widgets/responsive_layout.dart';
import 'cart_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> vegetables = [
      Product(
        id: '1',
        name: 'Ontario Greenhouse Tomatoes',
        description: 'Vine-ripened tomatoes grown in state-of-the-art Ontario greenhouses using sustainable energy.',
        price: 3.49,
        imageUrl: 'assets/images/vegetables/Tomato.jpg',
        unit: 'lb',
        category: 'Fresh',
        origin: 'Leamington, ON',
        variety: 'Beefsteak',
        size: '7-9cm diameter',
        nutrition: {
          'Calories': '18 kcal|1%',
          'Protein': '0.9g|2%',
          'Vitamin C': '14mg|23%',
          'Potassium': '237mg|5%',
          'Fiber': '1.2g|4%'
        },
        hasCanadaOrganic: true,
        hasFoodlandOntario: true,
        hasCanadaGAP: false,
        growerProfileUrl: 'https://ontariogreenhouse.com/growers/leamington',
        foodTraceabilityCode: 'ON-TOM-2023-001',
        packaging: {
          'type': 'Compostable container',
          'details': '100% recyclable materials'
        },
        servingSuggestions: [
          'Canada Food Guide recommended servings',
          'Perfect for peameal bacon sandwiches',
          'Ideal for caprese salad'
        ],
        supplyChain: {
          'harvest': 'Morning of delivery',
          'food_miles': '32km to Toronto'
        },
        seasonality: 'Year-round (peak June-Oct)',
        allergens: {
          'Gluten-Free': true,
          'Dairy-Free': true,
          'Nut-Free': true
        },
      ),
      Product(
        id: '2',
        name: 'Ontario Bell Peppers',
        description: 'Sweet, crisp peppers grown in nutrient-rich soil with minimal pesticide use.',
        price: 2.99,
        imageUrl: 'assets/images/vegetables/bell pepper.jpeg',
        unit: 'each',
        category: 'Fresh',
        origin: 'Norfolk County, ON',
        variety: 'Red Bell',
        size: 'Large (10-12cm)',
        nutrition: {
          'Calories': '31 kcal|2%',
          'Protein': '1g|2%',
          'Vitamin C': '127mg|211%',
          'Vitamin A': '3131 IU|63%',
          'Fiber': '2.1g|8%'
        },
        hasCanadaOrganic: false,
        hasFoodlandOntario: true,
        hasCanadaGAP: true,
        growerProfileUrl: 'https://ontariovegetables.com/norfolk',
        foodTraceabilityCode: 'ON-BP-2023-045',
        packaging: {
          'type': 'Recycled plastic clamshell',
          'details': 'Made with 30% post-consumer materials'
        },
        servingSuggestions: [
          'Great for stir-fries',
          'Perfect for stuffed peppers',
          'Excellent raw with dip'
        ],
        supplyChain: {
          'harvest': 'Within 24 hours of delivery',
          'food_miles': '150km to Toronto'
        },
        seasonality: 'July-October',
        allergens: {
          'Gluten-Free': true,
          'Dairy-Free': true,
          'Nut-Free': true
        },
      ),
      Product(
        id: '3',
        name: 'Alberta Carrots',
        description: 'Sweet, crunchy carrots grown in mineral-rich Alberta soil.',
        price: 1.99,
        imageUrl: 'assets/images/vegetables/Carrot.jpg',
        unit: 'bunch',
        category: 'Fresh',
        origin: 'Brooks, AB',
        variety: 'Nantes',
        size: '20-22cm length',
        nutrition: {
          'Calories': '41 kcal|2%',
          'Protein': '0.9g|2%',
          'Vitamin A': '16706 IU|334%',
          'Vitamin K': '13.2mcg|16%',
          'Fiber': '2.8g|11%'
        },
        hasCanadaOrganic: true,
        hasFoodlandOntario: false,
        hasCanadaGAP: true,
        growerProfileUrl: 'https://albertaproduce.ca/brooks-farms',
        foodTraceabilityCode: 'AB-CAR-2023-112',
        packaging: {
          'type': 'Biodegradable band',
          'details': 'Compostable within 90 days'
        },
        servingSuggestions: [
          'Perfect for juicing',
          'Great in stews',
          'Excellent roasted'
        ],
        supplyChain: {
          'harvest': 'Within 48 hours of delivery',
          'food_miles': '2800km to Toronto'
        },
        seasonality: 'June-November',
        allergens: {
          'Gluten-Free': true,
          'Dairy-Free': true,
          'Nut-Free': true
        },
      ),
      Product(
        id: '4',
        name: 'BC Spinach',
        description: 'Tender baby spinach leaves, triple-washed and ready to eat.',
        price: 4.49,
        imageUrl: 'assets/images/vegetables/Spinach.jpeg',
        unit: '200g',
        category: 'Fresh',
        origin: 'Richmond, BC',
        variety: 'Baby Leaf',
        size: 'Small leaves (3-5cm)',
        nutrition: {
          'Calories': '23 kcal|1%',
          'Protein': '2.9g|6%',
          'Vitamin K': '483mcg|604%',
          'Iron': '2.7mg|15%',
          'Folate': '194mcg|49%'
        },
        hasCanadaOrganic: false,
        hasFoodlandOntario: false,
        hasCanadaGAP: true,
        growerProfileUrl: 'https://bcgreenhouse.ca/richmond-farms',
        foodTraceabilityCode: 'BC-SPI-2023-078',
        packaging: {
          'type': 'Resealable plastic bag',
          'details': 'Recyclable #4 plastic'
        },
        servingSuggestions: [
          'Perfect for salads',
          'Great in smoothies',
          'Excellent sautéed with garlic'
        ],
        supplyChain: {
          'harvest': 'Within 12 hours of packaging',
          'food_miles': '3400km to Toronto'
        },
        seasonality: 'Year-round',
        allergens: {
          'Gluten-Free': true,
          'Dairy-Free': true,
          'Nut-Free': true
        },
      ),
      Product(
        id: '5',
        name: 'Manitoba Potatoes',
        description: 'Russet potatoes perfect for baking, with fluffy texture when cooked.',
        price: 5.99,
        imageUrl: 'assets/images/vegetables/potatoes.jpeg',
        unit: '5lb bag',
        category: 'Fresh',
        origin: 'Portage la Prairie, MB',
        variety: 'Russet',
        size: 'Size A (150-200g each)',
        nutrition: {
          'Calories': '77 kcal|4%',
          'Protein': '2g|4%',
          'Potassium': '421mg|12%',
          'Vitamin B6': '0.3mg|14%',
          'Fiber': '2.2g|9%'
        },
        hasCanadaOrganic: true,
        hasFoodlandOntario: false,
        hasCanadaGAP: true,
        growerProfileUrl: 'https://manitobapotatoes.ca/portage-farms',
        foodTraceabilityCode: 'MB-POT-2023-201',
        packaging: {
          'type': 'Paper bag',
          'details': '100% recycled content'
        },
        servingSuggestions: [
          'Perfect for baking',
          'Great for mashed potatoes',
          'Excellent for potato pancakes'
        ],
        supplyChain: {
          'harvest': 'Within 1 week of delivery',
          'food_miles': '1800km to Toronto'
        },
        seasonality: 'August-March (stored)',
        allergens: {
          'Gluten-Free': true,
          'Dairy-Free': true,
          'Nut-Free': true
        },
      ),
      Product(
        id: '6',
        name: 'Quebec Broccoli',
        description: 'Fresh-picked broccoli with tight florets and crisp stems.',
        price: 2.49,
        imageUrl: 'assets/images/vegetables/broccoli.jpg',
        unit: 'each',
        category: 'Fresh',
        origin: 'Montérégie, QC',
        variety: 'Belstar',
        size: 'Medium (400-500g)',
        nutrition: {
          'Calories': '34 kcal|2%',
          'Protein': '2.8g|6%',
          'Vitamin C': '89.2mg|149%',
          'Vitamin K': '102mcg|127%',
          'Folate': '63mcg|16%'
        },
        hasCanadaOrganic: false,
        hasFoodlandOntario: false,
        hasCanadaGAP: true,
        growerProfileUrl: 'https://quebecvegetables.com/monteregie',
        foodTraceabilityCode: 'QC-BRO-2023-156',
        packaging: {
          'type': 'No packaging - loose',
          'details': 'Sold unwrapped to reduce waste'
        },
        servingSuggestions: [
          'Perfect steamed with lemon',
          'Great in stir-fries',
          'Excellent roasted with olive oil'
        ],
        supplyChain: {
          'harvest': 'Within 24 hours of delivery',
          'food_miles': '500km to Toronto'
        },
        seasonality: 'June-October',
        allergens: {
          'Gluten-Free': true,
          'Dairy-Free': true,
          'Nut-Free': true
        },
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Fresh Canadian Veggies'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CartScreen()),
            ),
          ),
        ],
      ),
      body: ResponsiveLayout(
        mobile: ProductGrid(vegetables: vegetables, crossAxisCount: 2),
        tablet: ProductGrid(vegetables: vegetables, crossAxisCount: 3),
        desktop: ProductGrid(vegetables: vegetables, crossAxisCount: 4),
      ),
    );
  }
}

class ProductGrid extends StatelessWidget {
  final List<Product> vegetables;
  final int crossAxisCount;

  const ProductGrid({
    super.key,
    required this.vegetables,
    required this.crossAxisCount,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: 3/4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: vegetables.length,
      itemBuilder: (ctx, index) => ProductCard(product: vegetables[index]),
    );
  }
}