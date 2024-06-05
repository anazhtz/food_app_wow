import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app_wow/utils/const.dart';
import 'package:food_app_wow/views/login_screen.dart';

class SignUpScreenState extends StatefulWidget {
  const SignUpScreenState({super.key});

  @override
  State<SignUpScreenState> createState() => _SignUpScreenStateState();
}

class _SignUpScreenStateState extends State<SignUpScreenState> {
  bool _isPasswordObscured = true;
  bool _isConfirmPasswordObscured = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    }
    if (value.length != 10) {
      return 'Phone number must be 10 digits';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    final passwordRegex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
    if (!passwordRegex.hasMatch(value)) {
      return 'Password must be at least 8 characters, include an uppercase letter, number and special character';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BlackColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      'Lets Create \nYour Account....',
                      style: TextStyle(
                        fontFamily: "Sora",
                        color: Colors.white,
                        fontSize: 37.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 15),
                        // First Name
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xFF2C2C2C),
                            hintText: 'Enter your first name',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Colors.orange),
                            ),
                            prefixIcon: Icon(Icons.person, color: Colors.white),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your first name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 15),
                        // Last Name
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xFF2C2C2C),
                            hintText: 'Enter your last name',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Colors.orange),
                            ),
                            prefixIcon: Icon(Icons.person, color: Colors.white),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your last name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 15),
                        // Email
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xFF2C2C2C),
                            hintText: 'Enter your email',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Colors.orange),
                            ),
                            prefixIcon: Icon(Icons.email, color: Colors.white),
                          ),
                          validator: _validateEmail,
                        ),
                        SizedBox(height: 15),
                        // Phone Number
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xFF2C2C2C),
                            hintText: 'Enter your phone number',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Colors.orange),
                            ),
                            prefixIcon: Icon(Icons.phone, color: Colors.white),
                          ),
                          validator: _validatePhoneNumber,
                        ),
                        SizedBox(height: 15),
                        // Password
                        TextFormField(
                          controller: _passwordController,
                          obscureText: _isPasswordObscured,
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xFF2C2C2C),
                            hintText: 'Enter your password',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Colors.orange),
                            ),
                            prefixIcon: Icon(Icons.lock, color: Colors.white),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isPasswordObscured = !_isPasswordObscured;
                                });
                              },
                              child: Icon(
                                _isPasswordObscured ? Icons.visibility_off : Icons.visibility,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          validator: _validatePassword,
                        ),
                        SizedBox(height: 15),
                        // Confirm Password
                        TextFormField(
                          obscureText: _isConfirmPasswordObscured,
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xFF2C2C2C),
                            hintText: 'Confirm your password',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Colors.orange),
                            ),
                            prefixIcon: Icon(Icons.lock, color: Colors.white),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isConfirmPasswordObscured = !_isConfirmPasswordObscured;
                                });
                              },
                              child: Icon(
                                _isConfirmPasswordObscured ? Icons.visibility_off : Icons.visibility,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          validator: _validateConfirmPassword,
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              backgroundColor: OrangeButtonColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            onPressed: _onSignUpButtonPressed,
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: WhiteColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              print("tapped");
                            },
                            child: Container(
                              height: 40,
                              width: 200,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(20), // Adjust border shape
                                border: Border.all(width: 1, color: Colors.white),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/Google__G__logo.svg.png',
                                    height: 20,
                                    width: 20,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    'Connect with Google',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  void _showSuccessSnackbar() {
    final snackBar = SnackBar(
      duration: Duration(milliseconds: 1000),
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: AwesomeSnackbarContent(
          color: Color.fromARGB(255, 149, 7, 0),
          title: 'Account Created Successfully',
          message: 'Your account has been successfully created!',
          contentType: ContentType.success,
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)), 
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0), 
    );

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _onSignUpButtonPressed() {
    if (_formKey.currentState!.validate()) {
      _showSuccessSnackbar();
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()),);
    }
  }
}
