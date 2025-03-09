import 'package:flutter/material.dart';
import 'package:finalproject/patient/patient_homepage.dart';
import 'package:finalproject/login/patient/faviourite.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:finalproject/nurse/nurse_homepage.dart';

void main() {
  runApp(
    ScreenUtilInit(
      designSize: const Size(360, 690), // Adjust based on your design
      minTextAdapt: true,
      builder: (context, child) => const HomePage(),
    ),
  );
}

class NurseCard extends StatelessWidget {
  final String name, experience, rating, location, price, time, image;
  const NurseCard(
      {super.key,
      required this.name,
      required this.experience,
      required this.rating,
      required this.location,
      required this.price,
      required this.time,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: Padding(
        padding: EdgeInsets.all(12.h.w),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(image,
                  width: 80.w, height: 90.h, fit: BoxFit.cover),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                  Text('$experience سنة خبرة',
                      style: const TextStyle(color: Colors.grey)),
                  Text(location,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(time, style: const TextStyle(color: Colors.green)),
                ],
              ),
            ),
            Column(
              children: [
                IconButton(
                  icon: const Icon(Icons.favorite_border),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Faviourite()));
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const NurseDetailsPage()));
                  },
                  child: const Text('Book Now'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
