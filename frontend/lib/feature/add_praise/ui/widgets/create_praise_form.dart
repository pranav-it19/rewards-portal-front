import 'dart:io';

import 'package:cloudinary_sdk/cloudinary_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_textfield/flutter_social_textfield.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rewards_portal/feature/add_praise/domain/cubits/create_praise_cubit.dart';
import 'package:rewards_portal/feature/add_praise/ui/widgets/form_header.dart';
import 'package:http/http.dart' as http;

class CreatePraiseForm extends StatefulWidget {
  const CreatePraiseForm({Key? key, required this.textEditingCtrl})
      : super(key: key);

  final SocialTextEditingController textEditingCtrl;

  @override
  State<CreatePraiseForm> createState() => _CreatePraiseFormState();
}

class _CreatePraiseFormState extends State<CreatePraiseForm> {
  // late final CreatePraiseCubit cubit;
  // @override
  // void initState() {
  //   super.initState();
  //   cubit = CreatePraiseCubit();
  // }

  File? imageFile;

  String baseUrl =
      'https://658536657695466:557S8fgouQ6zKyfQJjW-opyPBnQ@api.cloudinary.com/v1_1/dt0x1ckc6/resources/image';

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);

      setState(() {
        imageFile = imageTemp;
      });
      context.read<CreatePraiseCubit>().imageFile = imageTemp;
    } on PlatformException catch (e) {
      print(e);
    }
  }

  void handle(File file) {}

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const FormHeader(),
          TextField(
            maxLines: 10,
            controller: widget.textEditingCtrl,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(14)),
                borderSide: BorderSide(color: Colors.black.withOpacity(0.25)),
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(14)),
                borderSide: BorderSide(color: Colors.black),
              ),
              hintText: 'Enter your praise here!',
            ),
          ),
          SizedBox(
            height: 50,
          ),
          // TODO: Get data from state
          if (imageFile != null)
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                color: Colors.green,
                image: DecorationImage(image: FileImage(imageFile!)),
              ),
            ),
          ElevatedButton(
              onPressed: () => pickImage(), child: Text('Add a Certificate'))
        ],
      ),
    );
  }
}
