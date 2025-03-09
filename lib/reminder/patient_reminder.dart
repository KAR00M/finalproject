import 'package:flutter/material.dart';
import 'package:finalproject/nurse/nurse_homepage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:finalproject/nurse/profile.dart';

void main() {
  runApp(
    ScreenUtilInit(
      designSize: const Size(360, 690), // Adjust based on your design
      minTextAdapt: true,
      builder: (context, child) => const PatientReminder(),
    ),
  );
}

class PatientReminder extends StatefulWidget {
  const PatientReminder({super.key});

  @override
  _patientReminderAppState createState() => _patientReminderAppState();
}

class _patientReminderAppState extends State<PatientReminder> {
  List<Map<String, String>> medicines = [];

  void addMedicine(Map<String, String> medicine) {
    setState(() {
      medicines.add(medicine);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Medicine Reminder',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(medicines: medicines, addMedicine: addMedicine),
    );
  }
}

class HomePage extends StatefulWidget {
  final List<Map<String, String>> medicines;
  final Function(Map<String, String>) addMedicine;

  const HomePage(
      {super.key, required this.medicines, required this.addMedicine});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedDay = '';

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
          MaterialPageRoute(builder: (context) => const PatientReminder()));
    }

    if (index == 0) {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const NurseDetailsApp()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: 1,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.alarm), label: 'Reminder'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_sharp), label: 'Faviourite'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      appBar: AppBar(
          title: const Text('Medicine Reminder'),
          leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const NurseDetailsApp()));
              })),
      body: Container(
        padding: EdgeInsets.all(5.w.h),
        decoration: BoxDecoration(
          border:
              Border.all(width: 3.w, color: const Color.fromARGB(75, 0, 0, 0)),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(13, 16, 117, 194),
              offset: Offset(4, 10),
              spreadRadius: 2,
              blurRadius: 2,
            )
          ],
        ),
        child: Column(
          children: [
            SizedBox(height: 10.h),
            Container(
              margin: const EdgeInsets.only(top: 5, bottom: 10),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 225, 236, 244),
                border: Border.all(),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(129, 167, 186, 201),
                    offset: Offset(4, 10),
                    spreadRadius: 2,
                    blurRadius: 2,
                  )
                ],
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(7, (index) {
                    String day = [
                      'Sat',
                      'Sun',
                      'Mon',
                      'Tue',
                      'Wed',
                      'Thu',
                      'Fri'
                    ][index];
                    bool isActive =
                        selectedDay == day; // Check if button is active
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(70, 60, 155, 228),
                                offset: Offset(4, 10),
                                spreadRadius: 2,
                                blurRadius: 2,
                              )
                            ],
                            border: Border.all()),
                        child: MaterialButton(
                          minWidth: 100.w,
                          height: 150.h,
                          textColor: isActive
                              ? Colors.white // Text color when active
                              : const Color.fromARGB(255, 4, 31, 68),
                          color: isActive
                              ? Colors.blue // Active button color
                              : const Color.fromARGB(255, 255, 255, 255),
                          onPressed: () {
                            setState(() {
                              selectedDay = day;
                            });
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(day),
                              Text('${index + 1}'),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: widget.medicines.length,
                itemBuilder: (context, index) {
                  if (selectedDay.isEmpty ||
                      widget.medicines[index]['day'] == selectedDay) {
                    return Card(
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0.r),
                        side: BorderSide(
                            color: const Color.fromARGB(126, 33, 149, 243),
                            width: 2.w),
                      ),
                      elevation: 5,
                      shadowColor: Colors.grey,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 8),
                      child: ListTile(
                          title: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(46, 234, 224, 224),
                                border: Border.all(
                                    color: const Color.fromARGB(75, 0, 0, 0)),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              children: [
                                const Icon(Icons.medical_services_outlined),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                  widget.medicines[index]['name']!,
                                  style: TextStyle(
                                      fontSize: 22.sp,
                                      color:
                                          const Color.fromRGBO(57, 88, 134, 1),
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 8.h),
                                  Row(
                                    children: [
                                      const Icon(Icons.medication_outlined),
                                      SizedBox(width: 10.w),
                                      Text(
                                        style: TextStyle(
                                            color: const Color.fromRGBO(
                                                57, 88, 134, 1),
                                            fontSize: 14.sp),
                                        'Type: ${widget.medicines[index]['type']} ',
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5.h),
                                  Row(
                                    children: [
                                      const Icon(Icons.fastfood),
                                      SizedBox(width: 10.w),
                                      Text(
                                        style: TextStyle(
                                            color: const Color.fromRGBO(
                                                57, 88, 134, 1),
                                            fontSize: 14.sp),
                                        'MealTime: ${widget.medicines[index]['mealTime']}',
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5.h),
                                  Row(
                                    children: [
                                      const Icon(Icons.access_time_outlined),
                                      SizedBox(width: 10.w),
                                      Text(
                                        style: TextStyle(
                                            color: const Color.fromRGBO(
                                                57, 88, 134, 1),
                                            fontSize: 14.sp),
                                        'Time: ${widget.medicines[index]['time']}',
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5.h),
                                  Row(
                                    children: [
                                      const Icon(Icons.repeat),
                                      SizedBox(width: 10.w),
                                      Text(
                                        style: TextStyle(
                                            color: const Color.fromRGBO(
                                                57, 88, 134, 1),
                                            fontSize: 14.sp),
                                        'Repeat: ${widget.medicines[index]['repeat']}',
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Container(
                                width: 50.w,
                                height: 50
                                    .h, // Adjusted height for a more proportionate button
                                decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color.fromARGB(47, 163, 194, 218),
                                      offset: Offset(2, 2),
                                      spreadRadius: 2,
                                      blurRadius: 4,
                                    )
                                  ],
                                  color:
                                      const Color.fromARGB(212, 255, 255, 255),
                                  borderRadius: BorderRadius.circular(15.r),
                                  border: Border.all(
                                      color: const Color.fromARGB(83, 0, 0, 0)),
                                ),
                                child: IconButton(
                                  icon: Icon(Icons.delete,
                                      color:
                                          const Color.fromARGB(203, 9, 39, 63),
                                      size: 24
                                          .sp), // Adjust icon size using screenutil
                                  onPressed: () {
                                    setState(() {
                                      widget.medicines.removeAt(index);
                                    });
                                  },
                                  padding: EdgeInsets
                                      .zero, // Removes extra padding inside IconButton
                                  alignment: Alignment.center,
                                ),
                              )
                            ],
                          )),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 5.w.h),
              child: MaterialButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        AddMedicinePage(addMedicine: widget.addMedicine),
                  ),
                ),
                color: const Color.fromARGB(255, 76, 116, 175),
                textColor: Colors.white,
                minWidth: 200.w,
                height: 60.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.add),
                    SizedBox(width: 8.w),
                    const Text('Add Medicine'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddMedicinePage extends StatefulWidget {
  final Function(Map<String, String>) addMedicine;

  const AddMedicinePage({super.key, required this.addMedicine});

  @override
  _AddMedicinePageState createState() => _AddMedicinePageState();
}

class _AddMedicinePageState extends State<AddMedicinePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  String medicineType = 'Capsule';
  String mealTime = 'Before Meal';
  TimeOfDay? selectedTime;
  int repeatHours = 6;
  DateTime? selectedDate;
  String repeatDays = 'Daily';
  String selectedDay = 'Sat';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Medicine')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0).w.h,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(16.0).w.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Medicine Name
                  Form(
                    key: _formKey, // Moved form wrapping to include all fields
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Medicine Name
                          TextFormField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              labelText: 'Medicine Name',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              prefixIcon: const Icon(Icons.medical_services),
                            ),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Medicine name is required';
                              }
                              return null;
                            },
                          ),
                        ]),
                  ),

                  SizedBox(height: 15.h),

                  // Medicine Type Dropdown
                  InputDecorator(
                    decoration: InputDecoration(
                      labelText: 'Medicine Type',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: medicineType,
                        isExpanded: true,
                        items: ['Capsule', 'Injection', 'Syrup']
                            .map((e) =>
                                DropdownMenuItem(value: e, child: Text(e)))
                            .toList(),
                        onChanged: (val) {
                          setState(() {
                            medicineType = val!;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h),

                  // Meal Time Selection (Before/After Meal)
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    child: const Column(
                      children: [
                        Text('Meal Time',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile<String>(
                          title: const Text('Before Meal'),
                          value: 'Before Meal',
                          groupValue: mealTime,
                          onChanged: (val) => setState(() => mealTime = val!),
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          title: const Text('After Meal'),
                          value: 'After Meal',
                          groupValue: mealTime,
                          onChanged: (val) => setState(() => mealTime = val!),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),

                  // Select Day
                  InputDecorator(
                    decoration: InputDecoration(
                      labelText: 'Select Day',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedDay,
                        isExpanded: true,
                        items: ['Sat', 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri']
                            .map((e) =>
                                DropdownMenuItem(value: e, child: Text(e)))
                            .toList(),
                        onChanged: (val) => setState(() => selectedDay = val!),
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h),

                  // Repeat Days Dropdown
                  InputDecorator(
                    decoration: InputDecoration(
                      labelText: 'Repeat',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: repeatDays,
                        isExpanded: true,
                        items: ['Daily', 'Weekly', 'Bi-Weekly']
                            .map((e) =>
                                DropdownMenuItem(value: e, child: Text(e)))
                            .toList(),
                        onChanged: (val) => setState(() => repeatDays = val!),
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h),

                  // Select Time Button
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        TimeOfDay? picked = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        if (picked != null) {
                          setState(() => selectedTime = picked);
                        }
                      },
                      icon: const Icon(Icons.access_time),
                      label: Text(
                        selectedTime == null
                            ? 'Select Time'
                            : 'Time: ${selectedTime!.format(context)}',
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),

                  // Save Medicine Button
                  Container(
                    margin: const EdgeInsets.only(top: 85),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            widget.addMedicine({
                              'name': _nameController.text,
                              'type': medicineType,
                              'mealTime': mealTime,
                              'time':
                                  selectedTime?.format(context) ?? 'Not Set',
                              'day': selectedDay,
                              'repeat': repeatDays,
                            });
                            Navigator.pop(context);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 76, 116, 175),
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 15.w),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        child: Text(
                          'Save Medicine',
                          style: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
