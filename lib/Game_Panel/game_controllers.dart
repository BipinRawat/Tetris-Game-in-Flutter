import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:tetris_game/Gamer%20Widgets/gamer.dart';
import 'package:tetris_game/service/admob.dart';
import 'package:tetris_game/service/service.dart';

class GameController extends StatefulWidget {
  @override
  _GameControllerState createState() => _GameControllerState();
}

class _GameControllerState extends State<GameController> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: 300,
        child: Column(
          children: <Widget>[
            Expanded(child: LeftController()

                ///Start Pause Reset/////////////////////////////////////////
                ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  DropButton(),
                  ///DROP BUTTON /////////////////////////////////////////
                  SizedBox(width: MediaQuery.of(context).size.width * 0.17),
                  DirectionController(),

                  ///Up Down Left Right /////////////////////////////////////////////
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const Size _DIRECTION_BUTTON_SIZE = const Size(48, 48);

const double _DIRECTION_SPACE = 16;

const double _iconSize = 16;

/////////////////////////////////////////////////////////////////////////////////////////////

class DirectionController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        SizedBox.fromSize(size: _DIRECTION_BUTTON_SIZE * 2.8),
        Transform.rotate(
          angle: math.pi / 4,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Transform.scale(
                    scale: 1.5,
                    child: Transform.rotate(
                        angle: -math.pi / 4,
                        child: Icon(
                          Icons.arrow_drop_up,
                          size: _iconSize,
                        )),
                  ),
                  Transform.scale(
                    scale: 1.5,
                    child: Transform.rotate(
                        angle: -math.pi / 4,
                        child: Icon(
                          Icons.arrow_right,
                          size: _iconSize,
                        )),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Transform.scale(
                    scale: 1.5,
                    child: Transform.rotate(
                        angle: -math.pi / 4,
                        child: Icon(
                          Icons.arrow_left,
                          size: _iconSize,
                        )),
                  ),
                  Transform.scale(
                    scale: 1.5,
                    child: Transform.rotate(
                        angle: -math.pi / 4,
                        child: Icon(
                          Icons.arrow_drop_down,
                          size: _iconSize,
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
        Transform.rotate(
          angle: math.pi / 4,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: _DIRECTION_SPACE),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Game.of(context).rotate();
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 40,
                      child: Transform.rotate(
                          angle: -math.pi / 4,
                          child:
                          Icon(Icons.arrow_upward_rounded)),
                        //  Text("UP")),
                    ),
                  ),
                  SizedBox(width: _DIRECTION_SPACE),
                  GestureDetector(
                    onTap: () {
                      Game.of(context).right();
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 40,
                      child: Transform.rotate(
                          angle: -math.pi / 4,
                          child:
                          Icon(Icons.arrow_forward_rounded)),
                         // Text("Right")),
                    ),
                  ),
                ],
              ),
              SizedBox(height: _DIRECTION_SPACE),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Game.of(context).left();
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 40,
                      child: Transform.rotate(
                          angle: -math.pi / 4,
                          child:
                          Icon(Icons.arrow_back_rounded)),
                        //  Text("Left")),
                    ),
                  ),
                  SizedBox(width: _DIRECTION_SPACE),
                  GestureDetector(
                    onLongPress: () => Game.of(context).drop(),
                    onTap: () {
                      Game.of(context).down();
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 40,
                      child: Transform.rotate(
                          angle: -math.pi / 4,
                          
                          
                          child: 
                          Icon(Icons.arrow_downward)),
                        //  Text("Down")),
                    ),
                  ),
                ],
              ),
              SizedBox(height: _DIRECTION_SPACE),
            ],
          ),
        ),
      ],
    );
  }
}

///////////////////////////////////////////////////////////////////////////////////////////////

class SystemButtonGroup extends StatefulWidget {
  static const _systemButtonColor = const Color(0xFF2dc421);

  @override
  _SystemButtonGroupState createState() => _SystemButtonGroupState();
}

