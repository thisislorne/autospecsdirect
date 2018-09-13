# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.destroy_all

Review.destroy_all

Product.create(
  title: 'Clean Nutrition Whey Protein',
  description: 'Clean Nutrition Whey Protein is perfect for you if you are looking to add protein to your diet, without the added fillers or spiking. It is made up of premium whey and offers an impressive 23 grams of protein and only 1.5 grams of sugar.',
  image: 'cleannutritionwheyprotein.jpg',
  brand: 'Clean Nutrition',
  brand_image: 'clean-nutrition.png',
  rating: '4.8',
  num_reviews: '31',
  key: 'clean_nutrition_whey_protein'
)

Review.create(
  user: 'Aman',
  rating: '5',
  review: 'I have tried some others but this is the best taste so far and real value for money. Great taste, light for digestion too.*',
  flavour: '5',
  summary: 'Value for money',
  product: Product.first
)

Link.create(
  url: 'https://www.sportsfuel.co.nz/clean-nutrition-protein-1kg.html',
  title: 'Clean Nutrition Whey Protein 1kg',
  price: '$39',
  brand_image: 'musclepharm.png',
  product: Product.first
)

# Product.create(
#   title: 'Optimum 100% Whey Gold Standard',
#   description: 'Optimum Gold Standard Whey Protein provides a pure form of whey made of an exclusive blend of microfiltered whey protein isolates, ion-exchange whey protein isolates, ultrafiltered whey protein concentrate, and HydroWhey hydrolyzed whey peptides. This means that this product is able to provide 24g protein per serving (wihch is a whopping 79% protein content in weight!) and has has no more than 2g fat, 4g carbohydrate, and 2g sugar.',
#   image: 'on-whey-1lb.jpg',
#   brand: 'Optimum Nutrition',
#   brand_image: 'optimum-nutrition.png',
#   rating: '4.9',
#   num_reviews: '5'
# )
#
# Product.create(
#   title: 'MusclePharm Combat 100% Whey',
#   description: 'MusclePharm Combat 100% Whey Protein is a blend of Whey Protein Concentrate and Whey Protein Isolate and is Gluten and Casein free. Providing a massive 25 grams protein per scoop, this provides the building blocks for maintaining that lean muscle mass that you’re training so hard for. On top of that, this great product also includes L-Isoleucine, L-Leucine, L-Valine and Glutamine to support muscle building, repair and maintenance and may also help support the immune system.',
#   image: 'mp-combat-100-whey-5lb.jpg',
#   brand: 'Muscle Pharm',
#   brand_image: 'musclepharm.png',
#   rating: '5',
#   num_reviews: '1'
# )
#
# Product.create(
#   title: 'Balance 100% Whey Protein',
#   description: 'Balance 100% Whey Protein is enriched with natural digestive enzymes to ensure that the protein is digested quickly and readily absorbed. With 22g of protein and only 1.3g of sugar per serve, this product provides you with a combination of whey protein concentrate and whey protein isolate for lean muscle growth and fast muscle recovery.',
#   image: 'balance_whey_protein.jpg',
#   brand: 'Balance',
#   brand_image: 'balance-nutrition.png',
#   rating: '4.2',
#   num_reviews: '12'
# )
#
# Product.create(
#   title: 'Mutant Whey',
#   description: 'Mutant whey is a highly anabolic whey protein supplement formulated specifically to facilitate increases in lean muscle tissue in a very short amount of time. Fast becoming known as the ultimate whey protein blend, this premium quality product contains a 5-stage release formula that will supply your muscles with a steady flow of quality amino acids.',
#   image: 'mutant_whey.jpg',
#   brand: 'Mutant',
#   brand_image: 'mutant.png',
#   rating: '5',
#   num_reviews: '5'
# )
#
# Product.create(
#   title: 'Inner Armour Whey Protein',
#   description: "Inner Armour Whey Protein is designed to boost the free lean muscle-building peptides, while reducing cravings and increasing energy levels. With each serving, you'll treat your body to 24 grams of an amino acid specific whey protein blend that is perfectly balanced to support muscle development.",
#   image: 'Ims-choc.jpg',
#   brand: 'Inner Armour',
#   brand_image: 'inner-armour.png',
#   rating: '4.1',
#   num_reviews: '98'
# )
#
# Product.create(
#   title: 'RSP Nutrition Whey Protein',
#   description: "RSP Whey Protein is a quick and convenient way to help you reach your protein intake to support muscle growth and recovery. This product contains 25g of whey protein from four different sources: Whey Protein Concentrate, Milk Protein Isolate, Whey Protein Hydrolysate and Whey Protein Isolate. Also, as some athletes find that Whey Protein can create trouble with digestion, RSP have included digestive enzymes (Papain, Protease) to minimise this issue",
#   image: 'Ims-choc.jpg',
#   brand: 'Inner Armour',
#   brand_image: 'inner-armour.png',
#   rating: '4.1',
#   num_reviews: '98'
# )
#
# Product.create(
#   title: 'Balance 100% Whey Natural',
#   description: "Balance 100% Whey Natural contains absolutely no artificial sweeteners, flavours, colours or preservatives and it is also gluten free. This natural whey formula is made with Stevia. With low carbohydrate amounts and high protein, Balance 100% Whey Natural uses proprietary blend packed with amino acids to helps to create an anabolic environment in the body for maximum muscle growth. ",
#   image: 'Ims-choc.jpg',
#   brand: 'Inner Armour',
#   brand_image: 'inner-armour.png',
#   rating: '4.1',
#   num_reviews: '98'
# )
