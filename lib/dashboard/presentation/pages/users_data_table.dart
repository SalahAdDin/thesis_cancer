import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:thesis_cancer/utils/types.dart';

class UsersDataTable extends StatefulWidget {
  UsersDataTable({Key? key}) : super(key: key);

  @override
  _UsersDataTableState createState() => _UsersDataTableState();
}

class _UsersDataTableState extends State<UsersDataTable> {
  String userRole = EnumToString.convertToString(UserRole.ADMIN);

  @override
  Widget build(BuildContext context) {
    return DataTable(sortColumnIndex: 1, columns: const <DataColumn>[
      DataColumn(label: Text('Fotograf')),
      DataColumn(
        label: Text('Tam Adı'),
        //onSort: () {users.sort((first, second)=>first.displayName.comparedTo(second.displayName))}
      ),
      DataColumn(label: Text('E-posta')),
      DataColumn(label: Text('Telefon numarası')),
      DataColumn(label: Text('Görev')),
      DataColumn(label: Text('Hareketler')),
    ], rows: <DataRow>[
      DataRow(cells: <DataCell>[
        DataCell(Text('Dummy')),
        DataCell(Text('Luis Alaguna')),
        DataCell(Text('luis.alaguna@cloudnesil.com')),
        DataCell(Text('+905373749236')),
        DataCell(Text(userRole)),
        DataCell(IconButton(
          icon: Icon(
            Icons.edit,
            size: 20,
          ),
          tooltip: 'Tooltip',
          onPressed: () {},
        ))
        // DataCell(Icon(Icons.edit))
      ])
    ]);
  }
}
