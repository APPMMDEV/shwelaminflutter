import 'package:flutter/material.dart';

import '../MyHelper/prefData.dart';
import 'stockPage.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final loginformkey = GlobalKey<FormState>();
  var username = TextEditingController();
  var password = TextEditingController();

  var usrName = '';
  var psw = '';

  void checkUsr() {
    setState(() {
      if (username.text == usrName && password.text == psw) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('OK')));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Wrong')));
      }
    });
  }

  Future getupdata() async {
    usrName = await DataPref.getusrname();
    psw = await DataPref.getPsw();
  }

  @override
  void initState() {
    // TODO: implement initState

    getupdata();

    super.initState();
  }

  void CheckLogin() async {
    setState(() {
      if (username.text == usrName && password.text == psw) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Welcome')));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Wrong User Name (or) password')));
      }
    });

    if (username.text == usrName && password.text == psw) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => const StockPage()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Wrong User Name (or) password')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: loginformkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: 200,
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: TextFormField(
                    controller: username,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Username can't be Empty";
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                        labelText: 'Username',
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder())),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 200,
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: TextFormField(
                    controller: password,
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password can't be Empty";
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder())),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (loginformkey.currentState!.validate()) {
                          CheckLogin();
                        }
                      });
                    },
                    child: const Text('Login')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
