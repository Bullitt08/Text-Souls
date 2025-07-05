import 'package:flutter/material.dart';
import 'package:staj2/database/Player.dart';
import 'package:staj2/screens/weapons.dart';

class Game extends StatefulWidget {
  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  Player player = new Player();
  final formKey = GlobalKey<FormState>();
  int totalPoints = 50;
  String playerName = " ";

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
              child: Text(
                playerName.isEmpty ? '' : playerName,
              ),
            ),
          ),
        ],
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Center(
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Enter your name"),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Your Name",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
              onSaved: (value) {
                setState(() {
                  playerName = value!;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState != null) {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    showStatSliders(context);
                  }
                }
              },
              child: Text("Continue"),
            ),
          ],
        ),
      ),
    );
  }

  void showStatSliders(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: Text("Set Character Stats"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                      "Remaining Points: ${totalPoints - (player.health + player.attack + player.defense + player.speed)}"),
                  buildStatSlider("Health", player.health,
                      (double value) {
                    setState(() {
                      player.health=value;
                    });
                    checkTotalPoints();
                  }),
                  buildStatSlider("Attack", player.attack,
                      (double value) {
                    setState(() {
                      player.attack = value;
                    });
                    checkTotalPoints();
                  }),
                  buildStatSlider("Defense", player.defense,
                      (double value) {
                    setState(() {
                      player.defense = value;
                    });
                    checkTotalPoints();
                  }),
                  buildStatSlider("Speed", player.speed,
                      (double value) {
                    setState(() {
                      player.speed = value;
                    });
                    checkTotalPoints();
                  }),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    if (player.health + player.attack + player.defense + player.speed !=
                        totalPoints) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Warning"),
                            content: Text(
                                "Total points must be exactly $totalPoints"),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    } else if (player.health == 0 ||
                        player.attack == 0 ||
                        player.defense == 0 ||
                        player.speed == 0) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Warning"),
                            content: Text("Stats can't be 0"),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      player.setHealth(player.health);
                      player.setAttack(player.attack);
                      player.setDefense(player.defense);
                      player.setSpeed(player.speed);
                      Navigator.of(context).pop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WeaponSelection(player: player, playerName: playerName)),
                      );
                    }
                  },
                  child: Text('Save'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget buildStatSlider(
      String label, double value, ValueChanged<double> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        Slider(
          value: value,
          min: 0,
          max: totalPoints.toDouble(),
          divisions: totalPoints,
          onChanged: onChanged,
          label: value.toStringAsFixed(0),
        ),
      ],
    );
  }

  void checkTotalPoints() {
    if (player.health + player.attack + player.defense + player.speed > totalPoints) {
      // Reset values to keep totalPoints from exceeding 50
      player.health = 0;
      player.attack = 0;
      player.defense = 0;
      player.speed = 0;
      setState(() {});
    }
  }
}
