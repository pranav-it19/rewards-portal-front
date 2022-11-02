import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rewards_portal/core/constants/color_constants.dart';
import 'package:rewards_portal/feature/auth/domain/cubits/auth_cubit/auth_cubit.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => _showLogoutPopup(context),
      icon: const Icon(CupertinoIcons.power),
    );
  }

  void _showLogoutPopup(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Logout'),
        content: const Text('Do you want to logout?'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Cancel',
                style: TextStyle(fontWeight: FontWeight.w600, color: ColorConstants.blueBg),
              )),
          TextButton(
              onPressed: () => _logout(context),
              child: const Text(
                'Logout',
                style: TextStyle(fontWeight: FontWeight.w600, color: ColorConstants.blueBg),
              )),
        ],
      ),
    );
  }

  void _logout(BuildContext context) {
    Navigator.pop(context);
    context.read<AuthCubit>().logout();
  }
}
