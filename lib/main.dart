import 'package:bankboard/model/theme_changer.dart';
import 'package:bankboard/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'settings.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeChanger themeChangeProvider = ThemeChanger();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => themeChangeProvider,
      child: Consumer<ThemeChanger>(
        builder: (context, value, child) {
          return MaterialApp(
            theme: Styles.themeData(
              themeChangeProvider.darkTheme,
              context,
            ),
            home: const HomePage(),
          );
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const Settings();
                  },
                ),
              );
            },
            icon: const Icon(Icons.menu),
          ),
        ],
      ),
      body: const Center(
        child: Column(
          children: [
            Text(
              'Hello G',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
