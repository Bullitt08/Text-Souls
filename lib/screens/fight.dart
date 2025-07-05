import 'package:flutter/material.dart';
import 'package:staj2/database/Assassin.dart';
import 'package:staj2/database/Knight.dart';
import 'package:staj2/database/Player.dart';
import 'package:staj2/database/Warrior.dart';
import 'package:staj2/functions/Fight.dart';
import 'package:staj2/functions/apCalculator.dart';
import 'package:staj2/functions/dpCalculator.dart';
import 'package:staj2/main.dart';

FightWith FW = FightWith();
Knight knight = Knight();
Warrior warrior = Warrior();
Assassin assassin = Assassin();

class Fight extends StatefulWidget {
  @override
  final Player player;
  final String playerName;
  const Fight({super.key, required this.player, required this.playerName});
  State<Fight> createState() => _FightState();
}

class _FightState extends State<Fight> {
  String message = " ";
  apCalculator AC = apCalculator();
  dpCalculator DC = dpCalculator();
  bool knightIsBeaten = false,
      warriorIsBeaten = false,
      assassinIsBeaten = false;

  bool allBossesBeaten() {
    return knightIsBeaten && warriorIsBeaten && assassinIsBeaten;
  }

  void checkAllBeaten(context) {
    if (allBossesBeaten()) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("All Bosses Beaten!"),
            content: Text("Congratulations! You've beaten all the bosses."),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyApp()));
                  },
                  child: Text("Go to the main menu")),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Text-Souls"),
        actions: [
          Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(widget.playerName),
            ),
          ),
        ],
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Container(
                width: 300,
                height: 300,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    "https://static.wikia.nocookie.net/darksouls/images/6/6a/Dark_Souls_3_-_E3_artworks_4.jpg/revision/latest?cb=20150616181955",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (!knightIsBeaten) {
                      var result = FW.fightWith(
                          (AC.calculator(widget.player.getAttack(),
                              widget.player.getSpeed())),
                          (DC.calculator(widget.player.getHealth(),
                              widget.player.getDefense())),
                          (AC.calculator(
                              knight.getAttack(), knight.getSpeed())),
                          (DC.calculator(
                              knight.getHealth(), knight.getDefense())));
                      if (result["fightResult"] == true) {
                        setState(() {
                          knightIsBeaten = result["fightResult"];
                          message = "You won the fight !";
                          checkAllBeaten(context);
                        });
                      } else {
                        setState(() {
                          message = "You lost the fight !";
                        });
                      }
                      var alert = AlertDialog(
                        title: Text("Fighting with Knight"),
                        content: Container(
                          width: double.maxFinite,
                          height: 300,
                          child: Column(
                            children: <Widget>[
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: result["fightLog"].length,
                                itemBuilder: (context, index) {
                                  return Text(
                                    result["fightLog"][index],
                                  );
                                },
                              ),
                              SizedBox(height: 20),
                              Text(message),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("Close"))
                        ],
                      );
                      showDialog(
                          context: context,
                          builder: (BuildContext context) => alert);
                    } else {
                      ErrorDialog(context);
                    }
                  },
                  child: Text("Fight with Knight"))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Container(
                width: 300,
                height: 300,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    "https://static.wikia.nocookie.net/darksouls/images/c/cb/CotIK_enemy_Faraam_Warrior.png/revision/latest?cb=20141002170455",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (!warriorIsBeaten) {
                      var result = FW.fightWith(
                          (AC.calculator(widget.player.getAttack(),
                              widget.player.getSpeed())),
                          (DC.calculator(widget.player.getHealth(),
                              widget.player.getDefense())),
                          (AC.calculator(
                              warrior.getAttack(), warrior.getSpeed())),
                          (DC.calculator(
                              warrior.getHealth(), warrior.getDefense())));
                      if (result["fightResult"] == true) {
                        setState(() {
                          warriorIsBeaten = result["fightResult"];
                          message = "You won the fight !";
                          checkAllBeaten(context);
                        });
                      } else {
                        setState(() {
                          message = "You lost the fight !";
                        });
                      }
                      var alert = AlertDialog(
                        title: Text("Fighting with Warrior"),
                        content: Container(
                          width: double.maxFinite,
                          height: 300,
                          child: Column(
                            children: <Widget>[
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: result["fightLog"].length,
                                itemBuilder: (context, index) {
                                  return Text(
                                    result["fightLog"][index],
                                  );
                                },
                              ),
                              SizedBox(height: 20),
                              Text(message),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("Close"))
                        ],
                      );
                      showDialog(
                          context: context,
                          builder: (BuildContext context) => alert);
                    } else {
                      ErrorDialog(context);
                    }
                  },
                  child: Text("Fight with Warrior"))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Container(
                width: 300,
                height: 300,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    "https://static.wikia.nocookie.net/darksouls/images/e/eb/Undead_Assassin.jpg/revision/latest?cb=20121005153643",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (!assassinIsBeaten) {
                      var result = FW.fightWith(
                          (AC.calculator(widget.player.getAttack(),
                              widget.player.getSpeed())),
                          (DC.calculator(widget.player.getHealth(),
                              widget.player.getDefense())),
                          (AC.calculator(
                              assassin.getAttack(), assassin.getSpeed())),
                          (DC.calculator(
                              assassin.getHealth(), assassin.getDefense())));
                      if (result["fightResult"] == true) {
                        setState(() {
                          assassinIsBeaten = result["fightResult"];
                          message = "You won the fight !";
                          checkAllBeaten(context);
                        });
                      } else {
                        setState(() {
                          message = "You lost the fight !";
                        });
                      }
                      var alert = AlertDialog(
                        title: Text("Fighting with Assassin"),
                        content: Container(
                          width: double.maxFinite,
                          height: 300,
                          child: Column(
                            children: <Widget>[
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: result["fightLog"].length,
                                itemBuilder: (context, index) {
                                  return Text(
                                    result["fightLog"][index],
                                  );
                                },
                              ),
                              SizedBox(height: 20),
                              Text(message),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("Close"))
                        ],
                      );
                      showDialog(
                          context: context,
                          builder: (BuildContext context) => alert);
                    } else {
                      ErrorDialog(context);
                    }
                  },
                  child: Text("Fight with Assassin"))
            ],
          ),
        ),
      ],
    );
  }
}

void ErrorDialog(context) {
  var alert = AlertDialog(
    title: Text("Error !"),
    content: IntrinsicWidth(
      child: IntrinsicHeight(
        child: Column(
          children: <Widget>[
            Text("You've already beat this boss !"),
          ],
        ),
      ),
    ),
    actions: <Widget>[
      TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("Close"))
    ],
  );
  showDialog(context: context, builder: (BuildContext context) => alert);
}
