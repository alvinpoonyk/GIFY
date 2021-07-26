import 'package:flutter/material.dart';
import 'package:gify/constants/styles.dart';
import 'package:gify/controllers/login_signup_page_controller.dart';
import 'package:gify/validators/form_validators.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class LoginCard extends StatelessWidget {
  const LoginCard({Key? key});
  static final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final LoginSignUpPageController _controller = Get.put(LoginSignUpPageController());
    double _width = MediaQuery.of(context).size.width;
    String _email = '';
    String _password = '';
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
                      validator: (value) => isValidEmail(value: value, errorMessage: "Please enter a valid email address"),
                      onChanged: (value) => _email = value,
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
                      validator: (value) {
                        if (value!.trim().isEmpty)
                          return 'Please enter a password';
                        return null;
                      },
                      onChanged: (value) => _password = value,
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
                      _controller.loginUser(email: _email.trim(), password: _password.trim());
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
                  onPressed: () async {

                  },
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