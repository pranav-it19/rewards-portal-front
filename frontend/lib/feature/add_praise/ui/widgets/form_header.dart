import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rewards_portal/feature/add_praise/domain/cubits/create_praise_cubit.dart';

class FormHeader extends StatelessWidget {
  const FormHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: IconButton(
              onPressed: Navigator.of(context).pop,
              icon: const Icon(Icons.close, size: 25, color: Colors.black),
            ),
          ),
          const Text(
            'Create New Praise',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: IconButton(
              onPressed: () => context.read<CreatePraiseCubit>().triggerSubmit(),
              icon: const Icon(Icons.done, size: 25, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
