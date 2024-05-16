import 'package:flutter/material.dart';
import 'package:login_app_project/Authtentication/login.dart';

class SigUpScreen extends StatefulWidget {
  const SigUpScreen({super.key});

  @override
  State<SigUpScreen> createState() => _SigUpScreenState();
}

class _SigUpScreenState extends State<SigUpScreen> {
  final username = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  bool isVisiable = false;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const ListTile(
                  title: Text("Register New Account",
                      style:
                          TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
                ),

                Container(
                  margin: const EdgeInsets.all(8),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromARGB(255, 211, 139, 13)
                          .withOpacity(.2)),
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
                      color: const Color.fromARGB(255, 211, 139, 13)
                          .withOpacity(.2)),
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

                // confirmation Password +-+-+-+-+--+---+-+--
                Container(
                  margin: const EdgeInsets.all(8),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromARGB(255, 211, 139, 13)
                          .withOpacity(.2)),
                  child: TextFormField(
                    controller: confirmPassword,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "confirm Password is required";
                      } else if (password.text != confirmPassword.text) {
                        return "password don't match";
                      }
                      return null;
                    },
                    obscureText: !isVisiable,
                    decoration: InputDecoration(
                        icon: const Icon(Icons.lock),
                        border: InputBorder.none,
                        hintText: "confirm Password",
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
                        child: const Text("SIG UP",
                            style: TextStyle(
                              color: Colors.white,
                            )))),

                //SIGN UP BUTTON ********************
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account ?"),
                    TextButton(
                        onPressed: () {
                          // navgator to sig in
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        },
                        child: const Text("LOG IN"))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
