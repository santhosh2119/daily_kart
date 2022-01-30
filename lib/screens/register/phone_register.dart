import 'package:daily_kart/base/dimension.dart';
import 'package:daily_kart/providers/auth.dart';
import 'package:daily_kart/screens/register/login.dart';
import 'package:daily_kart/widgets/coustom_button.dart';
import 'package:daily_kart/widgets/coustom_input_text_field.dart';
import 'package:daily_kart/widgets/coustom_space.dart';
import 'package:daily_kart/widgets/coustom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'verify_otp.dart';

class PhoneRegister extends StatefulWidget {
  static const routeName = '/phone';

  const PhoneRegister({Key? key}) : super(key: key);

  @override
  _PhoneRegisterState createState() => _PhoneRegisterState();
}

class _PhoneRegisterState extends State<PhoneRegister> {
  final TextEditingController _phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool loading = false;

  Future<void> _registerphone() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        loading = true;
      });
      try {
        final register = await Provider.of<Auth>(context, listen: false)
            .mobileRegistrationOTP(_phoneController.text);
        setState(() {
          loading = false;
        });

        if (register[0]) {
          //showAlert(context, isSuccess[1]);
          Navigator.pushNamed(context, VerifyOtp.routeName,
              arguments: _phoneController.text);
        } else {
          print("whent wrong");
        }
      } catch (error) {
        print(error);
      }
    }
    // Navigator.of(context).pushNamed(VerifyOtp.routeName);
  }

  _login() {
    Navigator.of(context).pushNamed(Login.routeName);
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
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 300,
                      child: Image.asset('assets/images/logo.jpg'),
                      padding: const EdgeInsets.only(bottom: 20),
                    ),
                    CoustomInputField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.done,
                      validator: (value) {
                        if (value!.length != 10) {
                          return 'Please Enter Validate Mobile';
                        }
                        return null;
                      },
                      labelText: "Mobile Number",
                    ),
                    const CoustomSpace(),
                    loading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : CoustomButton(
                            onPressed: _registerphone,
                            text: "Send OTP",
                          ),
                    const CoustomSpace(),
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Already have an account?'),
                          CoustomTextButton(onPressed: _login, text: "Login")
                        ],
                      ),
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
