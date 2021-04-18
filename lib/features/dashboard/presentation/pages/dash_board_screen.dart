import 'package:flutter/material.dart';
import 'package:thesis_cancer/features/dashboard/presentation/pages/users_data_table.dart';

class DashBoardScreen extends StatefulWidget {
  DashBoardScreen({Key? key}) : super(key: key);

  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

PageController? pageController;

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [UsersDataTable()],
      controller: pageController,
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
    );
  }
}
