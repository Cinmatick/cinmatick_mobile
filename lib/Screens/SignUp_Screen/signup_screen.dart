import 'package:cinmatick/Screens/Home_screen/home_screen1.dart';
import 'package:cinmatick/Screens/SignIn_Screen/signin_screen.dart';
import 'package:cinmatick/Services/navigate_help.dart';
import 'package:cinmatick/Widgets/button.dart';
import 'package:cinmatick/Widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Models/user.dart';
import '../../Provider/auth_provider.dart';
import '../../Provider/user_provider.dart';
import '../../util/http_service.dart';
import '../Home_screen/home.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController token = TextEditingController();
  bool _ontrue = true;
  void _toggle() {
    setState(() {
      _ontrue = !_ontrue;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(
            left: 20,
          ),
          child:
              textInfo("Sign up", FontWeight.w400, Colors.white, 17, "numito"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 30),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 8, right: 8, top: 20),
                      child: textInfo(
                          "Name",
                          FontWeight.w500,
                          const Color.fromRGBO(255, 255, 255, 0.702),
                          12,
                          "Roboto"),
                    ),
                    Container(
                      height: 60,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 8, right: 8, top: 6),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          controller: name,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Name cannot be empty";
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
                            hintText: "Name",
                            hintStyle: const TextStyle(
                                fontSize: 13, color: Colors.white70),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                      child: textInfo("Email", FontWeight.w500, Colors.white70,
                          12, "Roboto"),
                    ),
                    Container(
                      height: 60,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 8, right: 8, top: 6),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: email,
                          validator: (value) {
                            if (value == "") {
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
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                      child: textInfo("Phone Number", FontWeight.w500,
                          Colors.white70, 12, "Roboto"),
                    ),
                    Container(
                      height: 60,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 8, right: 8, top: 6),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: phoneNumber,
                          validator: (value) {
                            if (value == "") {
                              return "Number field cannot be empty";
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
                            hintText: "Phone Number",
                            hintStyle: const TextStyle(
                                fontSize: 13, color: Colors.white70),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                      child: textInfo("Password", FontWeight.w500,
                          Colors.white70, 12, "Roboto"),
                    ),
                    Container(
                      height: 60,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 8, right: 8, top: 6),
                        child: TextFormField(
                          obscureText: _ontrue,
                          obscuringCharacter: "*",
                          keyboardType: TextInputType.text,
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
                                borderRadius: BorderRadius.circular(5)),
                            prefixIcon:
                                const Icon(Icons.lock, color: Colors.white70),
                            suffixIcon: InkWell(
                              onTap: (_toggle),
                              child: Icon(
                                  _ontrue
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.white70),
                            ),
                            hintText: "Password",
                            hintStyle: const TextStyle(
                                fontSize: 13, color: Colors.white70),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                      child: textInfo("Confirm Password", FontWeight.w500,
                          Colors.white70, 12, "Roboto"),
                    ),
                    Container(
                      height: 60,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 8, right: 8, top: 6),
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                          obscureText: _ontrue,
                          obscuringCharacter: "*",
                          keyboardType: TextInputType.text,
                          controller: confirmPassword,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password cannot be empty";
                            }
                            return null;
                          },
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
                            prefixIcon:
                                const Icon(Icons.lock, color: Colors.white70),
                            suffixIcon: InkWell(
                              onTap: (_toggle),
                              child: Icon(
                                _ontrue
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.white70,
                              ),
                            ),
                            hintText: "Confirm Password",
                            hintStyle: const TextStyle(
                                fontSize: 13, color: Colors.white70),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(17.0, 0.0, 17.0, 0.0),
                      child: authProvider.registeredInStatus ==
                              Status.Registering
                          ? const Center(child:  CircularProgressIndicator())
                          : GestureDetector(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  authProvider
                                      .register(
                                          name.text,
                                          email.text,
                                          password.text,
                                          confirmPassword.text,
                                           phoneNumber.text,
                                          token.text)
                                      .then((response) {
                                    if (response['status'] == 200) {
                                      // print(response['data']);
                                      // String name = response['data'].name;
                                      User user = User(
                                          name: response['data'].name,
                                          token: response['data'].token,
                                          email: response['data'].email,
                                          password: response['data'].password,
                                          phoneNumber:
                                              response['data'].phoneNumber,
                                          confirmPassword:
                                              response['data'].confirmPassword);
                                      userProvider.setUser(user);
                                     goTo(
                                                  context,
                                                  const HomeScreen());
                                    } else {
                                      HttpService().showMessage(
                                          response['message'], context);
                                    }
                                  });
                                  // goTo(context, const SignInScreen());
                                }
                              },
                              child: ButtonWidget(
                                backgroundcolor:
                                    const Color.fromRGBO(255, 134, 50, 10),
                                size: 45,
                                text: 'Sign up',
                                borderColor: Colors.black,
                                textColor: Colors.black,
                              ),
                            ),
                    ),
                    const SizedBox(height: 3),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            textInfo("Already have an account?",
                                FontWeight.w300, Colors.white70, 15, "Roboto"),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignInScreen(),
                                  ),
                                );
                              },
                              child: textInfo(
                                  "Sign in",
                                  FontWeight.w500,
                                  const Color.fromRGBO(255, 134, 50, 10),
                                  15,
                                  "Roboto"),
                            ),
                          ],
                        ),
                        textInfo("or", FontWeight.w300, Colors.white70, 15,
                            "Roboto"),
                        const SizedBox(height: 10),
                        textInfo("Sign up with one of the following option",
                            FontWeight.w300, Colors.white70, 15, "Roboto"),
                      ],
                    ),
                    const SizedBox(height: 30),
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
