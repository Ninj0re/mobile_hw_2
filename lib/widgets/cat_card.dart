import 'package:flutter/material.dart';
import '../models/cat.dart';
import 'pet_card.dart';

class CatCard extends PetCard {
  const CatCard({super.key, required Cat cat}) : super(pet: cat);

  @override
  IconData getPetIcon() {
    return Icons.pets;
  }

  @override
  Color getPetColor() {
    return Colors.orange;
  }
}
