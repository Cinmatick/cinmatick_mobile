import 'package:cinmatick/Screens/SignIn_Screen/signin_screen.dart';
import 'package:cinmatick/Services/navigate_help.dart';
import 'package:cinmatick/Widgets/button.dart';
import 'package:cinmatick/Widgets/text_widget.dart';
import 'package:flutter/material.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  bool _ontrue = true;
  void _toggle() {
    setState(() {
      _ontrue = !_ontrue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 117, 117, 119),
            Colors.black,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.only(
                        left: 30, right: 30, top: 80, bottom: 10),
                    child: textInfo("Create New Password", FontWeight.w400,
                        Colors.white, 21, "numito")),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
                  child: textInfo("Create your new password", FontWeight.w400,
                      Colors.white, 14, "numito"),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: textInfo(
                      "Pasword", FontWeight.w400, Colors.white70, 17, "Roboto"),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
                  child: TextFormField(
                    obscureText: _ontrue,
                    obscuringCharacter: "*",
                    controller: password,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password cannot be empty";
                      }
                      return null;
                    },
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 0.8, color: Colors.white70),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 0.8, color: Colors.white70),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      prefixIcon: const Icon(Icons.lock, color: Colors.white70),
                      suffixIcon: InkWell(
                        onTap: (_toggle),
                        child: Icon(
                            _ontrue ? Icons.visibility_off : Icons.visibility,
                            color: Colors.white70),
                      ),
                      hintText: "Password",
                      hintStyle:
                          const TextStyle(fontSize: 13, color: Colors.white70),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
                  child: textInfo("Confirm Pasword", FontWeight.w400,
                      Colors.white70, 17, "Roboto"),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
                  child: TextFormField(
                    obscureText: _ontrue,
                    controller: confirmPassword,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password cannot be empty";
                      }
                      return null;
                    },
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 0.8, color: Colors.white70),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 0.8, color: Colors.white70),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      prefixIcon: const Icon(Icons.lock, color: Colors.white70),
                      prefixIconColor: Colors.white,
                      suffixIcon: InkWell(
                        onTap: (_toggle),
                        child: Icon(
                            _ontrue ? Icons.visibility_off : Icons.visibility,
                            color: Colors.white70),
                      ),
                      hintText: "Confirm Password",
                      hintStyle:
                          const TextStyle(fontSize: 13, color: Colors.white70),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
                  child: GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AlertDialog(
                                  title: const Center(child: Text('SUCCESS')),
                                  content: Center(
                                    child: textInfo(
                                        "You have successfully reset your \n                    password",
                                        FontWeight.w400,
                                        Colors.black,
                                        16,
                                        "Roboto"),
                                  ),
                                  actions: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 80, right: 80),
                                      child: GestureDetector(
                                        onTap: () {
                                          goTo(context, SignInScreen());
                                        },
                                        child: ButtonWidget(
                                          textColor: Colors.black,
                                          backgroundcolor: const Color.fromRGBO(
                                              255, 134, 50, 10),
                                          borderColor: Colors.transparent,
                                          text: "Sign in",
                                          icon: Icons.abc_rounded,
                                          size: 44,
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: ButtonWidget(
                      backgroundcolor: const Color.fromRGBO(255, 134, 50, 10),
                      size: 45,
                      text: 'Reset Password',
                      borderColor: Colors.black,
                      textColor: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//                   return Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       AlertDialog(

//                         actions: [
//                           Padding(
//                             padding: const EdgeInsets.only(left: 80, right: 80),
//                             child: ButtonWidget(
//                               textColor: Colors.black,
//                               backgroundcolor:
//                                   const Color.fromRGBO(255, 134, 50, 10),
//                               borderColor: Colors.transparent,
//                               text: "Sign in",
//                               icon: Icons.abc_rounded,
//                               size: 44,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   );
//                 },
//               );
//             },
//             child: const Text('Show Popup'),
