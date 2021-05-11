import 'package:competition/routes/naviagator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Reg extends StatefulWidget {
  @override
  _RegState createState() => _RegState();
}

class _RegState extends State<Reg> {
  final _form = GlobalKey<FormState>();
  TextEditingController _username;
  TextEditingController _email;
  TextEditingController _psswd;
  TextEditingController _newpsswd;

  @override
  Widget build(BuildContext context) {
    final sz = MediaQuery.of(context);

    final logo = Image.asset(
      "assets/logo.png",
      height: sz.size.height / 3.6,
    );

    final usrName = TextFormField(
      controller: _username,
      //keyboardType: TextInputType.emailAddress,
      style: TextStyle(
        color: Colors.white,
      ),
      cursorColor: Colors.white,
      decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          hintText: "Jordan Erifried",
          labelText: "Username",
          labelStyle: TextStyle(
            color: Colors.white,
          ),
          hintStyle: TextStyle(
            color: Colors.white,
          )),
    );

    final emailFld = TextFormField(
      controller: _email,
      //keyboardType: TextInputType.emailAddress,
      style: TextStyle(
        color: Colors.white,
      ),
      cursorColor: Colors.white,
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

    final passwordFld = TextFormField(
      controller: _psswd,
      style: TextStyle(
        color: Colors.white,
      ),
      cursorColor: Colors.white,
      decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          hintText: "Password",
          labelText: "Password",
          labelStyle: TextStyle(
            color: Colors.white,
          ),
          hintStyle: TextStyle(
            color: Colors.white,
          )),
    );

    final newpasswd = TextFormField(
      controller: _newpsswd,
      style: TextStyle(
        color: Colors.white,
      ),
      cursorColor: Colors.white,
      decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          hintText: "Retype your password",
          labelText: "Confirm your password",
          labelStyle: TextStyle(
            color: Colors.white,
          ),
          hintStyle: TextStyle(
            color: Colors.white,
          )),
    );

    final fld = Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          usrName,
          emailFld,
          passwordFld,
          newpasswd,
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
          "Register",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        onPressed: () async {
          // try {
          //   Firebase user =
          //       (await FirebaseAuth.instance.createUserWithEmailAndPassword(
          //     email: _email.text,
          //     password: _psswd.text,
          //   ))
          //           .user as Firebase;
          //   if (user != null) {
          //     UserUpdateInfo updateUser = UserUpdateInfo();
          //     updateUser.displayName = _username.text;
          //     user.updateProfile(updateUser);
          //     Navigator.of(context).pushNamed(NavApp.corps);
          //   }
          // } catch (e) {
          //   print(e);
          //   _username.text = "";
          //   _psswd.text = "";
          //   _newpsswd.text = "";
          //   _email.text = "";
          //   // TODO: alertdialog with error
          // }
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
              "Already have an account ?",
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(color: Colors.white),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pushNamed(NavApp.authConnect);
              },
              child: Text(
                "Login",
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
