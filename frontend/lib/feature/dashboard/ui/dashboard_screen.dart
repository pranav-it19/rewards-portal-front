import 'package:diamond_bottom_bar/diamond_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rewards_portal/feature/add_praise/ui/new_praise_screen.dart';
import 'package:rewards_portal/feature/home/domain/cubits/home_cubit.dart';
import 'package:rewards_portal/feature/home/ui/home_screen.dart';
import 'package:rewards_portal/feature/leadboard/domain/cubits/leaderboard_cubit.dart';
import 'package:rewards_portal/feature/leadboard/ui/leadboard_screen.dart';
import 'package:rewards_portal/feature/users/cubits/user_cubit.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  late Widget _selectedWidget;

  @override
  void initState() {
    _selectedWidget = const HomeScreen();
    context.read<UserCubit>().getUsers();
    context.read<HomeCubit>().getTags();
    super.initState();
  }

  void onPressed(index) {
    setState(() {
      if (index == 0) {
        _selectedIndex = 0;
        _selectedWidget = const HomeScreen();
      } else if (index == 1) {
        debugPrint('Add New Praise');
        _showNewPraiseScreen();
      } else if (index == 2) {
        _selectedIndex = 2;
        _selectedWidget = const LeadboardScreen();
      }
    });
  }

  void _showNewPraiseScreen() {
    showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25),
          topLeft: Radius.circular(25),
        ),
      ),
      context: context,
      builder: (BuildContext context) => NewPraiseScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _selectedWidget,
      bottomNavigationBar: DiamondBottomNavigation(
        itemIcons: const [
          Icons.home,
          Icons.leaderboard,
        ],
        centerIcon: Icons.add,
        selectedIndex: _selectedIndex,
        onItemPressed: onPressed,
      ),
    );
  }
}
