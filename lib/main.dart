import 'package:appartment_tinder/screens/Login.dart';
import 'package:flutter/material.dart';

import 'Style/colors.dart';
import 'model/top_navigation_item.dart';
import 'screens/profile_screen.dart';
import 'screens/chat_screen.dart';
import 'screens/swipe_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TindeRush",
      theme: _theme(), // initialRoute: LoginScreen.idScreen,
      initialRoute: MainScreen.id,

      routes: {
        // '/': (context) => LoginScreen(),
        MainScreen.id: (context) => MainScreen(),
        ProfileScreen.id: (context) => ProfileScreen(),
        ChatScreen.id: (context) => ChatScreen(),
        MatchScreen.id: (context) => MatchScreen(),
        LoginScreen.id: (context) => LoginScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

ThemeData _theme() {
  return ThemeData(
    fontFamily: kFontFamily,
    buttonColor: kAccentColor,
    indicatorColor: kAccentColor,
    scaffoldBackgroundColor: kPrimaryColor,
    hintColor: kSecondaryColor,
    textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      headline2: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
      headline3: TextStyle(fontSize: 38.0, fontWeight: FontWeight.bold),
      headline4: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
      bodyText1: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      bodyText2: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
      button: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
    ).apply(
      bodyColor: kSecondaryColor,
      displayColor: kSecondaryColor,
    ),
    buttonTheme: const ButtonThemeData(
      splashColor: Colors.transparent,
      padding: EdgeInsets.symmetric(vertical: 14),
      buttonColor: kAccentColor,
      textTheme: ButtonTextTheme.accent,
      highlightColor: Color.fromRGBO(0, 0, 0, .3),
      focusColor: Color.fromRGBO(0, 0, 0, .3),
    ),
    colorScheme: ColorScheme.fromSwatch(
            primarySwatch:
                const MaterialColor(kBackgroundColorInt, kThemeMaterialColor))
        .copyWith(secondary: kSecondaryColor),
  );
}

class MainScreen extends StatelessWidget {
  static const String id = 'main';

  final List<TopNavigationItem> navigationItems = [
    TopNavigationItem(
      screen: ProfileScreen(),
      iconData: Icons.person,
    ),
    TopNavigationItem(
      screen: ChatScreen(),
      iconData: Icons.message_rounded,
    ),
    TopNavigationItem(
      screen: MatchScreen(),
      iconData: Icons.favorite,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var tabBar = TabBar(
      tabs: navigationItems
          .map((navItem) => Container(
              height: double.infinity,
              child: Tab(icon: Icon(navItem.iconData, size: 26))))
          .toList(),
    );

    var appBar = AppBar(flexibleSpace: tabBar);

    // todo better tab controller
    return DefaultTabController(
      length: navigationItems.length,
      child: SafeArea(
        child: Scaffold(
          appBar: appBar,
          body: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height -
                  tabBar.preferredSize.height -
                  appBar.preferredSize.height,
              width: MediaQuery.of(context).size.width,
              child: Container(
                child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: navigationItems
                        .map((navItem) => navItem.screen)
                        .toList()),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
