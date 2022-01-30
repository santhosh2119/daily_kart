import 'package:daily_kart/providers/auth.dart';
import 'package:daily_kart/screens/home/home.dart';
import 'package:daily_kart/screens/register/phone_register.dart';
import 'package:daily_kart/widgets/coustom_button.dart';
import 'package:daily_kart/widgets/coustom_input_text_field.dart';
import 'package:daily_kart/widgets/coustom_space.dart';
import 'package:daily_kart/widgets/coustom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:daily_kart/base/dimension.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  static const routeName = '/login';
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController mobile = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  bool _loading = false;

  _register() {
    Navigator.of(context).pushNamed(PhoneRegister.routeName);
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Error Occured'),
        content: Text(message),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: const Text('OK!'),
          )
        ],
      ),
    );
  }

  Future login(BuildContext context) async {
    if (_form.currentState!.validate()) {
      setState(() {
        _loading = true;
      });
      try {
        await Provider.of<Auth>(context, listen: false)
            .loginIn(mobile.text, password.text)
            .then((value) {
         
          Navigator.of(context).pushNamed(Home.routeName);
          setState(() {
            _loading = false;
          });
        }).catchError((e) {
          setState(() {
            _loading = false;
          });
    
          String errorMsg = 'Cant Authenticate you, Try Again Later';
          if (e.toString().contains(
              'We have blocked all requests from this device due to unusual activity. Try again later.')) {
            errorMsg = 'Please wait as you have used limited number request';
          }
 
          _showErrorDialog(context, errorMsg);
        });
      } catch (e) {
        setState(() {
          _loading = false;
        });

        _showErrorDialog(context, e.toString());
      }
    }
  }

  

  @override
  Widget build(BuildContext context) {
   
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
            child: SizedBox(
              child: Form(
                key: _form,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 300,
                      child: Image.asset('assets/images/logo.jpg'),
                      padding: const EdgeInsets.only(bottom: 20),
                    ),
                    CoustomInputField(
                        controller: mobile,
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value!.length != 10) {
                            return 'Please Enter Validate Mobile';
                          }
                          return null;
                        },
                        labelText: "Mobile Number"),
                    const CoustomSpace(),
                    CoustomInputField(
                        controller: password,
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        validator: (value) {
                          if (value!.length < 6) {
                            return 'Please Enter Atleast 6 Charaters';
                          }
                          return null;
                        },
                        labelText: "Password"),
                    const CoustomSpace(),
                    _loading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : CoustomButton(
                            onPressed: () => login(context),
                            text: "Login",
                          ),
                    const CoustomSpace(),
                    CoustomTextButton(
                      onPressed: _register,
                      text: "Register",
                    ),
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
