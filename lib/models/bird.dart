import 'pet.dart';
import 'flyable_mixin.dart';
import 'friendly_interface.dart';

class Bird extends Pet with Flyable implements Friendly {
  final String species;
  Bird(String name, {this.species = 'Canary'}) : super(name, 'Bird');

  Bird.withSpecies({required String name, required this.species})
    : super(name, 'Bird');

  @override
  String makeSound() {
    return 'Chirp Chirp!';
  }

  @override
  String getInfo() {
    return '${super.getInfo()} ($species)';
  }

  @override
  String showAffection() {
    return '$name  ${fly()} and flaps its wings quickly with joy!';
  }
}
