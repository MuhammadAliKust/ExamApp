import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kust_examp_app/images/images.dart';
import 'package:kust_examp_app/responsive_media_queries/media_query.dart';
import 'package:kust_examp_app/routes/routing_constants.dart';
import 'package:kust_examp_app/text_styles/text_styles.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    // TODO: implement initState
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.initState();
  }


  bool _isChecked = false;
  final _formKey = GlobalKey<FormState>();
  bool isPasswordVisible = true;
  TextEditingController _idController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  DateTime currentBackPressTime;

  Future<bool> _showDialog() {
    // flutter defined function
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Do you want to exit?"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("No"),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            new FlatButton(
              child: new Text("Yes"),
              onPressed: () {
                exit(0);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        return _showDialog();
      },
      child: Scaffold(
        backgroundColor: Color(0xff201b6d),
        body: ListView(children: <Widget>[
          SizedBox(
            height: CustomMediaQuery.screenHeight / 9,
          ),
          Image.asset(
            Images.logo,
            height: (13 * CustomMediaQuery.screenHeight) / 100,
          ),
          SizedBox(height: CustomMediaQuery.screenHeight / 32),
          Center(
            child: AutoSizeText(
              'WELCOME BACK!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 21,
                letterSpacing: 1.5,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 2,
            ),
          ),
          Form(
              key: _formKey,
              child: Column(children: <Widget>[
                //Textfied for ID No.
                Padding(
                  padding: EdgeInsets.only(
                      left: CustomMediaQuery.screenWidth / 7.5,
                      right: CustomMediaQuery.screenWidth / 7.5,
                      top: CustomMediaQuery.screenHeight / 21),
                  child: TextFormField(
                    controller: _idController,
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'Enter Valid ID. No!';
                      } else {
                        return null;
                      }
                    },
                    cursorColor: Colors.white,
                    style: txtFieldInsrtText,
                    decoration: InputDecoration(
                        hintText: 'ID No.',
                        hintStyle: txtFieldHintText,
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.white,
                          size: 19,
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white60)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white))),
                  ),
                ),

                //Textfield for Password
                Padding(
                  padding: EdgeInsets.only(
                      left: CustomMediaQuery.screenWidth / 7.5,
                      right: CustomMediaQuery.screenWidth / 7.5,
                      top: CustomMediaQuery.screenHeight / 21),
                  child: TextFormField(
                    controller: _pwdController,
                    obscureText: isPasswordVisible,
                    textCapitalization: TextCapitalization.characters,
                    cursorColor: Colors.white,
                    style: txtFieldInsrtText,
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'Enter Valid ID. No!';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: txtFieldHintText,
                        prefixIcon: Icon(
                          Icons.vpn_key,
                          size: 19,
                          color: Colors.white,
                        ),
                        suffixIcon: InkWell(
                          splashColor: Colors.transparent,
                          child: isPasswordVisible
                              ? Icon(
                                  Icons.remove_red_eye,
                                  color: Colors.white38,
                                )
                              : Icon(
                                  MdiIcons.eyeOff,
                                  color: Colors.white38,
                                ),
                          onTap: () {
                            _pwdShowHide();
                          },
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white60)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white))),
                  ),
                ),
              ])),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: CustomMediaQuery.screenWidth / 7.5),
            child: Row(
              children: <Widget>[
                Transform.scale(
                  scale: 0.9,
                  child: Checkbox(
                    activeColor: Colors.blueGrey,
                    value: _isChecked,
                    onChanged: (val) {
                      _isChecked = val;
                      setState(() {
                        _isChecked = val;
                      });
                    },
                  ),
                ),
                AutoSizeText(
                  'Are you Faculty Member?',
                  style: TextStyle(color: Colors.white),
                  maxFontSize: 13,
                ),
              ],
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
            Padding(
              padding:
                  EdgeInsets.only(right: CustomMediaQuery.screenWidth / 7.5),
              child: InkWell(
                child: AutoSizeText(
                  'Forget Password?',
                  style: TextStyle(color: Colors.white),
                  maxFontSize: 12,
                  maxLines: 1,
                ),
                onTap: () {},
              ),
            )
          ]),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: CustomMediaQuery.screenWidth / 4,
                vertical: CustomMediaQuery.screenHeight / 21.3),
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              color: Color(0xff7061aa),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: CustomMediaQuery.screenHeight / 64),
                child: AutoSizeText(
                  'LOGIN',
                  style: buttonTextStyle,
                  maxLines: 1,
                ),
              ),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  print('Okay.You are good to go.');
                  _isChecked
                      ? Navigator.pushNamed(context, FacultyDashboardView)
                      : Navigator.pushNamed(context, DashboardView);
                }
              },
            ),
          )
        ]),
      ),
    );
  }

  //Userdefined Function
  void _pwdShowHide() {
    setState(() {
      if (isPasswordVisible == true) {
        isPasswordVisible = false;
      } else {
        isPasswordVisible = true;
      }
    });
  }
}
