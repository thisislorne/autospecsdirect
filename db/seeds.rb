# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.delete_all

Link.delete_all

Review.delete_all

Product.create(
  title: 'Eat Me 100% Whey Protein',
  description: 'Eat Me Whey Protein powder packs 24 grams of the cleanest, muscle-building protein into each 30 gram serving. This product delivers a complete spectrum of whey peptides to assist your immune and antioxidant functions and it’s one of the best sources of branched chain amino acids (BCAAs).',
  image: 'eat-me-whey.jpg',
  brand: 'Eat Me',
  brand_image: 'eat-me.png',
  rating: '4'
)

Product.create(
  title: 'Cellucor COR Whey Protein',
  description: "Cellucor COR Whey features a fast digesting Whey Protein Isolate-based formula that packs 25g of protein per serving to satisfy protein needs for any occasion. Featuring 100% Whey Protein, minimal fat or carbs, added digestive enzymes, easy mixability and great flavours, Cellucor COR Whey Protein is a great choice for an 'anytime' protein",
  image: 'cellucor-whey-2lb_1.jpg',
  brand: 'Cellucor',
  brand_image: 'cellucor.png',
  rating: '4'
)

Link.create(
  product: Product.first,
  url: 'https://www.sportsfuel.co.nz/eat-me-100-whey-protein-1kg.html',
  title: 'Eat Me Whey',
  price: '$42.00'
)

Link.create(
  product: Product.first,
  url: 'https://www.sportsfuel.co.nz/eat-me-100-whey-protein-1kg.html',
  title: 'Eat Me Whey',
  price: '$42.00'
)
