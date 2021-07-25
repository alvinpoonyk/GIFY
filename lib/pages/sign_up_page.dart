import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gify/constants/styles.dart';
import 'package:gify/controllers/sign_up_page_controller.dart';
import 'package:gify/validators/form_validators.dart';
import 'package:gify/widgets/sign_up_page_widgets/image_picker_circle_avatar.dart';
import 'package:gify/widgets/top_nav_bar.dart';
import 'package:gify/widgets/top_nav_drawer.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatelessWidget {
  static final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  static final _formKey = GlobalKey<FormState>();
  final SignUpPageController _controller = Get.put(SignUpPageController());
  @override
  Widget build(BuildContext context) {
    String _email = "";
    String _displayName = "";
    String _password = "";
    String _confirmPassword = "";
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      drawer: TopNavDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            navigationBar(screenWidth: _width, scaffoldKey: _scaffoldKey),
            SizedBox(height: 10),
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
                                borderRadius: BorderRadius.all(Radius.circular(90)),
                                border: Border.all(color: kDarkGreen)
                            ),
                            child: Obx(()=> ImagePickerCircleAvatar(bytes: _controller.userImage.value.bytes)),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Click on the circle to change',
                            style: GoogleFonts.roboto(fontSize: 12, color: kLightGreen),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
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
                        SizedBox(height: 10),
                        SizedBox(
                          width: 400,
                          child: TextFormField(
                            onChanged: (value) {
                              _displayName = value.trim();
                            },
                            validator: (value) => isStringEmpty(value: value, errorMessage: "Please enter a display name"),
                            cursorColor: kLightGreen,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(color: kDarkGreen, width: 1),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(color: kLightGreen, width: 1),
                              ),
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.only(
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
                    SizedBox(height: 20),
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
                        SizedBox(height: 10),
                        SizedBox(
                          width: 400,
                          child: TextFormField(
                            onChanged: (value) {
                              _email = value.trim();
                            },
                            validator: (value) => isValidEmail(value: value, errorMessage: "Please enter a valid email address"),
                            cursorColor: kLightGreen,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(color: kDarkGreen, width: 1),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(color: kLightGreen, width: 1),
                              ),
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.only(
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
                    SizedBox(height: 20),
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
                        SizedBox(height: 10),
                        SizedBox(
                          width: 400,
                          child: TextFormField(
                            onChanged: (value) {
                              _password = value;
                            },
                            obscureText: true,
                            validator: (value) => isValidPassword(value: value),
                            cursorColor: kLightGreen,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(color: kDarkGreen, width: 1),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(color: kLightGreen, width: 1),
                              ),
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.only(
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
                    SizedBox(height: 20),
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
                        SizedBox(height: 10),
                        SizedBox(
                          width: 400,
                          child: TextFormField(
                            onChanged: (value) {
                              _confirmPassword = value;
                            },
                            obscureText: true,
                            validator: (value) => isValidConfirmPassword(password: _password, confirmPassword: _confirmPassword),
                            cursorColor: kLightGreen,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(color: kDarkGreen, width: 1),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(color: kLightGreen, width: 1),
                              ),
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.only(
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
                    SizedBox(height: 20),
                    SelectableText(
                      '*Password must be min 10 characters long, contains at least one uppercase  (A - Z), lower case (a - z), digit (0 - 9) and special character.',
                      style: GoogleFonts.roboto(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: Colors.black),
                    ),
                    SizedBox(height: 20),
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
                            await _controller.createAndSignInUser(displayName: _displayName, email: _email, password: _password);
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
                    SizedBox(height: 30),
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