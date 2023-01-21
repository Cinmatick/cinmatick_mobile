import 'package:cinmatick/Screens/Forget_password/forget_password.dart';
import 'package:cinmatick/Screens/Home_screen/home.dart';
import 'package:cinmatick/Screens/SignUp_Screen/signup_screen.dart';
import 'package:cinmatick/Services/navigate_help.dart';
import 'package:cinmatick/Widgets/button.dart';
import 'package:cinmatick/Widgets/text_widget.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool _ontrue = true;
  void _toggle() {
    setState(() {
      _ontrue = !_ontrue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 25, right: 8, top: 20),
          child:
              textInfo("Sign in", FontWeight.w400, Colors.white, 17, "numito"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Form(
              key: _formKey,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 45),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 8, right: 8, top: 20),
                      child: textInfo("Email", FontWeight.w400, Colors.white70,
                          17, "Roboto"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8, top: 5),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: email,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Email cannot be empty";
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
                          hintText: "Email",
                          hintStyle: const TextStyle(
                              fontSize: 13, color: Colors.white70),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    Padding(
                        padding:
                            const EdgeInsets.only(left: 8, right: 8, top: 5),
                        child: textInfo("Password", FontWeight.w400,
                            Colors.white70, 17, "Roboto")),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8, top: 5),
                      child: TextFormField(
                        obscureText: _ontrue,
                        controller: password,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Email cannot be empty";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
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
                          suffixIcon: InkWell(
                            onTap: (_toggle),
                            child: Icon(
                              _ontrue ? Icons.visibility_off : Icons.visibility,
                              color: Colors.white,
                            ),
                          ),
                          hintText: "Password",
                          hintStyle: const TextStyle(
                              fontSize: 13, color: Colors.white70),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ForgetPassword(),
                              ),
                            );
                          },
                          child: textInfo(
                              "Forgot Password?",
                              FontWeight.w400,
                              const Color.fromRGBO(255, 134, 50, 10),
                              13,
                              "Roboto"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(17.0, 0.0, 17.0, 0.0),
                      child: GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            goTo(context, const HomeScreen());
                          }
                        },
                        child: ButtonWidget(
                          backgroundcolor:
                              const Color.fromRGBO(255, 134, 50, 10),
                          size: 45,
                          text: 'Sign in',
                          borderColor: Colors.black,
                          textColor: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            textInfo("Don't have an account?", FontWeight.w400,
                                Colors.white70, 13, "Roboto"),
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SignUpScreen()),
                                );
                              },
                              child: textInfo(
                                  "Sign up",
                                  FontWeight.w400,
                                  const Color.fromRGBO(255, 134, 50, 10),
                                  13,
                                  "Roboto"),
                            ),
                          ],
                        ),
                        textInfo("or", FontWeight.w300, Colors.white70, 15,
                            "Roboto"),
                        const SizedBox(height: 10),
                        textInfo("Sign up with one of the following option",
                            FontWeight.w400, Colors.white70, 13, "Roboto"),
                      ],
                    ),
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        SizedBox(
                          width: 30,
                          child: Image(
                            image: AssetImage("assets/images/Google.png"),
                            width: 250,
                          ),
                        ),
                        SizedBox(
                          width: 30,
                          child: Image(
                            image: AssetImage("assets/images/appleicon.png"),
                            width: 250,
                          ),
                        ),
                        SizedBox(
                          width: 30,
                          child: Image(
                            image: AssetImage("assets/images/facebook.png"),
                            width: 250,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
