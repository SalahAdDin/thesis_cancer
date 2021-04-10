import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:thesis_cancer/home/presentation/pages/knowledge_screen.dart';
import 'package:thesis_cancer/home/presentation/pages/research_screen.dart';
import 'package:thesis_cancer/home/presentation/pages/stories_screen.dart';
import 'package:thesis_cancer/home/presentation/pages/therapy_screen.dart';
import 'package:thesis_cancer/utils/types.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

PageController? pageController;

class _HomeScreenState extends State<HomeScreen> {
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
    return Container(
      child: PageView(
        children: [
          KnowledgeScreen(),
          TherapyScreen(),
          ResearchScreen(),
          StoriesScreen()
        ],
        controller: pageController,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

// TODO: Bunlar pageview olacaklar, from fluttergram.
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
