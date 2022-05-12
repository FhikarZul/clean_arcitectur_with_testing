import 'package:clean_arcitectur_with_testing/injection.dart';
import 'package:clean_arcitectur_with_testing/presentation/page/post_list_page.dart';
import 'package:flutter/material.dart';

void main() {
  initInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PostListPage(),
    );
  }
}
