import 'package:flutter/material.dart';
import 'package:food_app_wow/utils/const.dart';
import 'package:food_app_wow/views/login_screen.dart';
import 'package:food_app_wow/views/sign_up_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _loginController;
  late AnimationController _signUpController;

  @override
  void initState() {
    super.initState();
    _loginController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _signUpController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
  }

  @override
  void dispose() {
    _loginController.dispose();
    _signUpController.dispose();
    super.dispose();
  }

  void _onLoginPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
    _loginController.forward().then((value) {
      _loginController.reverse();
    });
  }

  void _onSignUpPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpScreenState()),
    );
    _signUpController.forward().then((value) {
      _signUpController.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: FractionallySizedBox(
              heightFactor: 0.67,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/Chinese-Restaurant-Logo.jpg'), // Correct path
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.47,
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100),
                  topRight: Radius.circular(100),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 320),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 20.0), // Adjusted horizontal padding
                    child: Text(
                      ' "From kitchen to table. \nElevate your dining \nexperience." ',
                      style: TextStyle(
                        fontSize: 35,
                        fontFamily: 'Sora',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 25),
                  const Text(
                    'Unlock a world of flavours. \nCulinary adventures await.',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Sora',
                      fontWeight: FontWeight.normal,
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 70), // Add spacing before the buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          ScaleTransition(
                            scale: Tween<double>(begin: 1.0, end: 1.1).animate(
                              CurvedAnimation(
                                parent: _signUpController,
                                curve: Curves.easeInOut,
                              ),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: OrangeButtonColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: TextButton(
                                onPressed: _onSignUpPressed,
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 15),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.only(left: 80),
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ScaleTransition(
                            scale: Tween<double>(begin: 1.0, end: 1.1).animate(
                              CurvedAnimation(
                                parent: _loginController,
                                curve: Curves.easeInOut,
                              ),
                            ),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: LightButtonOrange,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                ),
                              ),
                              child: TextButton(
                                onPressed: _onLoginPressed,
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 15),
                                ),
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
