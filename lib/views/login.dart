import 'package:competition/routes/naviagator.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Connect extends StatefulWidget {
  @override
  _ConnectState createState() => _ConnectState();
}

class _ConnectState extends State<Connect> {
  final _form = GlobalKey<FormState>();
  TextEditingController _email;
  TextEditingController _psswd;

  @override
  Widget build(BuildContext context) {
    final sz = MediaQuery.of(context);

    final logo = Image.asset(
      "assets/logo.png",
      height: sz.size.height / 3.5,
    );

    final emailFld = TextFormField(
      controller: _email,
      //keyboardType: TextInputType.emailAddress,
      style: TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          hintText: "dan@example.com",
          labelText: "Your email",
          labelStyle: TextStyle(
            color: Colors.white,
          ),
          hintStyle: TextStyle(
            color: Colors.white,
          )),
    );

    final passwordFld = Column(
      children: <Widget>[
        TextFormField(
          controller: _psswd,
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              hintText: "Password",
              labelText: "password",
              labelStyle: TextStyle(
                color: Colors.white,
              ),
              hintStyle: TextStyle(
                color: Colors.white,
              )),
        ),
        Padding(
          padding: EdgeInsets.all(2.0),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            MaterialButton(
              child: Text(
                "Forgot Password",
                style: Theme.of(context)
                    .textTheme
                    .caption
                    .copyWith(color: Colors.white),
              ),
              onPressed: () async {
                // try {
                //   User user = (await FirebaseAuth.instance
                //           .signInWithEmailAndPassword(
                //               email: _email.text, password: _psswd.text))
                //       .user;

                //   if (user != null) {
                //     Navigator.of(context).pushNamed(NavApp.corps);
                //   }
                // } catch (e) {
                //   print(e);
                //   _email.text = " ";
                //   _psswd.text = " ";
                // }
              },
            )
          ],
        )
      ],
    );

    final fld = Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          emailFld,
          passwordFld,
        ],
      ),
    );

    final conctBtn = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.white,
      child: MaterialButton(
        minWidth: sz.size.width / 1.2,
        padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
        child: Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        onPressed: () async {
          try {
            User user = (await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: _email.text,
              password: _psswd.text,
            ))
                .user;
            if (user != null) {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setString('displayName', user.displayName);
              Navigator.of(context).pushNamed(NavApp.corps);
            }
          } catch (e) {
            print(e);
            _email.text = "";
            _psswd.text = "";
            // TODO: AlertDialog with error
          }
        },
      ),
    );

    final btm = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        conctBtn,
        Padding(
          padding: EdgeInsets.all(8.0),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Not a menber ?",
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(color: Colors.white),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pushNamed(NavApp.authReg);
              },
              child: Text(
                "Sign Up",
                style: Theme.of(context).textTheme.subtitle1.copyWith(
                    color: Colors.white, decoration: TextDecoration.underline),
              ),
            )
          ],
        )
      ],
    );

    return Scaffold(
      backgroundColor: Color(0xFF8C52FF),
      body: Form(
        key: _form,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(36),
          child: Container(
            height: sz.size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                logo,
                fld,
                Padding(
                  padding: EdgeInsets.only(bottom: 150),
                  child: btm,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
