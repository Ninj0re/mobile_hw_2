import 'package:flutter/material.dart';
import '../models/dog.dart';
import 'pet_card.dart';

class DogCard extends PetCard {
  const DogCard({super.key, required Dog dog}) : super(pet: dog);

  @override
  IconData getPetIcon() {
    return Icons.pets;
  }

  @override
  Color getPetColor() {
    return Colors.brown;
  }
}
