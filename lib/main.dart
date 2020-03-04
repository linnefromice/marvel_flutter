import 'package:flutter/material.dart';
import 'package:marvel_flutter/blocs/main_screen_bloc.dart';
import 'package:marvel_flutter/screens/MainScreen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marvel App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Provider<MainScreenBloc> (
        create: (context) => MainScreenBloc(),
        dispose: (context, bloc) => bloc.dispose(),
        child: MainScreen(),
      ),
    );
  }
}
