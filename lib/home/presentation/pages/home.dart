import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:thesis_cancer/home/presentation/pages/introductory_screen.dart';
import 'package:thesis_cancer/home/presentation/pages/lobby_screen.dart';
import 'package:thesis_cancer/user/domain/user.entity.dart';
import 'package:thesis_cancer/user/presentation/pages/dash_board_screen.dart';
import 'package:thesis_cancer/utils/navigator.dart';
import 'package:thesis_cancer/utils/types.dart';

class HomeScreen extends StatelessWidget {
  final User currentUser;

  HomeScreen({required this.currentUser});

  UserStatus assignUserStatus(User targetUser) {
    if (targetUser.isConfirmed == true) {
      if (targetUser.role == UserRole.ADMIN)
        return UserStatus.ADMIN;
      else if (targetUser.hasSeenIntroductoryVideo ==
          true) if (targetUser.hasSeenTutorial == true)
        return UserStatus.FINAL;
      else
        return UserStatus.TUTORIAL;
      else
        return UserStatus.INTRODUCTION;
    } else
      return UserStatus.UNCONFIRMED;
  }

  Future deliverUserScreen(BuildContext context, User targetUser) {
    UserStatus userStatus = assignUserStatus(currentUser);
    switch (userStatus) {
      case UserStatus.UNCONFIRMED:
        return pushToPage(context, LobbyScreen());
        break;
      case UserStatus.ADMIN:
        return pushToPage(context, DashBoardScreen());
        break;
      case UserStatus.INTRODUCTION:
        return pushToPage(context, IntroductoryScreen());
        break;
      case UserStatus.TUTORIAL:
        return pushToPage(
            context, HomeNavigationBuilder(builder: (context, moduleTab) {}));
        break;
      case UserStatus.FINAL:
        return pushToPage(
            context, HomeNavigationBuilder(builder: (context, moduleTab) {}));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container();
  }
}

class HomeNavigationBuilder extends StatefulWidget {
  // TODO: Required ?
  const HomeNavigationBuilder({Key? key, required this.builder})
      : super(key: key);
  final Widget Function(BuildContext, ModuleTab) builder;

  @override
  _HomeNavigationBuilderState createState() => _HomeNavigationBuilderState();
}

class _HomeNavigationBuilderState extends State<HomeNavigationBuilder> {
  // TODO: Move this state into a provider that can be set when a profile is selected
  ModuleTab _currentTab = ModuleTab.THERAPY;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.builder(context, _currentTab),
      bottomNavigationBar: BottomNavigation(
          currentTab: _currentTab,
          onSelectedTab: (tab) => setState(() => _currentTab = tab)),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation(
      {required this.currentTab, required this.onSelectedTab});

  final ModuleTab currentTab;

  final ValueChanged<ModuleTab> onSelectedTab;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentTab.index,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(MdiIcons.bookInformationVariant), label: 'Bilgi'),
        BottomNavigationBarItem(
            icon: Icon(MdiIcons.meditation), label: 'Tedavi'),
        BottomNavigationBarItem(
            icon: Icon(MdiIcons.flask), label: 'Geliştirmeler'),
        BottomNavigationBarItem(
            icon: Icon(MdiIcons.tooltipTextOutline), label: 'Hikayeler'),
      ],
      onTap: (index) => onSelectedTab(ModuleTab.values[index]),
    );
  }
}
