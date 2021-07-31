import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gify/constants/styles.dart';
import 'package:gify/controllers/sign_up_page_controller.dart';
import 'package:gify/validators/form_validators.dart';
import 'package:gify/widgets/sign_up_page_widgets/image_picker_circle_avatar.dart';
import 'package:gify/widgets/top_nav_bar.dart';
import 'package:gify/widgets/top_nav_drawer.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {


  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final _formKey = GlobalKey<FormState>();
  final SignUpPageController _controller = Get.put(SignUpPageController());

  @override
  Widget build(BuildContext context) {

    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      key: _scaffoldKey,
      drawer: const TopNavDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            NavigationBar(scaffoldKey: _scaffoldKey),
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _width * 0.05),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(90)),
                                border: Border.all(color: kDarkGreen)
                            ),
                            child: Obx(()=> ImagePickerCircleAvatar(bytes: _controller.userImage.value.bytes)),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Click on the circle to change',
                            style: GoogleFonts.roboto(fontSize: 12, color: kLightGreen),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    /// Display name text field
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SelectableText(
                          'Display Name',
                          style: GoogleFonts.sen(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: 400,
                          child: TextFormField(
                            controller: _controller.displayNameController,
                            validator: (value) => isStringEmpty(value: value, errorMessage: "Please enter a display name"),
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
                              hintText: "Enter a display name",
                              hintStyle: GoogleFonts.roboto(
                                fontSize: 16,
                                color: kDarkGreen,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    /// Email address text field
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SelectableText(
                          'Email',
                          style: GoogleFonts.sen(
                              fontSize: 18,
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
                              hintText: "Enter an email address",
                              hintStyle: GoogleFonts.roboto(
                                fontSize: 16,
                                color: kDarkGreen,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    /// Password text field
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SelectableText(
                          'Password',
                          style: GoogleFonts.sen(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: 400,
                          child: TextFormField(
                            controller: _controller.passwordController,
                            obscureText: true,
                            validator: (value) => isValidPassword(value: value),
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
                              hintText: "Enter a password",
                              hintStyle: GoogleFonts.roboto(
                                fontSize: 16,
                                color: kDarkGreen,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SelectableText(
                          'Confirm Password',
                          style: GoogleFonts.sen(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: 400,
                          child: TextFormField(
                            controller: _controller.confirmPasswordController,
                            obscureText: true,
                            validator: (value) => isValidConfirmPassword(password: _controller.passwordController.text, confirmPassword: _controller.confirmPasswordController.text),
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
                              hintText: "Confirm your password",
                              hintStyle: GoogleFonts.roboto(
                                fontSize: 16,
                                color: kDarkGreen,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SelectableText(
                      '*Password must be min 10 characters long, contains at least one uppercase  (A - Z), lower case (a - z), digit (0 - 9) and special character.',
                      style: GoogleFonts.roboto(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: Colors.black),
                    ),
                    const SizedBox(height: 20),
                    /// Button
                    SizedBox(
                      width: _width <= 768 ? _width * 0.9 : 400,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all<Color>(kDarkGreen),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ))),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await _controller.createAndSignInUser(
                                displayName: _controller.displayNameController.text.trim(),
                                email: _controller.emailController.text.trim(),
                                password: _controller.passwordController.text.trim());
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Center(
                            child: Text(
                              'Sign Up Now',
                              style: GoogleFonts.sen(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}