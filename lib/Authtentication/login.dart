import 'package:flutter/material.dart';
import 'package:login_app_project/Authtentication/signup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final username = TextEditingController();
  final password = TextEditingController();

  bool isVisiable = false;

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: formKey,
              child: Column(children: [
                // IMAGE ><><><><><><
                Image.asset(
                  "lib/assets/main.png",
                  width: 210,
                ),
                const SizedBox(
                  height: 15,
                ),
                //  USERNMAE ??????????
                Container(
                  margin: const EdgeInsets.all(8),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromARGB(255, 211, 139, 13).withOpacity(.2)),
                  child: TextFormField(
                    controller: username,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Username is required";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      border: InputBorder.none,
                      hintText: "UserName",
                    ),
                  ),
                ),

                // PASSWORD !!!!!!!!!!!!!!!
                Container(
                  margin: const EdgeInsets.all(8),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromARGB(255, 211, 139, 13).withOpacity(.2)),
                  child: TextFormField(
                    controller: password,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password is required";
                      }
                      return null;
                    },
                    obscureText: !isVisiable,
                    decoration: InputDecoration(
                        icon: const Icon(Icons.lock),
                        border: InputBorder.none,
                        hintText: "Password",
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isVisiable = !isVisiable;
                              });
                            },
                            icon: Icon(isVisiable
                                ? Icons.visibility_off
                                : Icons.visibility))),
                  ),
                ),

                // BUTTON ''''''''''''''''
                const SizedBox(
                  height: 10,
                ),
                Container(
                    height: 55,
                    width: MediaQuery.of(context).size.width * .9,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color.fromARGB(255, 155, 101, 7)),
                    child: TextButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            // login method
                          }
                        },
                        child: const Text("LOGIN",
                            style: TextStyle(
                              color: Colors.white,
                            )))),

                //SIGN UP BUTTON ********************
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account ?"),
                    TextButton(
                        onPressed: () {
                          // navgator to sig in
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SigUpScreen()));
                        },
                        child: const Text("SIGN UP"))
                  ],
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
