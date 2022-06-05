import 'package:flutter/material.dart';
import 'package:working_with_local_database/db/diarydatabase.dart';
import 'package:working_with_local_database/models/dictonary.dart';
import 'package:working_with_local_database/screens/login_diary_screen.dart';

class RegisterUserPage extends StatefulWidget {
  static const String routeName = '/Register';
  const RegisterUserPage({Key? key}) : super(key: key);

  @override
  State<RegisterUserPage> createState() => _RegisterUserPageState();
}

class _RegisterUserPageState extends State<RegisterUserPage> {
  var unameController = TextEditingController();
  var passwdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(8, 8, 8, 40),
              child: Text(
                'Add to DataBase!',
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
              child: Row(
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
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () async {
                          var username = unameController.text;
                          if (await DiaryDatabase.instance
                              .isUserExistes(username)) {
                            addUser();
                            Navigator.pushNamed(
                                context, LoginScreenPage.routeName);
                          } else {
                            showDialog(
                              context: context,
                              builder: (context) => const AlertDialog(
                                title: Text('Invalid User!'),
                                content: Text('User already exists.'),
                              ),
                            );
                          }
                        },
                        child: const Text('Register')),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future addUser() async {
    final add = Details(
        userName: unameController.text, password: passwdController.text);
    await DiaryDatabase.instance.registerUser(add);
  }
}
