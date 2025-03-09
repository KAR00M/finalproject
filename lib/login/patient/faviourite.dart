import 'package:finalproject/reminder/patient_reminder.dart';
import 'package:flutter/material.dart';
import 'package:finalproject/patient/profile_patient_nurse.dart';
import 'package:finalproject/patient/filter.dart';
import 'package:finalproject/patient/profile_user.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(
    ScreenUtilInit(
      designSize: const Size(360, 690), // Adjust based on your design
      minTextAdapt: true,
      builder: (context, child) => const Faviourite(),
    ),
  );
}

class Faviourite extends StatefulWidget {
  const Faviourite({super.key});

  @override
  _faviouritestate createState() => _faviouritestate();
}

class _faviouritestate extends State<Faviourite> {
  int selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });

    if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProfilePage()),
      );
    }
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const PatientReminder()),
      );
    }
    // if (index == 0) {
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (context) => const HomePage()),
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: 2,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.alarm), label: 'Reminder'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_sharp), label: 'Faviourite'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Home', style: TextStyle(color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h),
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.format_list_bulleted_rounded),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const FilterPage()));
                  },
                ),
                hintText: 'Search a Nurses',
                filled: true,
                fillColor: Colors.blue[50],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: ListView(
                children: const [
                  NurseCard(
                    name: 'Abeer Shahin',
                    experience: '15',
                    rating: '5',
                    location: 'الغشام',
                    price: '500',
                    time: '12:00AM - 12:00 PM',
                    image: 'assets/abeer.jpeg',
                  ),
                  NurseCard(
                    name: 'Nada Fawzy',
                    experience: '10',
                    rating: '4.5',
                    location: 'القومية',
                    price: '300',
                    time: '8:00AM - 8:00 PM',
                    image: 'assets/2.jpg',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
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
                  Text('$price pound / الساعة',
                      style: const TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            Column(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.favorite_sharp,
                    color: Color.fromARGB(255, 207, 36, 24),
                    size: 28,
                  ),
                  onPressed: () {},
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
