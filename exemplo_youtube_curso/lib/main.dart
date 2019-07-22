import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:exemplo_youtube_curso/api.dart';
import 'package:exemplo_youtube_curso/blocs/videos_bloc.dart';
import 'package:exemplo_youtube_curso/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  Api api = Api();
  api.search("eletro");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: VideosBloc(),
      child: MaterialApp(
        title: 'fluttertube',
        debugShowCheckedModeBanner: false,
        home: Home(),
        ),
    );
  }
}