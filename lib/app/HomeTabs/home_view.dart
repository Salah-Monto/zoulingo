import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoulingo/app/HomeTabs/home_controller.dart';
import 'package:zoulingo/app/HomeTabs/widgets/player_listTile.dart';
import 'package:zoulingo/app/HomeTabs/widgets/sub_widgets.dart';
import 'package:zoulingo/app/parts/quizes_part/modules/main_page/view/page/home.view.dart';
import 'package:zoulingo/core/config/utils/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildScreens(context),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildScreens(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final currentIndex = ref.watch(homePageStateProvider);

        return IndexedStack(
          index: currentIndex,
          children: const [
            MainView(),
            ChalengeTab(),
            Tab3(),
          ],
        );
      },
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final currentIndex = ref.watch(homePageStateProvider);

        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (index) {
            ref.read(homePageStateProvider.notifier).setIndex(index);
          },
          items: _navBarsItems(),
        );
      },
    );
  }

  List<BottomNavigationBarItem> _navBarsItems() {
    return [
      const BottomNavigationBarItem(
        icon: Icon(Icons.quiz_outlined),
        label: 'التدريبات',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.accessibility_new),
        label: 'الدوري',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Tab 3',
      ),
    ];
  }
}

class ChalengeTab extends StatelessWidget {
  const ChalengeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "دوري الأساطير",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Image.network(
              "https://seeklogo.com/images/M/mobile-legends-bang-bang-logo-71C2E06F9D-seeklogo.com.png",
            ),
            const MyDivider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "المركز الأول ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            theFirstCard(),
            lsitPlayerItem(),
            lsitPlayerItem(),
            lsitPlayerItem()
          ],
        ),
      ),
    );
  }
}

class Tab3 extends StatelessWidget {
  const Tab3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Center(
        child: Text(
          'Tab 3',
          style: TextStyle(color: Colors.white, fontSize: 20.sp),
        ),
      ),
    );
  }
}
