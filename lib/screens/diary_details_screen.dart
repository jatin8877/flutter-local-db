import 'package:flutter/material.dart';
import 'package:path/path.dart';

class UserDetailesScreen extends StatefulWidget {
  static const String routeName = '/UserDetailsScreen';
  const UserDetailesScreen({Key? key}) : super(key: key);

  @override
  State<UserDetailesScreen> createState() => _UserDetailesScreenState();
}

class _UserDetailesScreenState extends State<UserDetailesScreen> {
  @override
  Widget build(BuildContext context) {
    // final args =
    //     ModalRoute.of(context)!.settings.arguments as UserDetailesScreen;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome Back'),
      ),
    );
  }
}
