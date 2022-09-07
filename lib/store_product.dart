class StoreProduct {
  const StoreProduct ({
    required this.price,
    required this.name,
    required this.description,
    required this.image,
    required this.weight,
});
  final double price;
  final String name;
  final String description;
  final String image;
  final String weight;
}

const storeProducts = <StoreProduct> [
  StoreProduct(
    price: 3.00,
    name: 'Seco de Pollo',
    description: 'The avocado is a flessy exotic fruit obtained tropical tree of the same name.',
    image: 'assets/seco.png',
    weight: '500g'
  ),
  StoreProduct(
      price: 3.00,
      name: 'Picante',
      description: 'The avocado is a flessy exotic fruit obtained tropical tree of the same name.',
      image: 'assets/picante.png',
      weight: '500g'
  ),
  StoreProduct(
      price: 6.00,
      name: 'Picadita Bielera',
      description: 'The avocado is a flessy exotic fruit obtained tropical tree of the same name.',
      image: 'assets/picadita.png',
      weight: '500g'
  ),
  StoreProduct(
      price: 3.00,
      name: 'Mini Wings',
      description: 'The avocado is a flessy exotic fruit obtained tropical tree of the same name.',
      image: 'assets/alitas.png',
      weight: '500g'
  ),
  StoreProduct(
      price: 5.50,
      name: 'Personal',
      description: 'The avocado is a flessy exotic fruit obtained tropical tree of the same name.',
      image: 'assets/alitas.png',
      weight: '500g'
  ),
  StoreProduct(
      price: 10.50,
      name: 'Familiar',
      description: 'The avocado is a flessy exotic fruit obtained tropical tree of the same name.',
      image: 'assets/alitas.png',
      weight: '500g'
  ),
  StoreProduct(
      price: 1.75,
      name: 'Papicarne (Media)',
      description: 'The avocado is a flessy exotic fruit obtained tropical tree of the same name.',
      image: 'assets/papicarne.png',
      weight: '500g'
  ),
  StoreProduct(
      price: 2.75,
      name: 'Papicarne (Entera)',
      description: 'The avocado is a flessy exotic fruit obtained tropical tree of the same name.',
      image: 'assets/papicarne.png',
      weight: '500g'
  ),
  StoreProduct(
      price: 1.50,
      name: 'Salchipapa (Media)',
      description: 'The avocado is a flessy exotic fruit obtained tropical tree of the same name.',
      image: 'assets/salchipapa.png',
      weight: '500g'
  )
];