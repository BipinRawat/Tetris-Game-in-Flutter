import 'package:flutter/material.dart';
import 'package:tetris_game/Gamer%20Widgets/gamer.dart';
import '../main.dart';
import 'game_controllers.dart';
import 'game_screen.dart';

class PortRaitGameScreen extends StatefulWidget {
  final int points;

  const PortRaitGameScreen({Key key, this.points}) : super(key: key);
  @override
  _PortRaitGameScreenState createState() => _PortRaitGameScreenState();
}

class _PortRaitGameScreenState extends State<PortRaitGameScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenW = size.width * 0.88;

    return SizedBox.expand(

      child: Container(
        color: BACKGROUND_COLOR,
        child: Padding(
          padding: MediaQuery.of(context).padding,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                // Text(
                //  "POINTS :" + GameState.of(context).points.toString()
                // ),
                Padding(
                  padding: const EdgeInsets.only(top:8.0),
                  child: _ScreenDecoration(
                      child: Screen(width: screenW)      ///   Main SCREEEEEEEEEEENNNNNNNNNNNNN
                  ),
                ),
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02
                ),
                GameController(),         /// BOTTOM BUTTONSSSSSSSSSSSSSSSSSSSSSSSS
                // SingleChildScrollView(child: Text("Points", style: TextStyle(fontWeight: FontWeight.bold))),
                // SizedBox(height: 4),
                // Number(number: GameState.of(context).points),
              ],
            ),
          ),
        ),
      ),

    );
  }
}

class _ScreenDecoration extends StatelessWidget {
  final Widget child;

  const _ScreenDecoration({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
              color: const Color(0xFFfae36c),
              width: SCREEN_BORDER_WIDTH),
          left: BorderSide(
              color: const Color(0xFF987f0f), width: SCREEN_BORDER_WIDTH),
          right: BorderSide(
              color: const Color(0xFF987f0f),
              width: SCREEN_BORDER_WIDTH),
          bottom: BorderSide(
              color: const Color(0xFFfae36c), width: SCREEN_BORDER_WIDTH),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black54)),
        child: Container(
          padding: const EdgeInsets.all(3),
          color: SCREEN_BACKGROUND,
          child: child,
        ),
      ),
    );
  }
}