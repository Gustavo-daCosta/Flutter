import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 222, 222, 222),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // android logo
          const Padding(
            padding: EdgeInsets.only(top: 160, bottom: 80),
            child: Icon(
              Icons.android,
              size: 120,
            ),
          ),
          
          // Hello message and subtitle
          const Text(
            "HELLO AGAIN!",
            style: TextStyle(
              color: Colors.black87,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            "Welcome back, you've been missed!",
            style: TextStyle(
              color: Colors.black38,
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 20,
            ),
            child: Column(
              children: [
                // email input
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 236, 236, 236),
                    border: Border.all(
                      color: Colors.white,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: "Email",
                      fillColor: Color.fromARGB(255, 236, 236, 236),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                // password input
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 236, 236, 236),
                    border: Border.all(
                      color: Colors.white,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    decoration: const InputDecoration(
                      hintText: "Password",
                      fillColor: Color.fromARGB(255, 236, 236, 236),
                    ),
                  ),
                ),

                // Sign in button


                // Register Button

                
              ],
            ),
          )
        ],
      ),
    );
  }
}
