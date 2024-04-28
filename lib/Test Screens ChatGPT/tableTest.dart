import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// Example without a datasource
class DataTable2SimpleDemo extends StatelessWidget {
  const DataTable2SimpleDemo();

  @override
  Widget build(BuildContext context) {
    final List<String> DataOneto100 = [
      "1",
      "2",
      "3",
      "4  ",
      "5",
      "6",
      "7",
      "8",
      "9",
      "10",
      "11",
      "1",
      "Null",
      "3",
      "4  ",
      "5",
      "6",
      "7",
      "8",
      "9",
      "10",
      "11",
      "1",
      "2",
      "3",
      "4  ",
      "5",
      "6",
      "7",
      "8",
      "9",
      "10",
      "11",
      "1",
      "2",
      "3",
      "4  ",
      "Null",
      "6",
      "7",
      "8",
      "9",
      "10",
      "11",
      "1",
      "2",
      "3",
      "4  ",
      "5",
      "6",
      "7",
      "8",
      "9",
      "10",
      "11",
      "1",
      "2",
      "3",
      "4  ",
      "5",
      "6",
      "7",
      "8",
      "9",
      "10",
      "11",
      "1",
      "2",
      "Null",
      "4  ",
      "5",
      "6",
      "7",
      "8",
      "9",
      "10",
      "11",
      "1",
      "2",
      "3",
      "4  ",
      "5",
      "6",
      "7",
      "8",
      "9",
      "10",
      "11",
      "1",
      "2",
      "3",
      "4  ",
      "Null",
      "6",
      "7",
      "8",
      "9",
      "Null",
      "11",
      "12"
    ];

    print(DataOneto100[60]);
    return Scaffold(
      body: Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: PaginatedDataTable2(
              headingTextStyle: TextStyle(

                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              dividerThickness: 2,
              border: TableBorder.symmetric(
                inside: BorderSide(width: 1, color: Colors.black),
              ),
              // dataRowColor: MaterialStateProperty.resolveWith((states) {
              //   if (states.contains(MaterialState.selected)) {
              //     return Colors.blue;
              //   } else {
              //     return Colors.white;
              //   }
              // }
              // ),
              headingRowColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.selected)) {
                  return Colors.cyanAccent;
                } else {
                  return Colors.purpleAccent;
                }
              }),
              headingRowDecoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
                color: Color(0xff018755),
              ),
              columnSpacing: 12,
              horizontalMargin: 12,
              onRowsPerPageChanged: (value) {
                print(value);
              },
              // onPageChanged: (value) {
              //   print(value);
              // },
              // header: Text("dataTableHeader"),
              rowsPerPage: defaultRowsPerPage,
              availableRowsPerPage: [defaultRowsPerPage, defaultRowsPerPage * 2, defaultRowsPerPage * 5, defaultRowsPerPage * 10],
              minWidth: 600,
              source: MyDataTableSource(DataOneto100),
              columns: [
                DataColumn2(
                  label: Center(
                    child: Text(
                      'ID',
                    ),
                  ),
                  fixedWidth: 50,
                ),
                DataColumn(
                  label: Center(
                    child: Text(
                      'Product Name',
                    ),
                  ),
                ),
                DataColumn(
                  label: Center(
                    child: Text('Make/Year'),
                  ),
                ),
                DataColumn(
                  label: Center(
                    child: Text(
                      'Brand/Category',
                    ),
                  ),
                ),
                DataColumn(
                  label: Center(
                    child: Text(
                      'Price',
                    ),
                  ),
                  numeric: true,
                ),
                DataColumn(
                  label: Center(
                    child: Text(
                      'Quantity',
                    ),
                  ),
                ),
                DataColumn(
                  label: Center(
                    child: Text(
                      'Discount',
                    ),
                  ),
                ),
                DataColumn2(
                  size: ColumnSize.L,
                  label: Center(
                    child: Text(
                      'Action',
                    ),
                  ),

                ),
              ],

            ),
          ),
        ),
      ),
    );
  }
}

class MyDataTableSource extends DataTableSource {
  final List<String> data;

  MyDataTableSource(this.data);

