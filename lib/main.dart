import 'package:flutter/material.dart';
import 'package:quick_actions/quick_actions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      themeMode: ThemeMode.system,
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const DashBoard(),
    );
  }
}

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {

  QuickActions quickActions = const QuickActions(); //initializing

  void _navigate(Widget screen) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => screen));
  } // navigation method

  @override
  void initState() {
    quickActions.initialize((type) {
      switch(type) {
        case 'red':
          return _navigate(ColorScreen(color: type));
        case 'green':
          return _navigate(ColorScreen(color: type));
        case 'blue':
          return _navigate(ColorScreen(color: type));
      }
    }); // Adding functionality to the shortcuts

    quickActions.setShortcutItems([
      const ShortcutItem(
        type: 'red',
        localizedTitle: 'Red Screen',
        icon: 'red_icon',
      ),
      const ShortcutItem(
        type: 'green',
        localizedTitle: 'Green Screen',
        icon: 'green_icon',
      ),
      const ShortcutItem(
        type: 'blue',
        localizedTitle: 'Blue Screen',
        icon: 'blue_icon',
      ),
    ]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                _navigate(const ColorScreen(color: 'red'));
              },
              child: Container(
                height: 150.0,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.red[900],
                ),
                child: Text(
                  'RED',
                  style: TextStyle(
                    color: Colors.red[300],
                    fontWeight: FontWeight.w500,
                    fontSize: 30.0,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                _navigate(const ColorScreen(color: 'green'));
              },
              child: Container(
                height: 150.0,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.green[900],
                ),
                child: Text(
                  'GREEN',
                  style: TextStyle(
                    color: Colors.green[300],
                    fontWeight: FontWeight.w500,
                    fontSize: 30.0,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                _navigate(const ColorScreen(color: 'blue'));
              },
              child: Container(
                height: 150.0,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.blue[900],
                ),
                child: Text(
                  'BLUE',
                  style: TextStyle(
                    color: Colors.blue[300],
                    fontWeight: FontWeight.w500,
                    fontSize: 30.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class ColorScreen extends StatefulWidget {

  final String color;

  const ColorScreen({Key? key, required this.color}) : super(key: key);

  @override
  State<ColorScreen> createState() => _ColorScreenState();
}

class _ColorScreenState extends State<ColorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.color == 'red' ? Colors.red[900] : widget.color == 'green' ? Colors.green[900] : Colors.blue[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Text(
          widget.color == 'red' ? 'Red\nScreen' : widget.color == 'green' ? 'Green\nScreen' : 'Blue\nScreen',
          style: TextStyle(
            fontSize: 40.0,
            fontWeight: FontWeight.w500,
            color: widget.color == 'red' ? Colors.red[300] : widget.color == 'green' ? Colors.green[300] : Colors.blue[300],
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}


