import 'package:flutter/material.dart';

import 'utils/game_routes.dart';
import 'utils/game_sizes.dart';

class GameMinesweaper extends StatelessWidget {
  const GameMinesweaper({super.key});

  @override
  Widget build(BuildContext context) {
    GameSizes.init(context);
    return MaterialApp(
      title: 'Minesweeper',
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: GameRoutes.generateRoute,
      initialRoute: GameRoutes.initialRoute,
      key: GameRoutes.navigatorKey,
    );
  }
}