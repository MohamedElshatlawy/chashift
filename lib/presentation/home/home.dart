import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:koin_flutter/src/widget_extension.dart';
import 'package:shiftapp/data/repositories/user/user_repository.dart';
import 'package:shiftapp/presentation/appliedoffers/pages/appliedoffers_pages.dart';
import 'package:shiftapp/presentation/common/extensions.dart';
import 'package:shiftapp/presentation/joboffers/jobs_offers_screen.dart';
import 'package:shiftapp/presentation/overview/overview_screen.dart';
import 'package:shiftapp/presentation/profile/index.dart';
import 'package:shiftapp/presentation/profile/pages/profile_screen.dart';
import 'package:shiftapp/presentation/resources/colors.dart';
import 'package:shiftapp/presentation/resources/constants.dart';
import 'package:shiftapp/presentation/resume/pages/resume_pages.dart';
import 'package:shiftapp/presentation/settings/settings_screen.dart';
import 'package:shiftapp/presentation/widgets/app_widgets.dart';
import 'package:shiftapp/presentation/widgets/dialogs_manager.dart';
import 'package:shiftapp/presentation/widgets/material_text.dart';
import 'package:shiftapp/utils/notification.dart';

import '../../main.dart';

class MyHomePage extends StatefulWidget {
  static const routeName = '/home';
  const MyHomePage({Key? key}) : super(key: key);



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _widgetOptions = <Widget>[
    const OverviewPage(),
     JobsOffersScreen(),
     AppliedOffersPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  final GlobalKey<ScaffoldState> _scaffoldKey =
  GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final strings = context.getStrings();
    final UserRepository userRepository = getKoin().get();
    return Scaffold(
      key: _scaffoldKey,
      appBar: kAppBar(context,hasDrawerMenu: true,isMain: true,onClickMenu: (){
        _scaffoldKey.currentState!.openDrawer();
      }),
      drawerScrimColor: kPrimaryDark.withOpacity(0.7),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  // Important: Remove any padding from the ListView.
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    Container(
                      child: DrawerHeader(
                        decoration: const BoxDecoration(),
                        child: Column(
                          children: [
                            Container(
                              width: 100,
                              child: CircleAvatar(
                                  radius: 40,
                                  backgroundImage: Image.asset('images/user.png').image
                              ),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.grey.shade300,
                                  width: 3.0,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              userRepository.getUser()!.name.toString(),
                              style: kTextBoldTitle,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),

                    buildDrawerItem(
                        title:  context.getStrings().profile,
                        icon: const Icon(Icons.person,color: kAccent,),
                        onTap: () {
                          Navigator.pushNamed(context, ProfilePage.routeName);
                          showAWNotification();
                        }),
                    buildDrawerItem(
                        title:  context.getStrings().applied_jobs,
                        icon: const Icon(Icons.date_range,color: kAccent,),
                        onTap: () {
                          Navigator.pushNamed(context, AppliedOffersPage.routeName);
                        }),
                    buildDrawerItem(
                        title:  context.getStrings().resume,
                        icon: const Icon(Icons.library_books,color: kAccent,),
                        onTap: () {
                          Navigator.pushNamed(context, ResumePages.routeName);
                        }),
                    buildDrawerItem(
                        title:  context.getStrings().settings,
                        icon: const Icon(Icons.settings,color: kAccent,),
                        onTap: () {
                          Navigator.pushNamed(context, SettingsScreen.routeName);
                        }),
                  ],
                ),
              ),
            ],
          )
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // This is all you need!
        backgroundColor: Colors.white,
        unselectedItemColor: kPrimary,
        showSelectedLabels: true,

        showUnselectedLabels: true,
        selectedIconTheme: const IconThemeData(
          color: kPrimaryDark,
        ),
        selectedLabelStyle:
        kTextBold.copyWith(color: kPrimaryDark, fontSize: 12),
        unselectedLabelStyle: kTextLabel.copyWith(
            color: Colors.black.withOpacity(0.7), fontSize: 14),
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: const Icon(
                Icons.grid_view,
              ),
              label: context.getStrings().overview),
          BottomNavigationBarItem(
              icon: const Icon(
                Icons.work_rounded,
              ),
              label: context.getStrings().jobs),
          BottomNavigationBarItem(
              icon: const Icon(
                Icons.date_range,
              ),
              label: strings.working_hours),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: kPrimaryDark,
        onTap: _onItemTapped,
      ),
    );
  }
}

Widget buildDrawerItem(
    {required String title,
      required Widget icon,
      required Function() onTap}) {
  return InkWell(
    onTap: onTap,
    child: MaterialText(
      title,
      style: kTextSemiBold,
      startIconPadding: const EdgeInsetsDirectional.only(end: 12),
      startIcon: icon,
      padding: const EdgeInsetsDirectional.only(start: 16, top: 8, bottom: 8),
    ),
  );
}


