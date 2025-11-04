# Smart Pet Manager - OOP Concepts Documentation

## Project Overview
This Flutter application demonstrates all required Object-Oriented Programming (OOP) concepts for BIM493 Mobile Programming I course.

## OOP Concepts Implemented

### 1. Classes (Sınıflar)
The project includes the following classes:
- **Pet** - Abstract base class
- **Dog** - Concrete class for dogs
- **Cat** - Concrete class for cats
- **Bird** - Concrete class for birds

**Location:** `/lib/models/`

### 2. Inheritance (Kalıtım)
All pet classes inherit from the `Pet` base class using the `extends` keyword:
- `Dog extends Pet`
- `Cat extends Pet`
- `Bird extends Pet`

**Example:**
```dart
class Dog extends Pet implements Friendly {
  Dog(String name, {this.breed = 'Mixed'}) : super(name, 'Dog');
}
```

### 3. Abstraction (Soyutlama)
The `Pet` class is declared as `abstract`, meaning it cannot be instantiated directly.

**Location:** `/lib/models/pet.dart`
```dart
abstract class Pet {
  // ...
}
```

### 4. Abstract Method (Soyut Metot)
The `Pet` class contains the abstract method `makeSound()` that must be implemented by all subclasses:
```dart
String makeSound(); // Abstract method
```

Each subclass provides its own implementation:
- Dog: "Woof Woof!"
- Cat: "Meow!"
- Bird: "Chirp Chirp!"

### 5. Objects (Nesneler)
Multiple pet instances are created in `main.dart`:
```dart
pets = [
  Dog('Buddy'),
  Cat('Mia'),
  Bird('Tweety'),
];
```

### 6. Constructors (Kurucular)

#### Default Constructor
```dart
Pet(this.name, this.type) {
  totalPets++;
}
```

#### Named Constructor
```dart
Pet.withDefaults({this.name = 'Unknown', this.type = 'Pet'}) {
  totalPets++;
}

Dog.withBreed({required String name, required this.breed}) 
    : super(name, 'Dog');
```

### 7. Interface (Arayüz)
The `Friendly` interface is implemented by `Dog` and `Cat` classes:

**Location:** `/lib/models/friendly_interface.dart`
```dart
abstract class Friendly {
  void showAffection();
}
```

**Implementation:**
```dart
class Dog extends Pet implements Friendly {
  @override
  void showAffection() {
    print('$name wags tail happily!');
  }
}
```

### 8. Mixin
The `Flyable` mixin is used by the `Bird` class:

**Location:** `/lib/models/flyable_mixin.dart`
```dart
mixin Flyable {
  String fly() {
    return 'Flying high in the sky!';
  }
}
```

**Usage:**
```dart
class Bird extends Pet with Flyable {
  // Can now use fly() method
}
```

### 9. Keywords

#### `static` Keyword
Used for class-level variables and methods:
```dart
static int totalPets = 0;

static int getTotalPets() {
  return totalPets;
}
```

#### `super` Keyword
Used to call parent class constructor:
```dart
Dog(String name, {this.breed = 'Mixed'}) : super(name, 'Dog');
```

Also used to call parent class methods:
```dart
@override
String getInfo() {
  return '${super.getInfo()} ($breed)';
}
```

#### `this` Keyword
Used to refer to current instance:
```dart
Pet(this.name, this.type) {
  totalPets++;
}
```

## UI Features

### Display Requirements ✓
- **Title:** "Smart Pet Manager"
- **Pet Cards:** 3 cards showing:
  - Dog: Buddy - "Woof Woof!"
  - Cat: Mia - "Meow!"
  - Bird: Tweety - "Chirp Chirp!"
- **Total Count:** "Total Pets: 3" (from static variable)

## File Structure
```
lib/
├── main.dart                      # Main app UI
├── models/
│   ├── pet.dart                   # Abstract Pet class
│   ├── dog.dart                   # Dog class
│   ├── cat.dart                   # Cat class
│   ├── bird.dart                  # Bird class
│   ├── friendly_interface.dart    # Friendly interface
│   └── flyable_mixin.dart         # Flyable mixin
└── widgets/
    ├── pet_card.dart              # Abstract PetCard widget
    ├── dog_card.dart              # DogCard (extends PetCard)
    ├── cat_card.dart              # CatCard (extends PetCard)
    └── bird_card.dart             # BirdCard (extends PetCard)
```

## Additional Inheritance in UI Layer

The project also demonstrates inheritance in the UI layer:
- **PetCard** - Abstract base widget class
- **DogCard** - Extends PetCard for dogs
- **CatCard** - Extends PetCard for cats
- **BirdCard** - Extends PetCard for birds

This shows that inheritance principles apply not just to data models but also to UI components.

## Running the Application
```bash
flutter run
```

## Testing
```bash
flutter test
```

## All Requirements Met ✓
- [x] Classes (Pet, Dog, Cat, Bird)
- [x] Inheritance (extends)
- [x] Abstraction (abstract class)
- [x] Abstract Method (makeSound)
- [x] Objects (multiple instances)
- [x] Constructors (default and named)
- [x] Interface (Friendly)
- [x] Mixin (Flyable)
- [x] Keywords (static, super, this)
- [x] UI with 3 pet cards
- [x] Total pets count from static variable
