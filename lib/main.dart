import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_statenotifier_boilerplate/core/network_client.dart';
import 'package:flutter_riverpod_statenotifier_boilerplate/ui/screens/home/home.dart';

Future<void> main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await NetworkClient.init();
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Riverpod StateNotifier',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
