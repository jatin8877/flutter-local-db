import 'package:flutter/material.dart';
import 'package:working_with_local_database/screens/diary_details_screen.dart';
import 'package:working_with_local_database/screens/login_diary_screen.dart';
import 'package:working_with_local_database/screens/register_user.dart';
// import 'package:working_with_local_database/screens/notes_page.dart';

// void main() {
//   runApp(
//     const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: MyNotesDbApp(),
//     ),
//   );
Future main() async {
  runApp(const MyNotesDbApp());
}
// }

class MyNotesDbApp extends StatelessWidget {
  const MyNotesDbApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.blueGrey.shade900,
        appBarTheme:
            const AppBarTheme(backgroundColor: Colors.red, elevation: 0),
      ),
      initialRoute: LoginScreenPage.routeName,
      routes: {
        LoginScreenPage.routeName: (context) => const LoginScreenPage(),
        UserDetailesScreen.routeName: (context) => const UserDetailesScreen(),
        RegisterUserPage.routeName: (context) => const RegisterUserPage(),
      },
    );
  }
}
