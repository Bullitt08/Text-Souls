class FightWith {
  Map<String, dynamic> fightWith(double ap1, double dp1, double ap2, double dp2) {
    List<String> fightLog = [];
    bool fightResult = false;
    while (dp2 > 0 && dp1 > 0) {
      dp2 -= ap1;
      dp1 -= ap2;
      fightLog.add("Enemy's DP = $dp2");
      fightLog.add("Your DP = $dp1");
      print("fightLog: $fightLog");
    }

    if (dp2 <= 0) {
      fightResult = true;
    } else if (dp1 <= 0) {
      fightResult = false;
    } else if (dp1 <= 0 && dp2 <= 0) {
      fightResult = false;
    }

    return {"fightResult": fightResult, "fightLog": fightLog};
  }
}
