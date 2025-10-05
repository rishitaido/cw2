import 'package:flutter/material.dart';
import 'recipe.dart';

void main() {
  runApp(RecipeBookApp());
}

class RecipeBookApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Book',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  // List of recipes
  final List<Recipe> recipes = [
    Recipe(
      name: 'Chocolate Chip Cookies',
      description: 'Classic homemade cookies',
      ingredients: [
        '2 cups flour',
        '1 cup butter',
        '1 cup sugar',
        '2 eggs',
        '2 cups chocolate chips',
        '1 tsp vanilla extract',
      ],
      instructions: [
        'Preheat oven to 350°F',
        'Mix butter and sugar until fluffy',
        'Add eggs and vanilla',
        'Stir in flour gradually',
        'Fold in chocolate chips',
        'Bake for 10-12 minutes',
      ],
    ),
    Recipe(
      name: 'Chicken Piccata',
      description: 'Tangy Italian chicken with lemon and capers',
      ingredients: [
        '4 chicken breasts (pounded thin)',
        '1/2 cup flour',
        '3 tbsp olive oil',
        '3 tbsp butter',
        '1/2 cup chicken broth',
        '1/4 cup lemon juice',
        '2 tbsp capers',
        'Salt and pepper',
        'Chopped parsley for garnish',
      ],
      instructions: [
        'Season chicken with salt and pepper, dredge in flour.',
        'Heat olive oil and 2 tbsp butter in pan.',
        'Cook chicken until golden on both sides.',
        'Remove chicken, add broth, lemon juice, capers.',
        'Simmer sauce and return chicken to coat.',
        'Top with parsley and serve.',
      ],
    ),
    Recipe(
      name: 'Caesar Salad',
      description: 'Fresh and crunchy salad',
      ingredients: [
        '1 head romaine lettuce',
        '1 cup croutons',
        '1/2 cup parmesan cheese',
        '1/2 cup Caesar dressing',
        '1 lemon',
      ],
      instructions: [
        'Wash and chop lettuce',
        'Add croutons and cheese',
        'Drizzle with dressing',
        'Toss everything together',
        'Squeeze lemon juice on top',
      ],
    ),
    Recipe(
      name: 'Chicken Curry',
      description: 'Indian spiced curry with rich gravy',
      ingredients: [
        '500g chicken pieces',
        '2 onions, finely chopped',
        '2 tomatoes, pureed',
        '2 tbsp ginger-garlic paste',
        '2 tbsp oil',
        '2 tsp garam masala',
        '1 tsp turmeric',
        '2 tsp chili powder',
        '1 cup yogurt',
        'Cilantro for garnish',
      ],
      instructions: [
        'Heat oil and sauté onions until golden.',
        'Add ginger-garlic paste, cook briefly.',
        'Add tomatoes and spices, simmer into masala.',
        'Add chicken, coat well, cook until sealed.',
        'Stir in yogurt, cover and simmer until chicken is done.',
        'Garnish with cilantro and serve with rice or naan.',
      ],
    ),
    Recipe(
      name: 'Chana Masala',
      description: 'Spiced chickpea curry from North India',
      ingredients: [
        '2 cups cooked chickpeas',
        '2 onions, chopped',
        '2 tomatoes, chopped',
        '1 tbsp ginger-garlic paste',
        '2 tsp cumin powder',
        '2 tsp coriander powder',
        '1 tsp turmeric',
        '1 tsp chili powder',
        '1 tbsp garam masala',
        '2 tbsp oil',
        'Fresh cilantro',
      ],
      instructions: [
        'Heat oil and sauté onions until golden.',
        'Add ginger-garlic paste and cook.',
        'Add tomatoes and spices, simmer until thick.',
        'Add chickpeas, mash some for thickness.',
        'Simmer for 10 minutes.',
        'Top with cilantro and serve with rice or roti.',
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Recipe Book'),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          Recipe recipe = recipes[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: const Color.fromARGB(255, 164, 4, 60),
                child: Icon(Icons.restaurant, color: const Color.fromARGB(255, 0, 0, 0)),
              ),
              title: Text(
                recipe.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(recipe.description),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Navigate to details screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(recipe: recipe),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  final Recipe recipe;

  DetailsScreen({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Recipe Name
            Text(
              recipe.name,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            // Description
            Text(
              recipe.description,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 24),
            // Ingredients Section
            Text(
              'Ingredients',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                color: Colors.orange[50],
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: recipe.ingredients.map((ingredient) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        Icon(Icons.check_circle,
                            size: 20,
                            color: const Color.fromARGB(255, 100, 3, 169)),
                        SizedBox(width: 8),
                        Expanded(child: Text(ingredient)),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 24),
            // Instructions Section
            Text(
              'Instructions',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            SizedBox(height: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: recipe.instructions.asMap().entries.map((entry) {
                int stepNumber = entry.key + 1;
                String instruction = entry.value;
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: const Color.fromARGB(255, 100, 3, 169),
                        child: Text(
                          '$stepNumber',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          instruction,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}