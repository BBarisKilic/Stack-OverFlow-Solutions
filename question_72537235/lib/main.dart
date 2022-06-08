import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

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
          textSelectionTheme: const TextSelectionThemeData(
            selectionHandleColor: Colors.transparent,
          ),
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
  final Key key = const Key('key');
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController =
      TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Form(
              key: key,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    EmailTextFormField(
                      controller: emailController,
                    ),
                    TextFormField(
                      controller: passwordController,
                    ),
                    TextFormField(
                      controller: passwordConfirmationController,
                    ),
                    TextFormField(
                      controller: passwordConfirmationController,
                    ),
                    TextFormField(
                      controller: passwordConfirmationController,
                    ),
                    TextFormField(
                      controller: passwordConfirmationController,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: TextButton(
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                        },
                        child: const Text('Next'),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 2.75,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}

class EmailTextFormField extends StatelessWidget {
  const EmailTextFormField({Key? key, required this.controller})
      : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) => Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(
              Icons.mail_outline,
              color: Colors.black,
            ),
          ),
          Expanded(
            child: AutofillGroup(
              child: PlatformTextFormField(
                hintText: 'email',
                controller: controller,
                //focusNode: _focusNode,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                autofillHints: const [AutofillHints.email],
                //onFieldSubmitted: (_) => _focusNode.nextFocus(),
                validator: (_) => null,
                material: (_, __) => MaterialTextFormFieldData(
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    labelText: 'email',
                    suffixIcon: controller.text.isNotEmpty
                        ? const Icon(Icons.cancel)
                        : null,
                  ),
                ),
                cupertino: (_, __) => CupertinoTextFormFieldData(
                  textInputAction: TextInputAction.next,
                  //focusNode: _focusNode,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
}
