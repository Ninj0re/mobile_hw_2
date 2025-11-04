import 'package:flutter/material.dart';
import '../models/pet.dart';
import '../models/dog.dart';
import '../models/cat.dart';
import '../models/bird.dart';

class AddPetDialog extends StatefulWidget {
  const AddPetDialog({super.key});

  @override
  State<AddPetDialog> createState() => _AddPetDialogState();
}

class _AddPetDialogState extends State<AddPetDialog> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _attributeController = TextEditingController();

  String _selectedPetType = 'Dog';
  final List<String> _petTypes = ['Dog', 'Cat', 'Bird'];

  @override
  void dispose() {
    _nameController.dispose();
    _attributeController.dispose();
    super.dispose();
  }

  String _getAttributeLabel() {
    switch (_selectedPetType) {
      case 'Dog':
        return 'Breed';
      case 'Cat':
        return 'Color';
      case 'Bird':
        return 'Species';
      default:
        return 'Attribute';
    }
  }

  String _getAttributeHint() {
    switch (_selectedPetType) {
      case 'Dog':
        return 'e.g., Golden Retriever';
      case 'Cat':
        return 'e.g., Black';
      case 'Bird':
        return 'e.g., Parrot';
      default:
        return '';
    }
  }

  Pet _createPet() {
    final name = _nameController.text.trim();
    final attribute = _attributeController.text.trim();

    switch (_selectedPetType) {
      case 'Dog':
        if (name.isEmpty || attribute.isEmpty) {
          return Dog(name.isEmpty ? 'Unknown Dog' : name);
        }
        return Dog.withBreed(name: name, breed: attribute);
      case 'Cat':
        if (name.isEmpty || attribute.isEmpty) {
          return Cat(name.isEmpty ? 'Unknown Cat' : name);
        }
        return Cat.withColor(name: name, color: attribute);
      case 'Bird':
        if (name.isEmpty || attribute.isEmpty) {
          return Bird(name.isEmpty ? 'Unknown Bird' : name);
        }
        return Bird.withSpecies(name: name, species: attribute);
      default:
        return Dog(name.isEmpty ? 'Unknown Dog' : name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Add New Pet',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Pet Type',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                initialValue: _selectedPetType,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                ),
                items: _petTypes.map((type) {
                  return DropdownMenuItem(
                    value: type,
                    child: Row(
                      children: [
                        Icon(_getPetIcon(type), size: 20),
                        const SizedBox(width: 8),
                        Text(type),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedPetType = value!;
                  });
                },
              ),
              const SizedBox(height: 16),

              const Text(
                'Pet Name',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: 'Enter pet name (optional)',
                  helperText: 'Leave empty for default name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              Text(
                _getAttributeLabel(),
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _attributeController,
                decoration: InputDecoration(
                  hintText: _getAttributeHint(),
                  helperText: 'Leave empty for default value',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            final newPet = _createPet();
            Navigator.of(context).pop(newPet);
          },
          child: const Text('Add Pet'),
        ),
      ],
    );
  }

  IconData _getPetIcon(String type) {
    switch (type) {
      case 'Dog':
        return Icons.pets;
      case 'Cat':
        return Icons.pets;
      case 'Bird':
        return Icons.flutter_dash;
      default:
        return Icons.favorite;
    }
  }
}
