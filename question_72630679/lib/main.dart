import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: const SignupProfileImage(),
      );
}

class SignupProfileImage extends StatefulWidget {
  const SignupProfileImage({Key? key}) : super(key: key);

  @override
  State<SignupProfileImage> createState() => _SignupProfileImageState();
}

class _SignupProfileImageState extends State<SignupProfileImage> {
  bool isUploadImage = false;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
            width: 100,
            child: ClipOval(
              child: Image.asset(
                'assets/face.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      );
}
