import 'package:flutter/material.dart';
import 'models/pet.dart';
import 'models/dog.dart';
import 'models/cat.dart';
import 'models/bird.dart';
import 'widgets/dog_card.dart';
import 'widgets/cat_card.dart';
import 'widgets/bird_card.dart';
import 'widgets/add_pet_dialog.dart';

void main() {
  Pet.resetCounter();
  runApp(const SmartPetManagerApp());
}

class SmartPetManagerApp extends StatelessWidget {
  const SmartPetManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Pet Manager',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const PetManagerHome(),
    );
  }
}

class PetManagerHome extends StatefulWidget {
  const PetManagerHome({super.key});

  @override
  State<PetManagerHome> createState() => _PetManagerHomeState();
}

class _PetManagerHomeState extends State<PetManagerHome> {
  final List<Pet> pets = [Dog('Buddy'), Cat('Mia'), Bird('Tweety')];

  void _showAddPetDialog() async {
    final newPet = await showDialog<Pet>(
      context: context,
      builder: (context) => const AddPetDialog(),
    );

    if (newPet != null) {
      setState(() {
        pets.add(newPet);
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${newPet.name} added successfully!'),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 2),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          'Smart Pet Manager',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: pets.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.pets, size: 80, color: Colors.grey[400]),
                        const SizedBox(height: 16),
                        Text(
                          'No pets yet!',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Tap the + button to add a pet',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: pets.length,
                    itemBuilder: (context, index) {
                      final pet = pets[index];
                      if (pet is Dog) {
                        return DogCard(dog: pet);
                      } else if (pet is Cat) {
                        return CatCard(cat: pet);
                      } else if (pet is Bird) {
                        return BirdCard(bird: pet);
                      }
                      return const SizedBox.shrink();
                    },
                  ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 10,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Text(
              'Total Pets: ${Pet.getTotalPets()}', // Using static method
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddPetDialog,
        tooltip: 'Add Pet',
        child: const Icon(Icons.add),
      ),
    );
  }
}
