import 'package:flutter/material.dart';
import '../models/bird.dart';
import 'pet_card.dart';

class BirdCard extends PetCard {
  const BirdCard({super.key, required Bird bird}) : super(pet: bird);

  @override
  IconData getPetIcon() {
    return Icons.flutter_dash;
  }

  @override
  Color getPetColor() {
    return Colors.blue;
  }
}
