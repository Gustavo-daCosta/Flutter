import 'package:flutter/material.dart';
import 'signup_page.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  String _email = "";
  String _password = "";

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(
            top: 60,
            bottom: 40,
            left: 20,
            right: 20,
          ),
          child: Column(
            children: <Widget>[
              Container(
                height: 405,
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(1, 2.0),
                        blurRadius: 5,
                        spreadRadius: 1)
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 30,
                    left: 15,
                    right: 15,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Text(
                                  "Welcome",
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                                Text(
                                  "Sign in to continue",
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                              ],
                            ),
                            TextButton(
                              child: Text(
                                "Sign up",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignupPage(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          // autofocus: true,
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: Theme.of(context).textTheme.subtitle2?.color,
                          decoration: InputDecoration(
                              labelText: "Email",
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor)),
                              labelStyle: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              )),
                          style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context).primaryColor,
                          ),
                          validator: (value) {
                            if (value != null) {
                              if (value.isEmpty) {
                                return "Invalid E-mail";
                              }
                            }
                            return null;
                          },
                          onSaved: (input) => _email = input!,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          // autofocus: true,
                          keyboardType: TextInputType.emailAddress,
                          obscureText: true,
                          cursorColor: Theme.of(context).textTheme.subtitle2?.color,
                          decoration: InputDecoration(
                              labelText: "Password",
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor)
                              ),
                              labelStyle: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              )),
                          style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context).primaryColor,
                          ),
                          validator: (value) {
                            if (value != null) {
                              if (value.isEmpty) {
                                return "Invalid Password";
                              }
                            }
                            return null;
                          },
                          onSaved: (input) => _password = input!,
                        ),
                        Container(
                          height: 40,
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            child: Text(
                              "Forgot your password?",
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                            onPressed: () {},
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                            child: TextButton(
                              style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white)),
                              child: const Text("Sign in"),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text("Welcome, $_email"),
                                  ));
                                }
                              },
                            ))
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: const Text(
                  "- OR -",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2.0,
                    color: Theme.of(context).primaryColor,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                ),
                child: TextButton(
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        height: 24,
                        width: 100,
                        child: Image.asset(
                          "assets/google.png",
                        ),
                      ),
                      Text(
                        "Sign In with Google",
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ],
                  ),
                  onPressed: () {},
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2.0,
                    color: Theme.of(context).primaryColor,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                ),
                child: TextButton(
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        height: 24,
                        width: 100,
                        child: Image.asset(
                          "assets/facebook.png",
                        ),
                      ),
                      Text(
                        "Sign In with Facebook",
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ],
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
