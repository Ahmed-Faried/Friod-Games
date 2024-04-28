import 'package:flutter/material.dart';

import '../Components/const.dart';

class ListAge extends StatefulWidget {
  ListAge({super.key});

  @override
  State<ListAge> createState() => _ListAgeState();
}

class _ListAgeState extends State<ListAge> {


  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Color(0xff6D5ED2),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35.0 , vertical: 10),
          child: DropdownButton<String>(
            value: selectedAge,
              alignment : AlignmentDirectional.center ,
            hint: Center(child: Text('Select Age' ,  style: TextStyle(color: Colors.white, fontSize: 18 , ),)),
            onChanged: (value) {
              setState(() {
                selectedAge = value!;
              });
            },

            dropdownColor:     Color(0xff189CFC),
               // تغيير لون الخلفية
            icon: Icon(Icons.arrow_drop_down, color: Colors.black), // تغيير أيقونة السهم
            underline: Container(), // إزالة الخط الأسفل
            elevation: 8, // إضافة ظل
            style: TextStyle(color: Colors.black, fontSize: 18 , ),

            items: ageRanges.map((String ageRange) {
              return DropdownMenuItem<String>(
                value: ageRange,
                child: Center(child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: Text(ageRange ,style: TextStyle( fontSize: 18 , fontWeight: FontWeight.w500), ),
                )),
              );
            }).toList(),
          ),
        ),
      );

  }
}
