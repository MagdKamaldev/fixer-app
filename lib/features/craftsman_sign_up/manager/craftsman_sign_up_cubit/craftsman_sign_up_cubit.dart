// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:io';

import 'package:fixer/core/networks/errors/error_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
part 'craftsman_sign_up_state.dart';

class CraftsmanSignUpCubit extends Cubit<CraftsmanSignUpState> {
  CraftsmanSignUpCubit() : super(CraftsmanSignUpInitial());

  static CraftsmanSignUpCubit get(context) => BlocProvider.of(context);

  File? storyImage;
  var pickedFile;
  var picker = ImagePicker();

  Future<void> getStoryImagefromGallery(context) async {
    pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      storyImage = File(pickedFile.path);
      Navigator.pop(context);
      emit(StoryImagePickedFromGallerySuccessState());
    } else {
      showErrorSnackbar(
        context,
        "no image selected",
      );
      emit(StoryImagePickedFromGalleryErrorState());
    }
  }

  Future<void> getStoryImagefromCamera(context) async {
    pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      storyImage = File(pickedFile.path);
      Navigator.pop(context);
      emit(StoryImagePickedFromCameraSuccessState());
    } else {
      showErrorSnackbar(
        context,
        "no image selected",
      );
      emit(StoryImagePickedFromCameraErrorState());
    }
  }

  void removeImage() {
    pickedFile = null;
    emit(RemoveImage());
  }
}
