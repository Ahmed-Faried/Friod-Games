import 'package:flutter/material.dart';

class ListAge extends StatefulWidget {
  ListAge({super.key});

  @override
  State<ListAge> createState() => _ListAgeState();
}

class _ListAgeState extends State<ListAge> {
  String? selectedAge;

  List<String> ageRanges = [
    'Under 10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30',
    'Over 30',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Your Age'),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: DropdownButton<String>(
              value: selectedAge,
              hint: Center(child: Text('Select Age')),
              onChanged: (value) {
                setState(() {
                  selectedAge = value!;
                });
              },

              dropdownColor: Colors.yellowAccent[200], // تغيير لون الخلفية
              icon: Icon(Icons.arrow_drop_down, color: Colors.blue), // تغيير أيقونة السهم
              underline: Container(), // إزالة الخط الأسفل
              elevation: 8, // إضافة ظل
              style: TextStyle(color: Colors.black, fontSize: 18 , ),

              items: ageRanges.map((String ageRange) {
                return DropdownMenuItem<String>(
                  value: ageRange,
                  child: Center(child: Text(ageRange)),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
