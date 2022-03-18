// ignore_for_file: file_names

import 'package:des/config/Palette.dart';
import 'package:flutter/material.dart';

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({Key? key}) : super(key: key);

  @override
  _LoginSignupScreenState createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  bool isMale = true;
  bool isSignupScreen = true;
  bool isRememberMe = false;
  bool isPassword = false;
  final fullNameEditingController = new TextEditingController();
  final NumberEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();

  void _togglePasswordView() {
    setState(() {
      isPassword = !isPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Stack(
        children: [
          Positioned(
            top: 70,
            right: 0,
            left: 0,
            child: Container(
              height: 120,
              width: 50,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/r.png"), fit: BoxFit.contain)),
            ),
          ),

          // Trick to add the shadow for the submit button

          buildBottomHalfContainer(true),
          //Main Contianer for Login and Signup
          AnimatedPositioned(
            duration: Duration(milliseconds: 700),
            curve: Curves.bounceInOut,
            top: isSignupScreen ? 200 : 230,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 700),
              curve: Curves.bounceInOut,
              height: isSignupScreen ? 380 : 250,
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 15,
                        spreadRadius: 5),
                  ]),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignupScreen = false;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "LOGIN",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: !isSignupScreen
                                        ? Palette.activeColor
                                        : Palette.textColor1),
                              ),
                              if (!isSignupScreen)
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: Colors.orange,
                                )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignupScreen = true;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "SIGNUP",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: isSignupScreen
                                        ? Palette.activeColor
                                        : Palette.textColor1),
                              ),
                              if (isSignupScreen)
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: Colors.orange,
                                )
                            ],
                          ),
                        )
                      ],
                    ),
                    if (isSignupScreen) buildSignupSection(),
                    if (!isSignupScreen) buildSigninSection()
                  ],
                ),
              ),
            ),
          ),
          // Trick to add the submit button
          buildBottomHalfContainer(false),
          //Main Contianer for Login and Signup
        ],
      ),
    );
  }

  Widget buildBottomHalfContainer(bool showShadow) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 700),
      curve: Curves.bounceInOut,
      top: isSignupScreen ? 535 : 430,
      right: 0,
      left: 0,
      child: Center(
        child: Container(
          height: 90,
          width: 90,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                if (showShadow)
                  BoxShadow(
                      color: Colors.black.withOpacity(.3),
                      spreadRadius: 1.5,
                      blurRadius: 10,
                      offset: Offset(0, 1))
              ]),
          child: !showShadow
              ? Container(
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(25, 39, 68, 1),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(.3),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(0, 1))
                      ]),
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                )
              : Center(),
        ),
      ),
    );
  }

  Container buildSigninSection() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          TextField(
            cursorColor: Color(0xffF5591F),
            decoration: InputDecoration(
              icon: Icon(
                Icons.email,
                color: Color(0xffF5591F),
              ),
              hintText: "Enter Email",
              hintStyle: TextStyle(fontSize: 14, color: Palette.textColor1),
            ),
          ),
          TextField(
            obscureText: isPassword ? false : true,
            cursorColor: Color(0xffF5591F),
            decoration: InputDecoration(
              icon: Icon(
                Icons.vpn_key,
                color: Color(0xffF5591F),
              ),
              hintText: "Enter Password",
              hintStyle: TextStyle(fontSize: 14, color: Palette.textColor1),
              suffix: InkWell(
                onTap: _togglePasswordView,
                child:
                    Icon(isPassword ? Icons.visibility : Icons.visibility_off),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: isRememberMe,
                    activeColor: Color.fromARGB(255, 88, 178, 226),
                    onChanged: (value) {
                      setState(() {
                        isRememberMe = !isRememberMe;
                      });
                    },
                  ),
                  Text("Remember me",
                      style: TextStyle(fontSize: 12, color: Palette.textColor1))
                ],
              ),
              TextButton(
                onPressed: () {},
                child: Text("Forgot Password?",
                    style: TextStyle(fontSize: 12, color: Palette.textColor1)),
              )
            ],
          )
        ],
      ),
    );
  }

  Container buildSignupSection() {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Column(
        children: [
          TextFormField(
              autofocus: false,
              controller: fullNameEditingController,
              keyboardType: TextInputType.name,
              //validator () {}
              onSaved: (value) {
                fullNameEditingController.text = value!;
              },
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.account_circle,
                  color: Color(0xffF5591F),
                ),
                contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                hintText: 'Full Name',
                hintStyle: TextStyle(fontSize: 14, color: Palette.textColor1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35),
                ),
              )),
          SizedBox(
            height: 5,
          ),
          TextFormField(
              autofocus: false,
              controller: NumberEditingController,
              keyboardType: TextInputType.name,
              //validator () {}
              onSaved: (value) {
                NumberEditingController.text = value!;
              },
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.phone,
                  color: Color(0xffF5591F),
                ),
                contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                hintText: 'Contact Number',
                hintStyle: TextStyle(fontSize: 14, color: Palette.textColor1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35),
                ),
              )),
          SizedBox(
            height: 5,
          ),
          TextFormField(
              autofocus: false,
              controller: emailEditingController,
              keyboardType: TextInputType.emailAddress,
              //validator () {}
              onSaved: (value) {
                emailEditingController.text = value!;
              },
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.mail,
                  color: Color(0xffF5591F),
                ),
                contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                hintText: 'Email',
                hintStyle: TextStyle(fontSize: 14, color: Palette.textColor1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35),
                ),
              )),
          SizedBox(
            height: 5,
          ),
          TextField(
            obscureText: isPassword ? false : true,
            cursorColor: Color(0xffF5591F),
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.lock,
                color: Color(0xffF5591F),
              ),
              contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
              hintText: 'Password',
              hintStyle: TextStyle(fontSize: 14, color: Palette.textColor1),
              suffix: InkWell(
                onTap: _togglePasswordView,
                child:
                    Icon(isPassword ? Icons.visibility : Icons.visibility_off),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(35.0),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          TextField(
            obscureText: isPassword ? false : true,
            cursorColor: Color(0xffF5591F),
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock, color: Color(0xffF5591F)),
              contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
              hintText: 'Confirm Password',
              hintStyle: TextStyle(fontSize: 14, color: Palette.textColor1),
              suffix: InkWell(
                onTap: _togglePasswordView,
                child:
                    Icon(isPassword ? Icons.visibility : Icons.visibility_off),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(35.0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextField(IconData icon, String hintText, bool isEmail) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextField(
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Color(0xffF5591F),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Palette.textColor1),
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Palette.textColor1),
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
          ),
          contentPadding: EdgeInsets.all(10),
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 14, color: Palette.textColor1),
        ),
      ),
    );
  }
}
