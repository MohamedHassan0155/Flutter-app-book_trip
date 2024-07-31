import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'userdata.dart';
import 'create_account_screen.dart';
import 'home_screen.dart';
import 'home_screen.dart';

class Login extends StatelessWidget {
  final dbHelper = DatabaseHelper.instance;

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var loginformkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: loginformkey,
          child: Container(
            margin: const EdgeInsetsDirectional.only(top: 0),
            child: SafeArea(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsetsDirectional.only(
                          start: 20, top: 5),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/pyricon (1).jpg',
                            width: 80,
                            height: 50,
                            fit: BoxFit.contain,
                          ),
                          Container(
                              margin: const EdgeInsetsDirectional.only(
                                  start: 3, top: 20),
                              child: const Text('Egypt Travel',
                                  style: TextStyle(
                                      fontFamily: 'flu',
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold))),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsetsDirectional.only(
                          start: 25, top: 45),
                      child: const Text(
                          'Welcome',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      margin: const EdgeInsetsDirectional.only(start: 25),
                      child: const Text(
                          'Back',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(height: 35),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                          start: 30, end: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: TextFormField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'You must enter a correct email address';
                                }
                                if (value.length <= 10) {
                                  return 'email can\'t be less than 11 letters';
                                }
                                if (value.length >= 30) {
                                  return 'email can\'t be larger than 29 letters ';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                suffixIcon: Icon(
                                  Icons.email,
                                  color: Colors.black.withOpacity(.5),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                labelText: 'Email Address',
                              ),
                            ),
                          ),
                          SizedBox(height: 25),
                          Container(
                            child: TextFormField(
                              controller: passwordController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'You must enter a password';
                                }
                                if (value.length < 6) {
                                  return 'password can\'t be less than 6 letters';
                                }
                                if (value.length > 20) {
                                  return 'password can\'t be larger than 20 letters ';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: true,
                              decoration: InputDecoration(
                                suffixIcon: Icon(Icons.visibility_off,
                                  color: Colors.black.withOpacity(.5),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                labelText: 'Password',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                        alignment: Alignment.center,
                        child: InkWell(
                            onTap: () {},
                            child: const Text('forgot password ?',
                                style: TextStyle(
                                    fontFamily: 'flu',
                                    color: Colors.grey,
                                    fontSize: 18)))),
                    const SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: const Color(0xff8e3200)),
                        color: const Color(0xff8e3200),
                      ),
                      child: MaterialButton(
                        onPressed: () async {
                          String email = emailController.text;
                          String password = passwordController.text;

                          // Check if the user exists in the database
                          bool userExists = await dbHelper.userExists(email, password);

                          if (userExists) {
                            // Navigate to home screen after successful login
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => Home_page()),
                            );
                          } else {
                            // Show an error message for invalid login
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Error'),
                                  content: Text('Invalid email or password. Please try again.'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                        child: const Text(
                          'sign in',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 120,
                          child: const Divider(
                            height: 20,
                            color: Colors.black,
                            thickness: 2,
                          ),
                        ),
                        const Text(
                          '   Or   ',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Container(
                          width: 120,
                          child: const Divider(
                            height: 20,
                            color: Colors.black,
                            thickness: 2,
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: const EdgeInsetsDirectional.only(
                          start: 30, top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () async {},
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.white,
                              child: Image.asset(
                                'assets/images/g.jpg',
                                width: 100,
                                height: 100,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          InkWell(
                            onTap: () {},
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.white,
                              child: Image.asset(
                                'assets/images/insta1.jpg',
                                width: 100,
                                height: 100,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          InkWell(
                            onTap: () {},
                            child: CircleAvatar(
                              radius: 35,
                              backgroundColor: Colors.white,
                              child: Image.asset(
                                'assets/images/facebook.png',
                                width: 100,
                                height: 100,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'New user ? ',
                          style: TextStyle(
                              color: Colors.black.withOpacity(.7),
                              fontSize: 15),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Creataccount()),
                            );
                          },
                          child: Text(
                            'sign up',
                            style: TextStyle(
                                color: Colors.black.withOpacity(.8),
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}