abstract class Pet {
  static int totalPets = 0;

  final String name;
  final String type;

  Pet(this.name, this.type) {
    totalPets++; // Increment static counter
  }

  Pet.withDefaults({this.name = 'Unknown', this.type = 'Pet'}) {
    totalPets++;
  }

  String makeSound();

  String getInfo() {
    return '$type: $name';
  }

  static int getTotalPets() {
    return totalPets;
  }

  static void resetCounter() {
    totalPets = 0;
  }
}
