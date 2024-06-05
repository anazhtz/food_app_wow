import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:food_app_wow/utils/const.dart';
import 'package:food_app_wow/views/home_content/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObscured = true;
  final _formKey = GlobalKey<FormState>();

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

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    final passwordRegex = RegExp(
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
    if (!passwordRegex.hasMatch(value)) {
      return 'Password must be at least 8 characters, include an uppercase letter, number and special character';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: BlackColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: size.height * 0.1),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.1),
                      child: Text(
                        'Hey,\nWelcome\nBack....',
                        style: TextStyle(
                          fontFamily: "Sora",
                          color: Colors.white,
                          fontSize: size.width * 0.1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.05),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.1),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: size.height * 0.01),
                          TextFormField(
                            style: TextStyle(color: Colors.white),
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xFF2C2C2C),
                              hintText: 'Enter your email',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(size.width * 0.05),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(size.width * 0.05),
                                borderSide: BorderSide(color: Colors.orange),
                              ),
                              prefixIcon:
                                  Icon(Icons.email, color: Colors.white),
                            ),
                            validator: _validateEmail,
                          ),
                          SizedBox(height: size.height * 0.02),
                          Stack(
                            alignment: Alignment.centerRight,
                            children: [
                              TextFormField(
                                style: TextStyle(color: Colors.white),
                                cursorColor: Colors.white,
                                obscureText: _isObscured,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xFF2C2C2C),
                                  hintText: 'Enter your password',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        size.width * 0.05),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        size.width * 0.05),
                                    borderSide:
                                        BorderSide(color: Colors.orange),
                                  ),
                                  prefixIcon:
                                      Icon(Icons.lock, color: Colors.white),
                                ),
                                validator: _validatePassword,
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(right: size.width * 0.05),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _isObscured = !_isObscured;
                                    });
                                  },
                                  child: Icon(
                                    _isObscured
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.02),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Forget password ?',
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: size.height * 0.03),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                  vertical: size.height * 0.02,
                                ),
                                backgroundColor: OrangeButtonColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(size.width * 0.05),
                                ),
                              ),
                              onPressed: _onLoginButtonPressed,
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: size.width * 0.05,
                                  color: WhiteColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: size.height * 0.03),
                          Center(
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: size.height * 0.05,
                                width: size.width * 0.7,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius:
                                      BorderRadius.circular(size.width * 0.05),
                                  border:
                                      Border.all(width: 1, color: Colors.white),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/Google__G__logo.svg.png',
                                      height: size.height * 0.03,
                                      width: size.height * 0.03,
                                    ),
                                    SizedBox(width: size.width * 0.02),
                                    Text(
                                      'Connect with Google',
                                      style: TextStyle(
                                        fontSize: size.width * 0.04,
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
            ],
          ),
        ),
      ),
    );
  }

  void _showLoginSuccessSnackbar() {
    final snackBar = SnackBar(
      duration: Duration(milliseconds: 1200),
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: AwesomeSnackbarContent(
          color: Color.fromARGB(255, 7, 101, 40),
          title: 'Login Successful',
          message: 'Your account has been successfully logged in!',
          contentType: ContentType.success,
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
    );

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _onLoginButtonPressed() {
    if (_formKey.currentState?.validate() ?? false) {
      _showLoginSuccessSnackbar();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
  }
}
