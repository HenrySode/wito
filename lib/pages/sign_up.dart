import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:wito/components/my_button.dart';
import 'package:wito/components/text_field.dart';

class SignUp extends StatefulWidget {
  final Function()? onTap;
  SignUp({super.key, required this.onTap});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final acountNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void signUserUp() async {
//loading circle
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    //signup user here

    try {
      //check if the password is confrimed
      if (passwordController.text == confirmPasswordController.text) {
        //pop the the loading circle
        Navigator.pop(context);
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: acountNumberController.text,
          password: passwordController.text,
        );
      } else {
        //sow error message neno la siri halijafanana
        showErrorMessage("Neno la siri halijafanana rudia!");
      }

      //pop the the loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      //pop the the loading circle
      Navigator.pop(context);
      //show error message
      showErrorMessage(e.code);
    }
  }

  //wrong account method
  void showErrorMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(
              child: Text(message),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('lib/images/log.jpeg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black54,
            BlendMode.darken,
          ),
        )),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 25),
              // logo
              Image.asset(
                'lib/images/Logo.png',
                height: 100,
                color: Colors.white,
              ),
              const SizedBox(height: 5),

              //ujumbe
              Text(
                'Karibu',
                style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w300),
              ),
              const SizedBox(height: 30),
              //jina la kwanza textfield
              MyTextField(
                controller: acountNumberController,
                hintText: 'Jina la kwanza',
                obscureText: false,
              ),
              const SizedBox(height: 10),
              //jina la pili textfield
              MyTextField(
                controller: acountNumberController,
                hintText: 'Jina la mwisho',
                obscureText: false,
              ),
              const SizedBox(height: 10),
              //namba textfield
              MyTextField(
                controller: acountNumberController,
                hintText: 'Akaunt Namba',
                obscureText: false,
              ),
              const SizedBox(height: 10),
              //neno siri textfield
              MyTextField(
                controller: passwordController,
                hintText: 'Neno Siri',
                obscureText: true,
              ),
              const SizedBox(height: 10),
              //rudia neno siri
              MyTextField(
                controller: confirmPasswordController,
                hintText: 'Ruddia neno Siri',
                obscureText: true,
              ),
              const SizedBox(height: 10),
              // row of ingia, mgeni, sajiri button
              GestureDetector(
                onTap: signUserUp,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1798D1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                      child: Text(
                    "Jisajiri",
                    style: GoogleFonts.lato(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFFE6E6E6),
                    ),
                  )),
                ),
              ),
              const SizedBox(width: 10),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Unayo akaunti tayari?',
                      style: GoogleFonts.lato(
                        fontSize: 15,
                        color: const Color(0xFFE6E6E6),
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        'Ingia.',
                        style: GoogleFonts.lato(
                          fontSize: 15,
                          color: const Color(0xFFE6E6E6),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
