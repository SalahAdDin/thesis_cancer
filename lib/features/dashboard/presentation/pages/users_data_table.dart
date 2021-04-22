import 'package:data_tables/data_tables.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:thesis_cancer/core/domain/types.dart';

class UsersDataTable extends StatefulWidget {
  UsersDataTable({Key? key}) : super(key: key);

  @override
  _UsersDataTableState createState() => _UsersDataTableState();
}

class _UsersDataTableState extends State<UsersDataTable> {
  String userRole = EnumToString.convertToString(UserRole.ADMIN);

  // TODO: Improve at most!
  @override
  Widget build(BuildContext context) {
    return NativeDataTable(
        sortColumnIndex: 1,
        header: Text(
          'Users',
          style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 35),
        ),
        columns: const <DataColumn>[
          DataColumn(label: Text('Fotograf')),
          DataColumn(
            label: Text('Tam Adı'),
            //onSort: () {users.sort((first, second)=>first.displayName.comparedTo(second.displayName))}
          ),
          DataColumn(label: Text('E-posta')),
          DataColumn(label: Text('Telefon numarası')),
          DataColumn(label: Text('Görev')),
          DataColumn(label: Text('Hareketler')),
        ],
        rows: <DataRow>[
          DataRow(cells: <DataCell>[
            DataCell(Text('Dummy')),
            DataCell(Container(
                constraints: BoxConstraints(
                    minWidth: (MediaQuery.of(context).size.width) / 6),
                child: Text('Luis Alaguna'))),
            DataCell(Container(
                constraints: BoxConstraints(
                    minWidth: (MediaQuery.of(context).size.width) / 6),
                child: Text('luis.alaguna@cloudnesil.com'))),
            DataCell(Container(
                constraints: BoxConstraints(
                    minWidth: (MediaQuery.of(context).size.width) / 6),
                child: Text('+905373749236'))),
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
