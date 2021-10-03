import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mwslat/models/shared.dart';
import 'package:mwslat/screens/homepage.dart';
import 'package:mwslat/theme/sharedcolor.dart';
import 'package:mwslat/theme/sharedfontstyle.dart';
import 'package:mwslat/widgets/cutomsbutton.dart';
import 'package:mwslat/widgets/fields.dart';
import 'package:mwslat/widgets/snack.dart';




class SignUp extends StatefulWidget {

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

TextEditingController emailController = TextEditingController();
TextEditingController userNameController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController confirmPasswordController = TextEditingController();

GlobalKey<FormState> emailKey = GlobalKey<FormState>();
GlobalKey<FormState> userNameKey = GlobalKey<FormState>();
GlobalKey<FormState> passwordKey = GlobalKey<FormState>();
GlobalKey<FormState> confirmPasswordKey = GlobalKey<FormState>();

GlobalKey<FormState> formKey = GlobalKey<FormState>();
  
bool isSecure = true;

DateTime date = DateTime(1990);

File? pickedImage;

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
                  image: pickedImage == null ? DecorationImage(
                    image: NetworkImage('https://png.pngtree.com/png-vector/20190607/ourmid/pngtree-standing-people-illustration-cartoon-business-set-design-worker-png-image_1488881.jpg'),
                    fit: BoxFit.fill,
                  ) : DecorationImage(
                    image: FileImage(pickedImage!),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.circle
                ),
                alignment: Alignment.center,
                child: IconButton(
                  icon: Icon(Icons.add_a_photo),
                  color: Colors.black,
                  iconSize: 30.0,
                  onPressed: () async {
                    XFile? img = await ImagePicker().pickImage(source: ImageSource.camera);
                    setState(() {
                      pickedImage = File(img!.path);
                    });
                  },
                )
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Create new Account',
                  style: TextStyle(color: blackColor, fontSize: 35.0, fontWeight: FontWeight.bold),
                ),
              ),
              fields('Email Address', 'youremail@example.com', TextInputType.emailAddress, emailController, emailKey),
              fields('User Name', 'Bassel Allam', TextInputType.text, userNameController, userNameKey),
              ListTile(
                title: Text('Birth Date', style: primaryTextStyle),
                subtitle: Text('${date.toString().substring(0, 10)}', style: secondaryTextStyle,),
                trailing: Icon(Icons.calendar_today, color: secondaryColor, size: 20.0),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    firstDate: DateTime(1930),
                    lastDate: DateTime(2010),
                    initialDate: DateTime(1990)
                  );
                  setState(() {
                    date = pickedDate!;
                  });
                },
              ),
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
              fields(
                'Confirm Password',
                '******',
                TextInputType.text,
                confirmPasswordController,
                confirmPasswordKey,
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
              CustomButton(
                'Signup',
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
                      'Have an Account?  ',
                      style: primaryTextStyle
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Login',
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