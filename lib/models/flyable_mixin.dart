mixin Flyable {
  String fly() {
    return 'Flying with ${flyingSpeed()} km/h speed in the sky!';
  }

  int flyingSpeed() {
    return 5;
  }
}