  @override
  DataRow? getRow(int index) {
    if (index >= data.length) {
      return null;
    }
    return DataRow(cells: [
      DataCell(data[index] != "Null" ? Text("$index") : Text("Null + $index")),
      DataCell(Center(child: Text('B' * (10 - (index + 5) % 10)))),
      DataCell(Center(child: Text('C' * (15 - (index + 5) % 10)))),
      DataCell(Center(child: Text('D' * (15 - (index + 10) % 10)))),
      DataCell(Center(child: Text('e' * (15 - (index + 10) % 10)))),
      DataCell(Center(child: Text('f' * (15 - (index + 10) % 10)))),
      DataCell(Center(child: Text('g' * (15 - (index + 10) % 10)))),
      DataCell(Center(child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton( onPressed: () {  }, icon: Icon(Icons.edit),),
          IconButton( onPressed: () {  }, icon: Icon(Icons.delete_rounded),),
          IconButton( onPressed: () {  }, icon: Icon(Icons.visibility),),
        ],
      ))),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}




// import 'package:data_table_2/data_table_2.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
//
// /// Example without a datasource
// class DataTable2SimpleDemo extends StatelessWidget {
//   const DataTable2SimpleDemo();
//
//   @override
//   Widget build(BuildContext context) {
//     final List<String> DataOneto100 = [
//       "1",
//       "2",
//       "3",
//       "4  ",
//       "5",
//       "6",
//       "7",
//       "8",
//       "9",
//       "10",
//       "11",
//       "1",
//       "Null",
//       "3",
//       "4  ",
//       "5",
//       "6",
//       "7",
//       "8",
//       "9",
//       "10",
//       "11",
//       "1",
//       "2",
//       "3",
//       "4  ",
//       "5",
//       "6",
//       "7",
//       "8",
//       "9",
//       "10",
//       "11",
//       "1",
//       "2",
//       "3",
//       "4  ",
//       "Null",
//       "6",
//       "7",
//       "8",
//       "9",
//       "10",
//       "11",
//       "1",
//       "2",
//       "3",
//       "4  ",
//       "5",
//       "6",
//       "7",
//       "8",
//       "9",
//       "10",
//       "11",
//       "1",
//       "2",
//       "3",
//       "4  ",
//       "5",
//       "6",
//       "7",
//       "8",
//       "9",
//       "10",
//       "11",
//       "1",
//       "2",
//       "Null",
//       "4  ",
//       "5",
//       "6",
//       "7",
//       "8",
//       "9",
//       "10",
//       "11",
//       "1",
//       "2",
//       "3",
//       "4  ",
//       "5",
//       "6",
//       "7",
//       "8",
//       "9",
//       "10",
//       "11",
//       "1",
//       "2",
//       "3",
//       "4  ",
//       "Null",
//       "6",
//       "7",
//       "8",
//       "9",
//       "Null",
//       "11",
//       "12"
//     ];
//
//     print(DataOneto100[60]);
//     return Scaffold(
//       body: Center(
//         child: Container(
//           // width: MediaQuery.sizeOf(context).width / 1.5,
//           // height: MediaQuery.sizeOf(context).height / 1.5,
//           child: Padding(
//             padding: const EdgeInsets.all(16),
//             child: DataTable2(
//                 headingTextStyle: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 dividerThickness: 2,
//                 // decoration: BoxDecoration(
//                 //   color: Colors.green,
//                 // ),
//                 border: TableBorder.symmetric(
//                     inside: BorderSide(width: 1, color: Colors.black)),
//                 dataRowColor: MaterialStateProperty.resolveWith((states) {
//                   if (states.contains(MaterialState.selected)) {
//                     return Colors.blue;
//                   } else {
//                     return Colors.white;
//                   }
//                 }),
//                 headingRowColor: MaterialStateProperty.resolveWith((states) {
//                   if (states.contains(MaterialState.selected)) {
//                     return Colors.cyanAccent;
//                   } else {
//                     return Colors.purpleAccent;
//                   }
//                 }),
//                 headingRowDecoration: BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                       topRight: Radius.circular(10),
//                       topLeft: Radius.circular(10)),
//                   color: Color(0xff018755),
//                 ),
//                 columnSpacing: 12,
//                 horizontalMargin: 12,
//                 minWidth: 600,
//                 columns: [
//                   DataColumn2(
//                       label: Center(
//                           child: Text(
//                         'ID',
//                       )),
//                       // size: ColumnSize.S,
//                       fixedWidth: 50),
//                   DataColumn(
//                     label: Center(
//                         child: Text(
//                       'Product Name',
//                     )),
//                   ),
//                   DataColumn(
//                     label: Center(child: Text('Make/Year')),
//                   ),
//                   DataColumn(
//                     label: Center(
//                         child: Text(
//                       'Brand/Category',
//                     )),
//                   ),
//                   DataColumn(
//                     label: Center(
//                         child: Text(
//                       'Price',
//                     )),
//                     numeric: true,
//                   ),
//                   ////////aaaaaaaaaaaaaaaaaaaaaaaaasddadasdas
//                   DataColumn(
//                     label: Center(
//                         child: Text(
//                       'Quantity',
//                     )),
//                   ),
//                   DataColumn(
//                     label: Center(
//                         child: Text(
//                       'Discount',
//                     )),
//                   ),
//                   DataColumn(
//                     label: Center(
//                         child: Text(
//                       'Action',
//                     )),
//                   ),
//                 ],
//                 rows: List<DataRow>.generate(
//                     DataOneto100.length,
//                     (index) => DataRow(cells: [
//
//                           DataCell(DataOneto100[index] != "Null"
//                               ? Text("$index")
//                               : Text("Null + $index")),
//                           // DataCell(Text('B' * (10 - (index + 5) % 10))),
//                           DataCell(Center(
//                               child: Text('B' * (10 - (index + 5) % 10)))),
//                           DataCell(Center(
//                               child: Text('C' * (15 - (index + 5) % 10)))),
//                           DataCell(Center(
//                               child: Text('D' * (15 - (index + 10) % 10)))),
//                           DataCell(Center(
//                               child: Text('e' * (15 - (index + 10) % 10)))),
//                           DataCell(Center(
//                               child: Text('f' * (15 - (index + 10) % 10)))),
//                           DataCell(Center(
//                               child: Text('g' * (15 - (index + 10) % 10)))),
//
//                           DataCell(Center(
//                               child: Text(((index + 0.1) * 25.4).toString()))),
//                         ]))),
//           ),
//         ),
//       ),
//     );
//   }
// }
