import 'package:delivery/components/my_button.dart';
import 'package:delivery/components/my_textfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;

  const RegisterPage({super.key, required this.onTap}); 

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // Tentar resolver esse problema do teclado com SingleChildScrollView
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Logo
            Icon(
              Icons.fastfood_rounded,
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
      
            SizedBox(height: 35),
      
            // message, app slogan
            Text(
              "Food Delivery App",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
      
            const SizedBox(height: 25),
      
            // name texfield
            MyTextfield(
              controller: nameController,
              hintText: "Name",
            ),
      
            const SizedBox(height: 10),
      
            // email texfield
            MyTextfield(
              controller: emailController,
              hintText: "E-mail",
            ),
      
            const SizedBox(height: 10),
      
            // password textfield
            MyTextfield(
              controller: passwordController,
              hintText: "Password",
              obscureText: true,
            ),
      
            const SizedBox(height: 10),
      
            // confirm password textfield
            MyTextfield(
              controller: confirmPasswordController,
              hintText: "Confirm password",
              obscureText: true,
            ),
      
            const SizedBox(height: 25),
      
            // register button
            MyButton(
              text: "Register",
              onTap: () {},
            ),
      
            const SizedBox(height: 10),
      
            // not a member, register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already a member?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
      
                const SizedBox(width: 4),
      
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Sign In now",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}