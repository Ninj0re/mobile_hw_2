import 'package:flutter/material.dart';
import '../models/pet.dart';
import '../models/friendly_interface.dart';

abstract class PetCard extends StatelessWidget {
  final Pet pet;

  const PetCard({super.key, required this.pet});

  IconData getPetIcon();
  Color getPetColor();

  void _onTap(BuildContext context) {
    String message;

    if (pet is Friendly) {
      message = (pet as Friendly).showAffection();
    } else {
      message = '${pet.name} shows affection!';
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.favorite, color: Colors.white),
            const SizedBox(width: 8),
            Expanded(
              child: Text(message, style: const TextStyle(fontSize: 16)),
            ),
          ],
        ),
        backgroundColor: getPetColor(),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        leading: CircleAvatar(
          backgroundColor: getPetColor().withValues(alpha: 0.2),
          child: Icon(getPetIcon(), color: getPetColor()),
        ),
        title: Text(
          pet.getInfo(),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            pet.makeSound(),
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios, color: getPetColor(), size: 18),
        onTap: () => _onTap(context),
      ),
    );
  }
}
