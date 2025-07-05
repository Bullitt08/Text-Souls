import 'package:staj2/models/Classes.dart';

class Player extends Classes{
  String weapon="";

  String getWeapon(){return weapon;}

  void setWeapon(String weapon){
    if(weapon=="Sword"){
      this.weapon = "Sword";
      super.setAttack(super.getAttack()+2);
    }
    else if(weapon=="Shield"){
      this.weapon = "Shield";
      super.setDefense(super.getDefense()+2);
    }
    else if(weapon=="Potion"){
      this.weapon="Potion";
      super.setHealth(super.getHealth()+1);
      super.setSpeed(super.getSpeed()+1);
    }

    else{
      this.weapon = "None";
    }
  }

  Player(){
    super.setClassName("Player");
  }
}