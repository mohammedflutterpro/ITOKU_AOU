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
];

final List<Map<String, dynamic>> foodData = [
  // Basic Food Terms
  {"EnName": "Rice", "japName": "gohan", "color": foodColors[1], "sound": 'sounds/food/rice.mp3'},
  {"EnName": "Noodles", "japName": "menrui", "color": foodColors[2], "sound": 'sounds/food/noodles.mp3'},
  {"EnName": "Fish", "japName": "sakana",  "color": foodColors[7], "sound": 'sounds/food/fish.mp3'},
  {"EnName": "Meat", "japName": "niku",  "color": foodColors[0], "sound": 'sounds/food/meat.mp3'},
  {"EnName": "Vegetables", "japName": "yasai",  "color": foodColors[1], "sound": 'sounds/food/vegetables.mp3'},

  // Japanese Dishes
  {"EnName": "Sushi", "japName": "sushi", "color": foodColors[0], "sound": 'sounds/food/sushi.mp3'},
  {"EnName": "Ramen", "japName": "ramen",  "color": foodColors[2], "sound": 'sounds/food/ramen.mp3'},
  {"EnName": "Tempura", "japName": "tenpura",  "color": foodColors[5], "sound": 'sounds/food/tempura.mp3'},
  {"EnName": "Sashimi", "japName": "sashimi",  "color": foodColors[0], "sound": 'sounds/food/sashimi.mp3'},
  {"EnName": "Miso Soup", "japName": "misoshiru",  "color": foodColors[3], "sound": 'sounds/food/miso_soup.mp3'},

  // Common Phrases
  {"EnName": "Delicious!", "japName": "oishii!",  "color": foodColors[4], "sound": 'sounds/food/delicious.mp3'},
  {"EnName": "I'm hungry", "japName": "onaka ga suita",  "color": foodColors[0], "sound": 'sounds/food/hungry.mp3'},
  {"EnName": "Check please", "japName": "okaikei onegaishimasu",  "color": foodColors[6], "sound": 'sounds/food/check.mp3'},
  {"EnName": "It's sweet", "japName": "amai desu",  "color": foodColors[4], "sound": 'sounds/food/sweet.mp3'},
  {"EnName": "It's spicy", "japName": "karai desu",  "color": foodColors[0], "sound": 'sounds/food/spicy.mp3'},

  // Beverages
  {"EnName": "Green tea", "japName": "ocha",  "color": foodColors[3], "sound": 'sounds/food/green_tea.mp3'},
  // Ingredients
  {"EnName": "Egg", "japName": "tamago",  "color": foodColors[5], "sound": 'sounds/food/egg.mp3'},
  {"EnName": "Tofu", "japName": "tofu",  "color": foodColors[1], "sound": 'sounds/food/tofu.mp3'},
  {"EnName": "Seaweed", "japName": "nori",  "color": foodColors[1], "sound": 'sounds/food/seaweed.mp3'}
];