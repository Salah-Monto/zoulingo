import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoulingo/app/HomeTabs/home_controller.dart';

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
          children: [
            Tab1(),
            Tab2(),
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
        icon: Icon(Icons.home),
        label: 'Tab 1',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.search),
        label: 'Tab 2',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Tab 3',
      ),
    ];
  }
}

class Tab1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Text(
          'Tab 1',
          style: TextStyle(color: Colors.white, fontSize: 20.sp),
        ),
      ),
    );
  }
}

class Tab2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(
        child: Text(
          'Tab 2',
          style: TextStyle(color: Colors.white, fontSize: 20.sp),
        ),
      ),
    );
  }
}

class Tab3 extends StatelessWidget {
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
