import 'package:flutter/material.dart';
import 'package:working_with_local_database/db/diarydatabase.dart';
// import 'package:working_with_local_database/models/dictonary.dart';
import 'package:working_with_local_database/screens/diary_details_screen.dart';
import 'package:working_with_local_database/screens/register_user.dart';

class LoginScreenPage extends StatefulWidget {
  static const String routeName = 'mainScreen';
  const LoginScreenPage({Key? key}) : super(key: key);

  @override
  State<LoginScreenPage> createState() => _LoginScreenPageState();
}

class _LoginScreenPageState extends State<LoginScreenPage> {
  var unameController = TextEditingController();
  var passwdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: mounted,
        leading: const Icon(Icons.book),
        title: const Text('My Diary'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(8, 8, 8, 40),
              child: Text(
                'Login Diary!',
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            const Text(
              'User Name :',
              style: TextStyle(
                color: Colors.redAccent,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextFormField(
              controller: unameController,
              maxLines: 1,
              style: const TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0),
              decoration: const InputDecoration(
                hintText: 'eg. myname',
                hintStyle: TextStyle(
                    color: Color.fromARGB(153, 148, 148, 148), fontSize: 15),
              ),
              validator: (input) => input != null && input.isEmpty
                  ? 'Title cannot be empty'
                  : null,
            ),
            const SizedBox(
              height: 60,
            ),
            const Text(
              'Password :',
              style: TextStyle(
                color: Colors.redAccent,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextFormField(
              controller: passwdController,
              maxLines: 1,
              obscureText: true,
              style: const TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0),
              decoration: const InputDecoration(
                hintText: 'eg. abc123',
                hintStyle: TextStyle(
                    color: Color.fromARGB(153, 148, 148, 148), fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blueAccent,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          textStyle: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () async {
                          var username = unameController.text;
                          var password = passwdController.text;
                          var result = await DiaryDatabase.instance
                              .validateUser(username, password);
                          if (result) {
                            Navigator.pushNamed(
                                context, UserDetailesScreen.routeName,
                                arguments: username);
                          } else {
                            const AlertDialog(
                                semanticLabel: "Try using another Name!");
                          }
                        },
                        child: const Text('Login')),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blueAccent,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              textStyle: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, RegisterUserPage.routeName);
                            },
                            child: const Text('SignUp')),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
