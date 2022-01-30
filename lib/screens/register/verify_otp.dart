import 'package:daily_kart/providers/auth.dart';
import 'package:daily_kart/screens/home/home.dart';
import 'package:daily_kart/widgets/coustom_button.dart';
import 'package:daily_kart/widgets/coustom_input_text_field.dart';
import 'package:flutter/material.dart';
import 'package:daily_kart/base/dimension.dart';
import 'package:provider/provider.dart';
import 'user_registration.dart';

class VerifyOtp extends StatefulWidget {
  const VerifyOtp({
    Key? key,
  }) : super(key: key);
  static const routeName = '/verifyotp';

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

bool _isInit = true;
var mobileNumber;

class _VerifyOtpState extends State<VerifyOtp> {
  final TextEditingController otpEditingController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void didChangeDependencies() {
    if (_isInit) {
      _isInit = false;
      mobileNumber = ModalRoute.of(context)?.settings.arguments;
      print(mobileNumber);
    }
    super.didChangeDependencies();
  }

  bool loading = false;

  Future<void> verifyotp(String mobileNumber, String otp) async {
    if (_formKey.currentState!.validate()) {
      try {
        setState(() {
          loading = true;
        });
        final otpstats = await Provider.of<Auth>(context, listen: false)
            .verifyOtp(mobileNumber, otp);
        setState(() {
          loading = false;
        });
        // print(otpstats[1]["steps_completed"]);
        if (otpstats[0]) {
          //showAlert(context, isSuccess[1]);

          if (otpstats[1]["steps_completed"] == 2) {
            Navigator.pushNamed(
              context,
              Home.routeName,
            );
          } else {
            Navigator.pushNamed(
              context,
              UserRegistration.routeName,
            );
          }
        } else {
          print("whent wrong");
        }
      } catch (error) {
        print(error);
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
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 300,
                      child: Image.asset('assets/images/logo.jpg'),
                      padding: const EdgeInsets.only(bottom: 20),
                    ),
                    Text(mobileNumber),
                    CoustomInputField(
                      controller: otpEditingController,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      validator: (value) {
                        if (value?.length != 4) {
                          return 'Please Enter 4 digits code';
                        }
                        return null;
                      },
                      labelText: "Pin Code",
                    ),
                    loading
                        ? const Center(child: CircularProgressIndicator())
                        : CoustomButton(
                            onPressed: () => verifyotp(
                                mobileNumber, otpEditingController.text),
                            text: "verify OTP",
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
