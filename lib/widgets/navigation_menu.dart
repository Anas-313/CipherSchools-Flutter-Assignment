import 'package:expense_tracking_app/screens/home_screen.dart';
import 'package:expense_tracking_app/screens/income/income.dart';
import 'package:expense_tracking_app/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Income()));
        },
        backgroundColor: const Color(0xFF7F3DFF),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          surfaceTintColor: Colors.white,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          destinations: const [
            NavigationDestination(
                icon: Image(
                    image: AssetImage('assets/images/home.png'),
                    color: Color(0xFF7F3DFF)),
                label: 'Home'),
            NavigationDestination(
                icon: Image(
                    image: AssetImage('assets/images/transaction.png'),
                    color: Color(0xFF7F3DFF)),
                label: 'Transactions'),
            NavigationDestination(
                icon: Image(
                    image: AssetImage('assets/images/budget.png'),
                    color: Color(0xFF7F3DFF)),
                label: 'Budget'),
            NavigationDestination(
                icon: Image(
                    image: AssetImage('assets/images/profile.png'),
                    color: Color(0xFF7F3DFF)),
                label: 'Profile'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    const HomeScreen(),
    Container(
        color: Colors.teal, child: const Center(child: Text('Transactions'))),
    Container(color: Colors.yellow, child: const Center(child: Text('Budget'))),
    const ProfileScreen(),
  ];
}
