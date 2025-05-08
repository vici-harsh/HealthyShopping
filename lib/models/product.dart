class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String unit;
  final String category;
  final String origin;
  final String variety;
  final String size;
  final Map<String, String> nutrition;
  final bool hasCanadaOrganic;
  final bool hasFoodlandOntario;
  final bool hasCanadaGAP;
  final String growerProfileUrl;
  final String foodTraceabilityCode;
  final Map<String, String> packaging;
  final List<String> servingSuggestions;
  final Map<String, String> supplyChain;
  final String seasonality;
  final Map<String, bool> allergens;
  final Map<String, dynamic>? nutrients; // Keeping your original optional field

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.unit,
    required this.origin,
    required this.variety,
    required this.size,
    required this.nutrition,
    required this.hasCanadaOrganic,
    required this.hasFoodlandOntario,
    required this.hasCanadaGAP,
    required this.growerProfileUrl,
    required this.foodTraceabilityCode,
    required this.packaging,
    required this.servingSuggestions,
    required this.supplyChain,
    required this.seasonality,
    required this.allergens,
    this.category = 'fresh',
    this.nutrients,
  });

  Product copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    String? imageUrl,
    String? unit,
    String? category,
    String? origin,
    String? variety,
    String? size,
    Map<String, String>? nutrition,
    bool? hasCanadaOrganic,
    bool? hasFoodlandOntario,
    bool? hasCanadaGAP,
    String? growerProfileUrl,
    String? foodTraceabilityCode,
    Map<String, String>? packaging,
    List<String>? servingSuggestions,
    Map<String, String>? supplyChain,
    String? seasonality,
    Map<String, bool>? allergens,
    Map<String, dynamic>? nutrients,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      unit: unit ?? this.unit,
      category: category ?? this.category,
      origin: origin ?? this.origin,
      variety: variety ?? this.variety,
      size: size ?? this.size,
      nutrition: nutrition ?? this.nutrition,
      hasCanadaOrganic: hasCanadaOrganic ?? this.hasCanadaOrganic,
      hasFoodlandOntario: hasFoodlandOntario ?? this.hasFoodlandOntario,
      hasCanadaGAP: hasCanadaGAP ?? this.hasCanadaGAP,
      growerProfileUrl: growerProfileUrl ?? this.growerProfileUrl,
      foodTraceabilityCode: foodTraceabilityCode ?? this.foodTraceabilityCode,
      packaging: packaging ?? this.packaging,
      servingSuggestions: servingSuggestions ?? this.servingSuggestions,
      supplyChain: supplyChain ?? this.supplyChain,
      seasonality: seasonality ?? this.seasonality,
      allergens: allergens ?? this.allergens,
      nutrients: nutrients ?? this.nutrients,
    );
  }
}