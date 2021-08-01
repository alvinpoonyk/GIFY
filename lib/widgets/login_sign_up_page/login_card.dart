import 'package:flutter/material.dart';
import 'package:gify/constants/styles.dart';
import 'package:gify/controllers/login_signup_page_controller.dart';
import 'package:gify/validators/form_validators.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class LoginCard extends StatefulWidget {
  @override
  _LoginCardState createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {

  final _formKey = GlobalKey<FormState>();
  final LoginSignUpPageController _controller = Get.put(LoginSignUpPageController());

  @override
  Widget build(BuildContext context) {

    double _width = MediaQuery.of(context).size.width;
    return Card(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              _width < 768 ? const SizedBox(height: 10) : const SizedBox(height: 30),
              Center(
                child: SelectableText(
                  'Welcome!',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.montserrat(
                      fontSize: _width < 768 ? 24 : 32,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
              ),
              _width < 768 ? const SizedBox(height: 10) : const SizedBox(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SelectableText(
                    'Email',
                    style: GoogleFonts.sen(
                        fontSize: _width < 768 ? 16 : 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 400,
                    child: TextFormField(
                      controller: _controller.emailController,
                      validator: (value) => isValidEmail(value: value, errorMessage: "Please enter a valid email address"),
                      cursorColor: kLightGreen,
                      decoration: InputDecoration(
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          borderSide: const BorderSide(color: kDarkGreen, width: 1),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          borderSide: const BorderSide(color: kLightGreen, width: 1),
                        ),
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: const EdgeInsets.only(
                            left: 15, bottom: 11, top: 11, right: 15),
                        hintText: "Enter your email address",
                        hintStyle: GoogleFonts.roboto(
                          fontSize: 14,
                          color: kDarkGreen,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SelectableText(
                    'Password',
                    style: GoogleFonts.sen(
                        fontSize: _width < 768 ? 16 : 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 400,
                    child: TextFormField(
                      controller: _controller.passwordController,
                      validator: (value) => isValidEmail(value: value, errorMessage: "Please enter a password"),
                      obscureText: true,
                      cursorColor: kLightGreen,
                      decoration: InputDecoration(
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          borderSide: const BorderSide(color: kDarkGreen, width: 1),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          borderSide: const BorderSide(color: kLightGreen, width: 1),
                        ),
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: const EdgeInsets.only(
                            left: 15, bottom: 11, top: 11, right: 15),
                        hintText: "Enter your password",
                        hintStyle: GoogleFonts.roboto(
                          fontSize: 14,
                          color: kDarkGreen,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              _width < 768 ? const SizedBox(height: 30) : const SizedBox(height: 50),
              SizedBox(
                width: 400,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(kLightGreen),
                      shape: MaterialStateProperty.all<
                          RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ))),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _controller.loginUser(email: _controller.emailController.text.trim(), password: _controller.passwordController.text.trim());
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        'Login In',
                        style: GoogleFonts.sen(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: _width < 768 ? 10 : 30),
              SizedBox(
                width: 400,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.white),
                    shape:
                    MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(color: kDarkGreen))),
                  ),
                  onPressed: () => Get.offAndToNamed('/sign-up'),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        'Sign Up',
                        style: GoogleFonts.sen(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: kDarkGreen,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}