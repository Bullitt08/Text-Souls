class Classes {
  double health = 0 , attack = 0, defense = 0, speed = 0;

  String className = " ", weapon=" ";

  double getHealth() {
    return health;
  }

  double getAttack() {
    return attack;
  }

  double getDefense() {
    return defense;
  }

  double getSpeed() {
    return speed;
  }

  String getClassName() {
    return className;
  }

  String getWeapon() {
    return weapon;
  }

  void setHealth(double health) {
    this.health = health * 20;
  }

  void setAttack(double attack) {
    this.attack = attack * 5;
  }

  void setDefense(double defense) {
    this.defense = defense * 5;
  }

  void setSpeed(double speed) {
    this.speed = speed * 4;
  }

  void setClassName(String className) {
    this.className = className;
  }

  void setWeapon(String weapon) {
    this.weapon = weapon;
  }
}
