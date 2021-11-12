import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:native_admob_flutter/native_admob_flutter.dart';
import 'package:tetris_game/Game_Panel/portrait_game_page.dart';
import 'package:tetris_game/service/service.dart';
import 'Game Materials/game_sound.dart';
import 'Game_Panel/landscape_game_page.dart';
import 'Gamer Widgets/gamer.dart';
import 'Gamer Widgets/keyboard.dart';


void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await MobileAds.initialize();
  // debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  // _disableDebugPrint();
  // final AppOpenAd appOpenAd = AppOpenAd();
  // if (!appOpenAd.isAvailable)
  //   await appOpenAd.load(unitId: 'ca-app-pub-3940256099942544/3419835294');
  //   await appOpenAd.load(unitId: MobileAds.appOpenAdTestUnitId);
  // if (appOpenAd.isAvailable) {
  //   await appOpenAd.show();
  // }
  runApp(MyApp());
}

void _disableDebugPrint() {
  bool debug = false;
  assert(() {
    debug = true;
    return true;
  }());
  if (!debug) {
    debugPrint = (String message, {int wrapWidth}) {
      //disable log print when not in debug mode
    };
  }
}

final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cyno Tetris',
      // localizationsDelegates: [S.delegate, GlobalMaterialLocalizations.delegate, GlobalWidgetsLocalizations.delegate],
      navigatorObservers: [routeObserver],
      //  supportedLocales: S.delegate.supportedLocales,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Sound(child: Game(child: KeyboardController(child: _HomePage()))),
      ),
    );
  }
}

const SCREEN_BORDER_WIDTH = 3.0;

// const BACKGROUND_COLOR = const Color(0xffefcc19);
const BACKGROUND_COLOR = Colors.cyanAccent;


class _HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //only Android/iOS support land mode
    bool land = MediaQuery.of(context).orientation == Orientation.landscape;
    return land ? LandScapeGameScreen() : PortRaitGameScreen();
  }
}