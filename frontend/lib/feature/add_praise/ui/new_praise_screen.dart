import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_textfield/flutter_social_textfield.dart';
import 'package:rewards_portal/feature/add_praise/domain/cubits/create_praise_cubit.dart';
import 'package:rewards_portal/feature/add_praise/ui/widgets/create_praise_form.dart';
import 'package:rewards_portal/feature/add_praise/ui/widgets/slideup_panel.dart';
import 'package:rewards_portal/feature/home/domain/cubits/home_cubit.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class NewPraiseScreen extends StatefulWidget {
  @override
  State<NewPraiseScreen> createState() => _NewPraiseScreenState();
}

class _NewPraiseScreenState extends State<NewPraiseScreen> {
  late final CreatePraiseCubit cubit;

  final _textEditCtrl = SocialTextEditingController();
  final _slideUpPanelCtrl = PanelController();

  late final StreamSubscription<SocialContentDetection> textDetectionSub;

  bool isShowingModalBottomSheet = false;

  SocialContentDetection textDetection = SocialContentDetection(
    DetectedType.plain_text,
    TextRange.empty,
    "",
  );

  @override
  void initState() {
    cubit = CreatePraiseCubit();
    textDetectionSub = _textEditCtrl.subscribeToDetection(onDetectContent);
    _textEditCtrl
      ..text = ""
      ..setTextStyle(
        DetectedType.mention,
        TextStyle(
          color: Colors.purple,
          backgroundColor: Colors.purple.withAlpha(50),
        ),
      )
      ..setTextStyle(
        DetectedType.url,
        const TextStyle(
          color: Colors.blue,
          decoration: TextDecoration.underline,
        ),
      )
      ..setTextStyle(
        DetectedType.hashtag,
        const TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.w600,
        ),
      );

    super.initState();
  }

  @override
  void dispose() {
    textDetectionSub.cancel();
    _textEditCtrl.dispose();
    super.dispose();
  }

  void showMentionBottomSheet() {
    if (_slideUpPanelCtrl.isPanelClosed) {
      _slideUpPanelCtrl.animatePanelToPosition(0.4);
      _slideUpPanelCtrl.open();
    }
  }

  void onDetectContent(SocialContentDetection detection) {
    setState(() => textDetection = detection);
    if (detection.type == DetectedType.mention ||
        detection.type == DetectedType.hashtag) {
      showMentionBottomSheet();
    } else {
      _slideUpPanelCtrl.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    final form = CreatePraiseForm(
      textEditingCtrl: _textEditCtrl,
    );

    final page = Scaffold(
      body: SlidingUpPanel(
        isDraggable: false,
        maxHeight: MediaQuery.of(context).size.height * 0.3,
        minHeight: 0,
        controller: _slideUpPanelCtrl,
        panelBuilder: _panelBuilder,
        body: form,
      ),
    );

    return BlocProvider.value(
      value: cubit,
      child: BlocListener<CreatePraiseCubit, CreatePraiseState>(
        listener: (_, CreatePraiseState state) {
          if (state is TriggerFormSubmit) {
            cubit.submitForm(_textEditCtrl.text);
          }
          if (state is FormSubmitSuccess) {
            Navigator.pop(context);
            context.read<HomeCubit>().getFeeds();
          }
        },
        child: page,
      ),
    );
  }

  Widget _panelBuilder(ScrollController scrlCtrl) {
    return SuggestionPanel(
      scrollController: scrlCtrl,
      slideUpPanelController: _slideUpPanelCtrl,
      socialTextEditingController: _textEditCtrl,
      lastDetection: textDetection,
    );
  }
}
