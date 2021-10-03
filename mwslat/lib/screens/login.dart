import 'package:flutter/material.dart';
import 'package:mwslat/models/shared.dart';
import 'package:mwslat/screens/homepage.dart';
import 'package:mwslat/screens/signup.dart';
import 'package:mwslat/theme/sharedcolor.dart';
import 'package:mwslat/theme/sharedfontstyle.dart';
import 'package:mwslat/widgets/cutomsbutton.dart';
import 'package:mwslat/widgets/fields.dart';
import 'package:mwslat/widgets/snack.dart';




class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

GlobalKey<FormState> emailKey = GlobalKey<FormState>();
GlobalKey<FormState> passwordKey = GlobalKey<FormState>();

GlobalKey<FormState> formKey = GlobalKey<FormState>();
  
bool isSecure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Form(
          key: formKey,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Container(
                height: MediaQuery.of(context).size.height/3,
                width: MediaQuery.of(context).size.width/2.5,
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('https://png.pngtree.com/png-vector/20190607/ourmid/pngtree-standing-people-illustration-cartoon-business-set-design-worker-png-image_1488881.jpg'),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.circle
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Welcome Back!',
                  style: TextStyle(color: blackColor, fontSize: 35.0, fontWeight: FontWeight.bold),
                ),
              ),
              fields('Email Address', 'youremail@example.com', TextInputType.emailAddress, emailController, emailKey),
              fields(
                'Password',
                '******',
                TextInputType.text,
                passwordController,
                passwordKey,
                secure: isSecure,
                suffix: IconButton(
                  icon: Icon(Icons.remove_red_eye),
                  color: secondaryColor,
                  iconSize: 20.0,
                  onPressed: () {
                    setState(() {
                      isSecure = !isSecure;
                    });
                  },
                )
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    'Forgot Password',
                    style: primaryTextStyle
                  ),
                ),
              ),
              CustomButton(
                'Login',
                () {
                  if(!formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(snack('Some Fields Required', Colors.red));
                  }else{
                    Shared.saveOffline('email', emailController.text);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {return HomePage();}));
                  }
                }
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Dont Have an Account?  ',
                      style: primaryTextStyle
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) {return SignUp();}));
                      },
                      child: Text(
                        'Sign up',
                        style: TextStyle(color: primaryColor, fontSize: 20.0, fontWeight: FontWeight.bold)
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}