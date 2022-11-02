import 'dart:io';

import 'package:cloudinary_sdk/cloudinary_sdk.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rewards_portal/core/locator.dart';
import 'package:rewards_portal/feature/home/domain/repository/feed_repository.dart';

part 'create_praise_state.dart';

class CreatePraiseCubit extends Cubit<CreatePraiseState> {
  CreatePraiseCubit() : super(FormInitial());

  String tagId = '';
  String mentionedEmail = '';

  File? imageFile;

  final cloudinary = Cloudinary.full(
    apiKey: '658536657695466',
    apiSecret: '557S8fgouQ6zKyfQJjW-opyPBnQ',
    cloudName: 'dt0x1ckc6',
  );

  triggerSubmit() {
    emit(TriggerFormSubmit());
  }

  Future<void> submitForm(String message) async {
    emit(SubmittingForm());

    // TODO: Get image url
    final imageUrl = await uploadCloudinary(imageFile!);
    await getIt<FeedRepository>()
        .addFeed(tagId, message, mentionedEmail, imageUrl ?? '');

    emit(FormSubmitSuccess());
  }

  Future<String?> uploadCloudinary(File file) async {
    final response = await cloudinary.uploadResource(
      CloudinaryUploadResource(
        filePath: file.path,
        fileBytes: await file.readAsBytes(),
        fileName: 'certificate',
      ),
    );
    if (response.isSuccessful) {
      print('Get your image from with ${response.secureUrl}');
      return response.url;
    }
  }
}
