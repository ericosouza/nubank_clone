import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nu_finances/src/ui/widgets/form_field_main.dart';
import 'package:nu_finances/src/utils/values/colors.dart';

const double minHeight = 60.0;
const double maxHeight = 600.0;
const double minWidth = 250.0;
const double maxWidth = 400.0;
const double maxBottomButtonsMargin = 15.0;
const double minBottomButtonsMargin = -170.0;
const double maxFormsContainerMargin = 160.0;
const double minFormsContainerMargin = 20.0;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const String routeName = 'login_page';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {

  late AnimationController _controller;

  bool _loginContainerOpened = false;
  bool _signUpContainerOpened = false;

  double _loginContainerHeight = minHeight;
  double _loginContainerWidth = minWidth;

  double _signUpContainerHeight = minHeight;
  double _signUpContainerWidth = minWidth;

  double _formsContainerMargin = maxFormsContainerMargin;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500)
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _scaleDownSignButton(){
    if(_signUpContainerOpened) {
      _signUpContainerHeight = minHeight;
      _signUpContainerWidth = minWidth;
      _signUpContainerOpened = false;
    }
  }

  void _scaleDownLoginButton(){
    if(_loginContainerOpened) {
      _loginContainerHeight = minHeight;
      _loginContainerWidth = minWidth;
      _loginContainerOpened = false;
    }
  }

  void _toggleAuthButtonsScale(bool isLogin) {
    setState(() {
      if(isLogin) {
        _loginContainerHeight = _loginContainerHeight == maxHeight ? minHeight : maxHeight;
        _loginContainerWidth = _loginContainerWidth == maxWidth ? minWidth : maxWidth;
        _scaleDownSignButton();
        _loginContainerOpened = !_loginContainerOpened;
      } else {
        _signUpContainerHeight = _signUpContainerHeight == maxHeight ? minHeight : maxHeight;
        _signUpContainerWidth = _signUpContainerWidth == maxWidth ? minWidth : maxWidth;
        _scaleDownLoginButton();
        _signUpContainerOpened = !_signUpContainerOpened;
      }

      _formsContainerMargin = _formsContainerMargin == minFormsContainerMargin ? maxFormsContainerMargin : minFormsContainerMargin;
    });
  }

  void _toggleNuLogoAngGoogleButton() {
    final bool isAnyContainerAnimationCompleted = _controller.status == AnimationStatus.completed;

    _controller.fling(velocity: isAnyContainerAnimationCompleted ? -2 : 2);
  }

  double? lerp(double min, double max) => lerpDouble(min, max, _controller.value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.colorMainPurple,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[

          AnimatedBuilder(
            animation: _controller,
            builder: (BuildContext context, Widget? child) {
              return Positioned.fill(
                  top: lerp(maxBottomButtonsMargin, minBottomButtonsMargin),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 60.0,
                          margin: const EdgeInsets.only(top: 50.0),
                          child: Image.asset(
                            'assets/images/nulogo.png',
                            color: Colors.white,
                          ),
                        ),
                        Container(
                            height: 60.0,
                            margin: const EdgeInsets.only(top: 10.0, bottom: 5.0),
                            child: const Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
                            )
                        )
                      ],
                    ),
                  ),
              );
            },
          ),

          ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: <Widget> [
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.fastOutSlowIn,
                margin: EdgeInsets.only(top: _formsContainerMargin),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    /** Sigin up button */
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      child: _loginContainerOpened ? Container() : GestureDetector(
                        onTap: () {
                          if(!_loginContainerOpened && !_signUpContainerOpened) {
                            _toggleAuthButtonsScale(false);
                            _toggleNuLogoAngGoogleButton();
                          }
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(top: 5.0),
                          width: _signUpContainerWidth,
                          height: _signUpContainerHeight,
                          curve: Curves.fastOutSlowIn,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(8.0))
                          ),
                          child: AnimatedSwitcher(
                            duration: Duration(milliseconds: 200),
                            child: _signUpContainerOpened
                                ? Container(
                              alignment: Alignment.center,
                              child: Stack(
                                children: <Widget>[
                                  Positioned(
                                    top: 5.0,
                                    left: 5.0,
                                    child: GestureDetector(
                                      onTap: () {
                                        if(_signUpContainerOpened) {
                                          _toggleAuthButtonsScale(false);
                                          _toggleNuLogoAngGoogleButton();
                                        }
                                      },
                                      child: const Icon(
                                        Icons.close,
                                        size: 40.0
                                      ),
                                    )
                                  ),

                                  Positioned.fill(
                                    top: 70.0,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Column(
                                        children: const <Widget>[

                                          FormFieldMain(
                                              obscured: false,
                                              marginLeft: 20.0,
                                              marginRight: 20.0,
                                              marginTop: 0.0,
                                              textInputType: TextInputType.text,
                                              hintText: "Email...",
                                          ),

                                          FormFieldMain(
                                            obscured: true,
                                            marginLeft: 20.0,
                                            marginRight: 20.0,
                                            marginTop: 0.0,
                                            textInputType: TextInputType.text,
                                            hintText: "Password...",
                                          ),

                                          FormFieldMain(
                                            obscured: false,
                                            marginLeft: 20.0,
                                            marginRight: 20.0,
                                            marginTop: 0.0,
                                            textInputType: TextInputType.text,
                                            hintText: "Display Name...",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  Positioned.fill(
                                    bottom: 15.0,
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: GestureDetector(
                                        onTap: () {

                                        },
                                        child: Container(
                                          margin: const EdgeInsets.only(left: 30.0, right: 30.0),
                                          alignment: Alignment.center,
                                          height: 60.0,
                                          width: MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            border: Border.all(
                                              width: 1,
                                              color: ColorConstant.colorMainPurple
                                            ),
                                          ),
                                          child: const Text(
                                            "Sign Up",
                                            style: TextStyle(
                                              color: ColorConstant.colorMainPurple,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 20.0
                                            ),
                                          ),
                                        )
                                      ),
                                    ),
                                  )

                                ],
                              ),
                            ) : const Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w400,
                                fontSize: 25.0
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    /** End Sigin up button */

                    /** Login up button */
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      child: _signUpContainerOpened ? Container() : GestureDetector(
                        onTap: () {
                          if(!_signUpContainerOpened && !_loginContainerOpened) {
                            _toggleAuthButtonsScale(false);
                            _toggleNuLogoAngGoogleButton();
                          }
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(top: 5.0),
                          width: _loginContainerWidth,
                          height: _loginContainerHeight,
                          curve: Curves.fastOutSlowIn,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(8.0))
                          ),
                          child: AnimatedSwitcher(
                            duration: Duration(milliseconds: 200),
                            child: _loginContainerOpened
                                ? Container(
                              alignment: Alignment.center,
                              child: Stack(
                                children: <Widget>[
                                  Positioned(
                                      top: 5.0,
                                      left: 5.0,
                                      child: GestureDetector(
                                        onTap: () {
                                          if(_loginContainerOpened) {
                                            _toggleAuthButtonsScale(false);
                                            _toggleNuLogoAngGoogleButton();
                                          }
                                        },
                                        child: const Icon(
                                            Icons.close,
                                            size: 40.0
                                        ),
                                      )
                                  ),

                                  Positioned.fill(
                                    top: 70.0,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Column(
                                        children: const <Widget>[

                                          FormFieldMain(
                                            obscured: false,
                                            marginLeft: 20.0,
                                            marginRight: 20.0,
                                            marginTop: 0.0,
                                            textInputType: TextInputType.text,
                                            hintText: "Email...",
                                          ),

                                          FormFieldMain(
                                            obscured: true,
                                            marginLeft: 20.0,
                                            marginRight: 20.0,
                                            marginTop: 0.0,
                                            textInputType: TextInputType.text,
                                            hintText: "Password...",
                                          ),

                                        ],
                                      ),
                                    ),
                                  ),

                                  Positioned.fill(
                                    bottom: 15.0,
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: GestureDetector(
                                          onTap: () {

                                          },
                                          child: Container(
                                            margin: const EdgeInsets.only(left: 30.0, right: 30.0),
                                            alignment: Alignment.center,
                                            height: 60.0,
                                            width: MediaQuery.of(context).size.width,
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              border: Border.all(
                                                  width: 1,
                                                  color: ColorConstant.colorMainPurple
                                              ),
                                            ),
                                            child: const Text(
                                              "Login",
                                              style: TextStyle(
                                                  color: ColorConstant.colorMainPurple,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 20.0
                                              ),
                                            ),
                                          )
                                      ),
                                    ),
                                  )

                                ],
                              ),
                            ) : const Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 25.0
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    /** End Login up button */
                  ],
                ),
              )
            ],
          ),

          AnimatedBuilder(
            animation: _controller,
            builder: (BuildContext context, Widget? child) {
              return Positioned.fill(
                bottom: lerp(maxBottomButtonsMargin, minBottomButtonsMargin),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 15.0),
                      height: 55.0,
                      child: ClipOval(
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          color: Colors.white,
                          child: Image.asset('assets/images/googleicon.png'),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
