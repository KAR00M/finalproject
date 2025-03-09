import 'package:flutter/material.dart';
import '../widget/custom_button.dart';
import 'patient/patient_login_screen.dart';
import 'nurse/nurse_login_screen.dart';

class SelectionScreen extends StatelessWidget {
  static const String routeName = '/selection';

  const SelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            Image.asset(
              'assets/onBoarding_photo-removebg-preview.png',
              fit: BoxFit.cover,
              height: 250,
            ),

            const SizedBox(height: 40),

            const Text(
              "Sign As",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 30),

            // Buttons
            CustomButton(
                text: "Nurse",
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => NurseLoginScreen()));
                }),
            const SizedBox(height: 20),
            CustomButton(
                text: "Patient",
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                }),

            const Spacer(),

            // Bottom Rounded Container
            Container(
              width: double.infinity,
              height: 80,
              decoration: const BoxDecoration(
                color: Color(0xFF638ECB),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
