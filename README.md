# Smart Pet Manager (Akıllı Evcil Hayvan Yöneticisi)

A Flutter application demonstrating Object-Oriented Programming (OOP) concepts for BIM493 Mobile Programming I course.

## Project Description

This app manages different types of pets (Dog, Cat, Bird) and displays their information, sounds, and behaviors using comprehensive OOP principles.

## Features

- **3 Pet Types:** Dog, Cat, and Bird
- **Dynamic Pet Addition:** Add new pets using the + button in the bottom right corner
- **Customizable Pets:** Choose pet type, name, and specific attributes (breed/color/species)
- **Pet Information:** Each pet displays its name, type, and unique sound
- **Interactive Cards:** Tap any pet card to see their affection message on screen
- **Total Counter:** Shows total number of pets using static variable (updates dynamically)
- **Modern UI:** Clean, card-based interface with Material Design 3
- **Empty State:** Helpful message when no pets are added yet

## OOP Concepts Implemented

✅ **Classes:** Pet, Dog, Cat, Bird  
✅ **Inheritance:** Dog, Cat, Bird extend Pet  
✅ **Abstraction:** Pet is an abstract class  
✅ **Abstract Method:** makeSound() must be implemented by subclasses  
✅ **Objects:** Multiple pet instances created  
✅ **Constructors:** Both default and named constructors  
✅ **Interface:** Friendly interface implemented by Dog and Cat  
✅ **Mixin:** Flyable mixin used by Bird  
✅ **Keywords:** static, super, this demonstrated throughout  

## Project Structure

```
lib/
├── main.dart                      # Main app UI
├── models/
│   ├── pet.dart                   # Abstract Pet class
│   ├── dog.dart                   # Dog class (extends Pet, implements Friendly)
│   ├── cat.dart                   # Cat class (extends Pet, implements Friendly)
│   ├── bird.dart                  # Bird class (extends Pet, with Flyable)
│   ├── friendly_interface.dart    # Friendly interface
│   └── flyable_mixin.dart         # Flyable mixin
└── widgets/
    ├── pet_card.dart              # Abstract PetCard widget
    ├── dog_card.dart              # DogCard (extends PetCard)
    ├── cat_card.dart              # CatCard (extends PetCard)
    └── bird_card.dart             # BirdCard (extends PetCard)
```

**Note:** The project demonstrates inheritance at both the model layer (Pet classes) and UI layer (PetCard widgets).

## Running the Application

```bash
# Get dependencies
flutter pub get

# Run the app
flutter run

# Run tests
flutter test

# Analyze code
flutter analyze
```

## UI Output

The app displays:
- **Title:** "Smart Pet Manager"
- **Pet Cards:** Dynamically created cards for each pet showing:
  - Pet type, name, and attribute (e.g., "Dog: Buddy (Mixed)")
  - Pet sound (e.g., "Woof Woof!")
- **Add Button:** Floating action button (+) in the bottom right corner
- **Add Pet Dialog:** Form to create new pets with:
  - Pet type dropdown (Dog/Cat/Bird)
  - Name input field (optional - uses default if empty)
  - Attribute field (optional - uses default if empty)
    - Breed for dogs (default: "Mixed")
    - Color for cats (default: "Orange")
    - Species for birds (default: "Canary")
- **Footer:** "Total Pets: X" (from static variable, updates in real-time)
- **Interactive:** Tap any pet card to see affection message

## Documentation

See [OOP_CONCEPTS.md](OOP_CONCEPTS.md) for detailed documentation of all OOP concepts used in this project.

## Requirements Met

All BIM493 assignment requirements have been successfully implemented and tested.
