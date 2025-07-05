import 'package:flutter/material.dart';
import 'package:staj2/database/Player.dart';
import 'package:staj2/functions/Calculator.dart';
import 'package:staj2/functions/apCalculator.dart';
import 'package:staj2/functions/dpCalculator.dart';
import 'package:staj2/screens/fight.dart';

class WeaponSelection extends StatefulWidget {
  final Player player;
  final String playerName;

  const WeaponSelection(
      {super.key, required this.player, required this.playerName});
  @override
  State<WeaponSelection> createState() => _WeaponSelectionState();
}

class _WeaponSelectionState extends State<WeaponSelection> {
  apCalculator AC = apCalculator();
  dpCalculator DC = dpCalculator();
  String selectedWeapon = "";
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://static.wikia.nocookie.net/darksouls/images/4/4e/Shortsword_%28DSIII%29.png/revision/latest?cb=20160612043504"),
          ),
          title: Text("Sword"),
          onTap: () {
            var alert = AlertDialog(
              title: Text("Sword"),
              content: IntrinsicWidth(
                child: IntrinsicHeight(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Image.network(
                      "https://static.wikia.nocookie.net/darksouls/images/4/4e/Shortsword_%28DSIII%29.png/revision/latest?cb=20160612043504"),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Sword adds +2 attack point."),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedWeapon = "Sword";
                        });
                        Navigator.of(context).pop();
                      },
                      child: Text("Select"))
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
            showDialog(
                context: context, builder: (BuildContext context) => alert);
          },
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://static.wikia.nocookie.net/darksouls/images/b/bb/Lothric_Knight_Greatshield.png/revision/latest?cb=20160613083146"),
          ),
          title: Text("Shield"),
          onTap: () {
            var alert = AlertDialog(
              title: Text("Shield"),
              content: IntrinsicWidth(
                child: IntrinsicHeight(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Image.network(
                      "https://static.wikia.nocookie.net/darksouls/images/b/bb/Lothric_Knight_Greatshield.png/revision/latest?cb=20160613083146"),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Shield adds +2 defense point."),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedWeapon = "Shield";
                        });
                        Navigator.of(context).pop();
                      },
                      child: Text("Select"))
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
            showDialog(
                context: context, builder: (BuildContext context) => alert);
          },
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://static.wikia.nocookie.net/darksouls/images/0/08/Estus_Flask_%28DSIII%29_-_01.png/revision/latest?cb=20160613233757"),
          ),
          title: Text("Potion"),
          onTap: () {
            var alert = AlertDialog(
              title: Text("Potion"),
            content: IntrinsicWidth(
            child: IntrinsicHeight(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Image.network(
                      "https://static.wikia.nocookie.net/darksouls/images/0/08/Estus_Flask_%28DSIII%29_-_01.png/revision/latest?cb=20160613233757"),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Potion adds +1 health and speed point."),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedWeapon = "Potion";
                        });
                        Navigator.of(context).pop();
                      },
                      child: Text("Select"))
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
            showDialog(
                context: context, builder: (BuildContext context) => alert);
          },
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://ds3-cinders.wdfiles.com/local--files/image-set-equipment:censuring-palm/censuring-palm.png"),
          ),
          title: Text("None"),
          onTap: () {
            var alert = AlertDialog(
              title: Text("None"),
            content: IntrinsicWidth(
            child: IntrinsicHeight(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Image.network(
                      "https://ds3-cinders.wdfiles.com/local--files/image-set-equipment:censuring-palm/censuring-palm.png"),
                  SizedBox(
                    height: 20,
                  ),
                  Text("It does not do anything because your hands are empty."),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedWeapon = "None";
                        });
                        Navigator.of(context).pop();
                      },
                      child: Text("Select"))
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
            showDialog(
                context: context, builder: (BuildContext context) => alert);
          },
        ),
        Expanded(
          child: Container(
            alignment: Alignment.center,
          ),
        ),
        Column(
          children: <Widget>[
            Text("Selected item: " + selectedWeapon),
            ElevatedButton(
              onPressed: () {
                widget.player.setWeapon(selectedWeapon);
                var alert = AlertDialog(
                  title: Text(widget.playerName + "'s stats"),
                  content: IntrinsicWidth(
                    child: IntrinsicHeight(
                      child: Column(
                        children: <Widget>[
                          Text("Your stats: \n"),
                          Text("Health: ${widget.player.getHealth()}"),
                          Text("Attack: ${widget.player.getAttack()}"),
                          Text("Defense: ${widget.player.getDefense()}"),
                          Text("Speed: ${widget.player.getSpeed()}"),
                          Text("Weapon: ${widget.player.getWeapon()}"),
                          Text(
                              "AP: ${AC.calculator(widget.player.getAttack(), widget.player.getSpeed())}"),
                          Text(
                              "DP: ${DC.calculator(widget.player.getHealth(), widget.player.getDefense())}"),
                          SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context)=> Fight(player: widget.player, playerName: widget.playerName)),
                                );
                              }, child: Text("Continue"))
                        ],
                      ),
                    ),
                  ),
                );
                showDialog(
                    context: context, builder: (BuildContext context) => alert);
              },
              child: Text('Continue'),
            ),
          ],
        ),
      ],
    );
  }
}
