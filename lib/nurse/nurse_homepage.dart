import 'package:flutter/material.dart';
import 'package:finalproject/nurse/profile.dart';
import 'package:finalproject/notification.dart';
import 'package:finalproject/reminder/reminder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:finalproject/login/nurse/nurse_login_screen.dart';

void main() {
  runApp(
    ScreenUtilInit(
      designSize: const Size(360, 690), // Adjust based on your design
      minTextAdapt: true,
      builder: (context, child) => const NurseDetailsApp(),
    ),
  );
}

class NurseDetailsApp extends StatelessWidget {
  const NurseDetailsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NurseDetailsPage(),
    );
  }
}

class NurseDetailsPage extends StatefulWidget {
  const NurseDetailsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NurseDetailsPageState createState() => _NurseDetailsPageState();
}

class _NurseDetailsPageState extends State<NurseDetailsPage> {
  DateTime selectedDate = DateTime.now();

  void _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  void _changeDate(int days) {
    setState(() {
      selectedDate = selectedDate.add(Duration(days: days));
    });
  }

  int selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    if (index == 2) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const ProfilePage()),
      );
    }
    if (index == 1) {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const MedicineReminderApp()));
    }

    if (index == 0) {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const NurseDetailsApp()));
    }
  }

  List<String> notifications = [
    "You have a new message",
    "Your order has been shipped",
    "New comment on your post",
    "Update available",
    "Your friend sent you a request"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => NurseLoginScreen()));
            }),
        title: const Row(
          children: [
            SizedBox(width: 15),
            Icon(Icons.star_border_outlined, color: Colors.amber),
            SizedBox(width: 15),
            Text(
              "Nurse Details",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Spacer(),
          ],
        ),
      ),
      endDrawer: Drawer(
        width: 320,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
                width: 5.w, color: const Color.fromARGB(123, 33, 149, 243)),
            color: const Color.fromARGB(217, 255, 255, 255),
          ),
          child: Column(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.r),
                    color: Colors.blue),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.notifications, size: 50.w, color: Colors.white),
                    SizedBox(height: 10.h),
                    Text("Notifications",
                        style: TextStyle(color: Colors.white, fontSize: 20.sp)),
                  ],
                ),
              ),
              Expanded(
                child: notifications.isEmpty
                    ? Center(
                        child: Text("No new notifications",
                            style: TextStyle(fontSize: 16.sp)))
                    : ListView.builder(
                        itemCount: notifications.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(top: 2),
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(20.r),
                                border: Border.all(
                                    color: const Color.fromARGB(31, 0, 0, 0))),
                            child: ListTile(
                              leading: const Icon(Icons.notifications_active,
                                  color: Colors.blue),
                              title: Text(notifications[index]),
                              trailing: IconButton(
                                icon: const Icon(Icons.arrow_forward_sharp,
                                    color: Colors.blue),
                                onPressed: () {
                                  setState(() {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const NotificationPage()));
                                  });
                                },
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: const Color.fromARGB(29, 119, 176, 223),
              borderRadius: BorderRadius.circular(20)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Section
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    width: 400,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            // Profile Image
                            Container(
                              width: 100.w,
                              height: 130.h,
                              margin: const EdgeInsets.only(left: 5),
                              decoration: BoxDecoration(
                                border: Border.all(),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(10),
                                image: const DecorationImage(
                                  image: AssetImage(
                                      'assets/2.jpg'), // Replace with your image
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: 15.w),
                            // Nurse Info
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.only(left: 2, top: 2),
                                  child: Text(
                                    "BMS. SALMA AHMED",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.sp),
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                Column(
                                  children: [
                                    _infoCard(
                                        "Time", "8:00AM | 8:00PM\nSat - Thur"),
                                    SizedBox(width: 5.w),
                                    Row(
                                      children: [
                                        SizedBox(width: 14.w),
                                        _infoCard("Rate", "⭐ 4.9"),
                                        SizedBox(width: 10.w),
                                        _infoCard("EXP:", "10 Years"),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        // Contact Icons
                        Container(
                          padding: const EdgeInsets.only(left: 100),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  width: 40.w,
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        107, 195, 203, 210),
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: const Icon(Icons.phone,
                                      color:
                                          Color.fromARGB(255, 76, 124, 175))),
                              SizedBox(width: 35.w),
                              Container(
                                  width: 40.w,
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        107, 195, 203, 210),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Icon(Icons.email,
                                      color:
                                          Color.fromARGB(255, 76, 124, 175))),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 35.h),

                // About Section
                Text(
                  "About Nurse:",
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5.h),
                const Text(
                  "ممرضة ذات خبرة واسعة في تقديم الرعاية الصحية الشاملة للمرضى بمختلف الحالات. بارعة في تنفيذ الإجراءات الطبية، متابعة العلامات الحيوية، وإدارة الأدوية وفقًا لأعلى معايير السلامة. تتميز بالتواصل الفعال، والتعامل الإنساني.",
                  textAlign: TextAlign.right,
                  style: TextStyle(color: Color.fromARGB(255, 75, 71, 71)),
                ),

                SizedBox(height: 55.h),

                // Date Selection Buttons
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 133, 165, 197)),
                        onPressed: () => _changeDate(1),
                        child: const Text(
                          "Next",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      SizedBox(width: 30.w),
                      GestureDetector(
                        onTap: () => _selectDate(context),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: const Color.fromARGB(255, 166, 203, 229),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.calendar_today, size: 18),
                              SizedBox(width: 5.w),
                              Text(
                                  "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}"),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 30.w),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[300]),
                        onPressed: () => _changeDate(-1),
                        child: const Text("Previous",
                            style: TextStyle(color: Colors.black)),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15.h),
                // Appointments Table
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue[50],
                  ),
                  child: Column(
                    children: [
                      _tableHeader(),
                      const Divider(),
                      _tableRow(1, "Abeer Shahin", "8:00 AM", "الغشام", true),
                      _tableRow(
                          2, "Nourhan Ismail", "10:00 AM", "الغشام", false),
                      _tableRow(3, "Esraa Adel", "12:00 PM", "الغشام", true),
                      _tableRow(4, "Nada Fawzy", "1:00 PM", "الغشام", false),
                      _tableRow(5, "Kareem Hesham", "2:30 PM", "الغشام", false),
                      _tableRow(6, "Ziad Saleh", "4:20 PM", "الغشام", false),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_time), label: "Reminder"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  // Widget for Info Card
  Widget _infoCard(String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Colors.blue[100],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(subtitle, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  // Widget for Table Header
  Widget _tableHeader() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("No", style: TextStyle(fontWeight: FontWeight.bold)),
        Text("Name", style: TextStyle(fontWeight: FontWeight.bold)),
        Text("Time", style: TextStyle(fontWeight: FontWeight.bold)),
        Text("Place", style: TextStyle(fontWeight: FontWeight.bold)),
        Icon(Icons.check_box_outline_blank),
      ],
    );
  }

  // Widget for Table Row
  Widget _tableRow(
      int no, String name, String time, String place, bool checked) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(width: 10, height: 30, child: Text("$no")),
        SizedBox(width: 100, height: 30, child: Text(name)),
        Text(time),
        Text(place),
        Icon(checked ? Icons.check_box : Icons.check_box_outline_blank,
            color: checked
                ? const Color.fromARGB(255, 76, 124, 175)
                : Colors.grey),
      ],
    );
  }
}
