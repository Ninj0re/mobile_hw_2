import 'pet.dart';
import 'friendly_interface.dart';

class Dog extends Pet implements Friendly {
  final String breed;

  Dog(String name, {this.breed = 'Mixed'}) : super(name, 'Dog');

  Dog.withBreed({required String name, required this.breed})
    : super(name, 'Dog');

  @override
  String makeSound() {
    return 'Woof Woof!';
  }

  @override
  String showAffection() {
    return '$name wags tail happily!';
  }

  @override
  String getInfo() {
    return '${super.getInfo()} ($breed)';
  }
}
