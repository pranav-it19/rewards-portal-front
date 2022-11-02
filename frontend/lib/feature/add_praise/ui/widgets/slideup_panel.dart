import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_textfield/flutter_social_textfield.dart';
import 'package:rewards_portal/feature/add_praise/domain/cubits/create_praise_cubit.dart';
import 'package:rewards_portal/feature/home/domain/cubits/home_cubit.dart';
import 'package:rewards_portal/feature/home/domain/cubits/home_state.dart';
import 'package:rewards_portal/feature/users/cubits/user_cubit.dart';
import 'package:rewards_portal/feature/users/cubits/user_state.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SuggestionPanel extends StatelessWidget {
  const SuggestionPanel({
    Key? key,
    required PanelController slideUpPanelController,
    required SocialTextEditingController socialTextEditingController,
    required this.lastDetection,
    required this.scrollController,
  })  : _slideUpPanelController = slideUpPanelController,
        _socialTextEditingController = socialTextEditingController,
        super(key: key);

  final PanelController _slideUpPanelController;
  final SocialTextEditingController _socialTextEditingController;
  final SocialContentDetection lastDetection;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return lastDetection.type == DetectedType.hashtag
        ? BlocBuilder<HomeCubit, HomeState>(
            builder: (_, HomeState state) {
              return ListView(
                controller: scrollController,
                children: state.tagsList
                    .map((tag) => ListTile(
                          onTap: () {
                            _slideUpPanelController.close();
                            _socialTextEditingController.replaceRange(
                                '#${tag.name.replaceAll(' ', '')}',
                                lastDetection.range);
                            context.read<CreatePraiseCubit>().tagId = tag.id;
                          },
                          title: Text(tag.name),
                        ))
                    .toList(),
              );
            },
          )
        : BlocBuilder<UserCubit, UserState>(
            builder: (_, UserState state) {
              return ListView(
                controller: scrollController,
                children: state.usersList
                    .map((user) => ListTile(
                          onTap: () {
                            _slideUpPanelController.close();
                            _socialTextEditingController.replaceRange(
                                '@${user.name.replaceAll(' ', '')}',
                                lastDetection.range);
                            context.read<CreatePraiseCubit>().mentionedEmail =
                                user.email;
                          },
                          title: Text(user.name),
                        ))
                    .toList(),
              );
            },
          );
  }
}
