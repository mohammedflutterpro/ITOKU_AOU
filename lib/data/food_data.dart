import 'package:flutter/material.dart';

// Food-themed color palette
final List<Color> foodColors = [
  Colors.red.shade400,       // For sushi/meat
  Colors.green.shade400,     // For vegetables
  Colors.orange.shade400,    // For ramen/orange foods
  Colors.brown.shade400,     // For sauces/tea
  Colors.pink.shade300,      // For sweets
  Colors.amber.shade600,     // For fried foods
  Colors.deepPurple.shade300, // For unique items
  Colors.blue.shade300,      // For drinks
  Colors.teal.shade400,      // For seafood
  Colors.yellow.shade600,    // For citrus/flavorful dishes
  Colors.grey.shade600,      // For savory/starchy foods
  Colors.purple.shade200,    // For desserts
  Colors.lime.shade400,      // For fresh/herbal ingredients
];

final List<Map<String, dynamic>> foodData = [
  // Basic Food Terms
  {
    "EnName": "Rice",
    "japName": "gohan",
    "color": foodColors[1],
    "sound": 'sounds/food/rice.mp3',
    "icon": Icons.rice_bowl,
  },
  {
    "EnName": "Noodles",
    "japName": "menrui",
    "color": foodColors[2],
    "sound": 'sounds/food/noodles.mp3',
    "icon": Icons.ramen_dining,
  },
  {
    "EnName": "Fish",
    "japName": "sakana",
    "color": foodColors[8], // Changed to teal for seafood
    "sound": 'sounds/food/fish.mp3',
    "icon": Icons.set_meal,
  },
  {
    "EnName": "Meat",
    "japName": "niku",
    "color": foodColors[0],
    "sound": 'sounds/food/meat.mp3',
    "icon": Icons.kebab_dining,
  },
  {
    "EnName": "Vegetables",
    "japName": "yasai",
    "color": foodColors[1],
    "sound": 'sounds/food/vegetables.mp3',
    "icon": Icons.local_florist,
  },
  {
    "EnName": "Bread",
    "japName": "pan",
    "color": foodColors[10], // Grey for starchy foods
    "sound": 'sounds/food/bread.mp3',
    "icon": Icons.bakery_dining,
  },
  {
    "EnName": "Cheese",
    "japName": "chiizu",
    "color": foodColors[9], // Yellow for flavorful items
    "sound": 'sounds/food/cheese.mp3',
    "icon": Icons.local_pizza,
  },

  // Japanese Dishes
  {
    "EnName": "Sushi",
    "japName": "sushi",
    "color": foodColors[0],
    "sound": 'sounds/food/sushi.mp3',
    "icon": Icons.set_meal,
  },
  {
    "EnName": "Ramen",
    "japName": "ramen",
    "color": foodColors[2],
    "sound": 'sounds/food/ramen.mp3',
    "icon": Icons.ramen_dining,
  },
  {
    "EnName": "Tempura",
    "japName": "tenpura",
    "color": foodColors[5],
    "sound": 'sounds/food/tempura.mp3',
    "icon": Icons.fastfood,
  },
  {
    "EnName": "Sashimi",
    "japName": "sashimi",
    "color": foodColors[8], // Teal for seafood
    "sound": 'sounds/food/sashimi.mp3',
    "icon": Icons.set_meal,
  },
  {
    "EnName": "Miso Soup",
    "japName": "misoshiru",
    "color": foodColors[3],
    "sound": 'sounds/food/miso_soup.mp3',
    "icon": Icons.soup_kitchen,
  },
  {
    "EnName": "Udon",
    "japName": "udon",
    "color": foodColors[2],
    "sound": 'sounds/food/udon.mp3',
    "icon": Icons.ramen_dining,
  },
  {
    "EnName": "Okonomiyaki",
    "japName": "okonomiyaki",
    "color": foodColors[10], // Grey for savory
    "sound": 'sounds/food/okonomiyaki.mp3',
    "icon": Icons.breakfast_dining,
  },
  {
    "EnName": "Yakitori",
    "japName": "yakitori",
    "color": foodColors[0],
    "sound": 'sounds/food/yakitori.mp3',
    "icon": Icons.kebab_dining,
  },
  {
    "EnName": "Onigiri",
    "japName": "onigiri",
    "color": foodColors[1],
    "sound": 'sounds/food/onigiri.mp3',
    "icon": Icons.rice_bowl,
  },

  // Common Phrases
  {
    "EnName": "Delicious!",
    "japName": "oishii!",
    "color": foodColors[4],
    "sound": 'sounds/food/delicious.mp3',
    "icon": Icons.favorite,
  },
  {
    "EnName": "I'm hungry",
    "japName": "onaka ga suita",
    "color": foodColors[0],
    "sound": 'sounds/food/hungry.mp3',
    "icon": Icons.restaurant,
  },
  {
    "EnName": "Check please",
    "japName": "okaikei onegaishimasu",
    "color": foodColors[6],
    "sound": 'sounds/food/check.mp3',
    "icon": Icons.receipt,
  },
  {
    "EnName": "It's sweet",
    "japName": "amai desu",
    "color": foodColors[4],
    "sound": 'sounds/food/sweet.mp3',
    "icon": Icons.cake,
  },
  {
    "EnName": "It's spicy",
    "japName": "karai desu",
    "color": foodColors[0],
    "sound": 'sounds/food/spicy.mp3',
    "icon": Icons.local_fire_department,
  },
  {
    "EnName": "Thank you for the meal",
    "japName": "gochisousama",
    "color": foodColors[6],
    "sound": 'sounds/food/thank_you.mp3',
    "icon": Icons.sentiment_satisfied,
  },

  // Beverages
  {
    "EnName": "Green tea",
    "japName": "ocha",
    "color": foodColors[3],
    "sound": 'sounds/food/green_tea.mp3',
    "icon": Icons.local_drink,
  },
  {
    "EnName": "Sake",
    "japName": "sake",
    "color": foodColors[7],
    "sound": 'sounds/food/sake.mp3',
    "icon": Icons.liquor,
  },
  {
    "EnName": "Matcha",
    "japName": "matcha",
    "color": foodColors[12], // Lime for herbal
    "sound": 'sounds/food/matcha.mp3',
    "icon": Icons.local_drink,
  },

  // Ingredients
  {
    "EnName": "Egg",
    "japName": "tamago",
    "color": foodColors[9], // Yellow for flavorful
    "sound": 'sounds/food/egg.mp3',
    "icon": Icons.egg,
  },
  {
    "EnName": "Tofu",
    "japName": "tofu",
    "color": foodColors[1],
    "sound": 'sounds/food/tofu.mp3',
    "icon": Icons.square,
  },
  {
    "EnName": "Seaweed",
    "japName": "nori",
    "color": foodColors[8], // Teal for seafood
    "sound": 'sounds/food/seaweed.mp3',
    "icon": Icons.waves,
  },
  {
    "EnName": "Soy Sauce",
    "japName": "shoyu",
    "color": foodColors[3],
    "sound": 'sounds/food/soy_sauce.mp3',
    "icon": Icons.water_drop,
  },
  {
    "EnName": "Ginger",
    "japName": "shoga",
    "color": foodColors[12], // Lime for herbal
    "sound": 'sounds/food/ginger.mp3',
    "icon": Icons.spa,
  },

  // Desserts
  {
    "EnName": "Mochi",
    "japName": "mochi",
    "color": foodColors[11], // Purple for desserts
    "sound": 'sounds/food/mochi.mp3',
    "icon": Icons.cake,
  },
  {
    "EnName": "Dango",
    "japName": "dango",
    "color": foodColors[11], // Purple for desserts
    "sound": 'sounds/food/dango.mp3',
    "icon": Icons.cake,
  },
];