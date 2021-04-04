import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:thesis_cancer/home/presentation/pages/introductory_screen.dart';
import 'package:thesis_cancer/home/presentation/pages/lobby_screen.dart';
import 'package:thesis_cancer/user/presentation/pages/dash_board_screen.dart';
import 'package:thesis_cancer/user/presentation/provider.dart';
import 'package:thesis_cancer/utils/navigator.dart';
import 'package:thesis_cancer/utils/types.dart';

class HomeScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final currentUserState = useProvider(homeScreenProvider.state);
    return currentUserState.when(
        loading: () => Center(child: CircularProgressIndicator()),
        isAdmin: () => pushToPage(context, DashBoardScreen()),
        unConfirmed: () => pushToPage(context, LobbyScreen()),
        mustSeeIntroduction: () => pushToPage(context, IntroductoryScreen()),
        mustSeeTutorial: () => pushToPage(context, IntroductoryScreen()),
        completed: () => pushToPage(context, IntroductoryScreen()),
        error: (error) {
          final errorSnackBar = SnackBar(
            content: Row(
              children: [
                Icon(Icons.bolt, color: Theme.of(context).errorColor),
                Text(
                  error,
                  style: TextStyle(color: Theme.of(context).errorColor),
                )
              ],
            ),
            backgroundColor: Theme.of(context).backgroundColor,
            duration: Duration(milliseconds: 1500),
          );
          ScaffoldMessenger.of(context).showSnackBar(errorSnackBar);
          // TODO: Keep on here: right now it keeps on Loading screen.
          // pushToPage(context, SplashScreenState());
        });
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