class _SystemButtonGroupState extends State<SystemButtonGroup> {
  AdmobHelper admobHelper = new AdmobHelper();


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _Description(
            text: "Sounds", ///////////////soundddddddddddddd
            child: GestureDetector(
              onTap: () {
                Game.of(context).soundSwitch();
              },
              child: CircleAvatar(
                backgroundColor: Colors.black,
                radius: 25,
                child: Icon(
                  Icons.volume_mute_outlined,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            )),
        _Description(
            text: "Pause_Resume",
            child: GestureDetector(
              onTap: () async {
                Game.of(context).pauseOrResume();
              },
              child: CircleAvatar(
                backgroundColor: Colors.black,
                radius: 25,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                      ),
                      Icon(
                        Icons.pause_circle_filled,
                        color: Colors.white,
                      ),
                    ]),
              ),
            )),
        _Description(
            text: "Reset",
            child: GestureDetector(
              onTap: () {
    admobHelper.createInterad();   // call create Interstitial ads
    admobHelper.showInterad();     // call  show Interstitial ads
        //     AdmobService.showInterstitialAd();
                Game.of(context).reset();
              },
              child: CircleAvatar(
                backgroundColor: Colors.black,
                radius: 25,
                child: Icon(
                  Icons.refresh,
                  size: 25,
                  color: Colors.white,
                ),
              ),
            ))
      ],
    );
  }
}

class DropButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Game.of(context).drop();
      },
      child: _Description(
        text: 'Drop',
        child: CircleAvatar(
          backgroundColor: Colors.black,
          radius: 45,
          child: Icon(
            Icons.arrow_drop_down_circle,
            size: 70,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class LeftController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SystemButtonGroup(),
      ],
    );
  }
}

class _Button extends StatefulWidget {
  final Size size;
  final Widget icon;

  final VoidCallback onTap;

  ///the color of button
  final Color color;

  final bool enableLongPress;

  const _Button(
      {Key key,
      @required this.size,
      @required this.onTap,
      this.icon,
      this.color = Colors.blue,
      this.enableLongPress = true})
      : super(key: key);

  @override
  _ButtonState createState() {
    return new _ButtonState();
  }
}

///show a hint text for child widget
class _Description extends StatelessWidget {
  final String text;

  final Widget child;

  final AxisDirection direction;

  const _Description({
    Key key,
    this.text,
    this.direction = AxisDirection.down,
    this.child,
  })  : assert(direction != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget widget;
    switch (direction) {
      case AxisDirection.right:
        widget = Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[child, SizedBox(width: 8), Text(text),]);
        break;
      case AxisDirection.left:
        widget = Row(
          children: <Widget>[Text(text), SizedBox(width: 8), child],
          mainAxisSize: MainAxisSize.min,
        );
        break;
      case AxisDirection.up:
        widget = Column(
          children: <Widget>[Text(text), SizedBox(height: 8), child],
          mainAxisSize: MainAxisSize.min,
        );
        break;
      case AxisDirection.down:
        widget = Column(
          children: <Widget>[child, SizedBox(height: 8), Text(text)],
          mainAxisSize: MainAxisSize.min,
        );
        break;
    }
    return DefaultTextStyle(
      child: widget,
      style: TextStyle(fontSize: 15, color: Colors.black,fontWeight: FontWeight.bold),
    );
  }
}

class _ButtonState extends State<_Button> {
  Timer _timer;

  bool _tapEnded = false;

  Color _color;

  @override
  void didUpdateWidget(_Button oldWidget) {
    super.didUpdateWidget(oldWidget);
    _color = widget.color;
  }

  @override
  void initState() {
    super.initState();
    _color = widget.color;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: _color,
      elevation: 2,
      shape: CircleBorder(),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: (_) async {
          setState(() {
            _color = widget.color.withOpacity(0.5);
          });
          if (_timer != null) {
            return;
          }
          _tapEnded = false;
          widget.onTap();
          if (!widget.enableLongPress) {
            return;
          }
          await Future.delayed(const Duration(milliseconds: 300));
          if (_tapEnded) {
            return;
          }
          _timer = Timer.periodic(const Duration(milliseconds: 60), (t) {
            if (!_tapEnded) {
              widget.onTap();
            } else {
              t.cancel();
              _timer = null;
            }
          });
        },
        onTapCancel: () {
          _tapEnded = true;
          _timer?.cancel();
          _timer = null;
          setState(() {
            _color = widget.color;
          });
        },
        onTapUp: (_) {
          _tapEnded = true;
          _timer?.cancel();
          _timer = null;
          setState(() {
            _color = widget.color;
          });
        },
        child: SizedBox.fromSize(
          size: widget.size,
        ),
      ),
    );
  }
}
