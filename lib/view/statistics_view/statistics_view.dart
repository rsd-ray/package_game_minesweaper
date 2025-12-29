import 'package:flutter/material.dart';

import '../../utils/game_colors.dart';
import '../../utils/game_consts.dart';
import '../../utils/game_sizes.dart';
import 'stats_table.dart';

class StatisticsView extends StatelessWidget {
  const StatisticsView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: GameColors.background,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: GameColors.darkBlue,
          title: Text("Statistics"),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: GameSizes.getWidth(0.055),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          bottom: TabBar(
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 2,
            tabs: [
              Tab(text: 'Easy'),
              Tab(text: 'Medium'),
              Tab(text: 'Hard'),
            ],
            labelStyle: TextStyle(
              letterSpacing: 2,
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: GameSizes.getWidth(0.04),
            ),
            unselectedLabelStyle: const TextStyle(color: Colors.white60),
          ),
        ),
        body: const TabBarView(children: [
          StatsTable(gameMode: GameMode.easy),
          StatsTable(gameMode: GameMode.medium),
          StatsTable(gameMode: GameMode.hard),
        ]),
      ),
    );
  }
}
