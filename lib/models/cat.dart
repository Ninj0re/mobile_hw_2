import 'pet.dart';
import 'friendly_interface.dart';

class Cat extends Pet implements Friendly {
  final String color;

  Cat(String name, {this.color = 'Orange'}) : super(name, 'Cat');

  Cat.withColor({required String name, required this.color})
    : super(name, 'Cat');

  @override
  String makeSound() {
    return 'Meow!';
  }

  @override
  String showAffection() {
    return '$name purrs softly!';
  }

  @override
  String getInfo() {
    return '${super.getInfo()} ($color)';
  }
}
