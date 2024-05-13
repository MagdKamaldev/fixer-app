// ignore_for_file: prefer_typing_uninitialized_variables
import 'dart:io';
import 'dart:math';
import 'package:fixer/core/models/operating_area_model.dart';
import 'package:fixer/core/networks/errors/error_snackbar.dart';
import 'package:fixer/features/craftsman_sign_up/data/repos/craftsman_signup_repo_implementation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
part 'craftsman_sign_up_state.dart';

class CraftsmanSignUpCubit extends Cubit<CraftsmanSignUpState> {
  CraftsmanSignUpCubit(this.repositoryImplementation)
      : super(CraftsmanSignUpInitial());

  final CraftsmanSignUpRepositoryImplementation repositoryImplementation;

  static CraftsmanSignUpCubit get(context) => BlocProvider.of(context);

  File? frontImage;
  var frontFile;
  var frontPicker = ImagePicker();

  Future<void> getFrontImagefromGallery(context) async {
    frontFile = await frontPicker.pickImage(source: ImageSource.gallery);
    if (frontFile != null) {
      frontImage = File(frontFile.path);
      Navigator.pop(context);
      emit(FrontImagePickedFromGallerySuccessState());
    } else {
      showErrorSnackbar(
        context,
        "no image selected",
      );
      emit(FrontImagePickedFromGalleryErrorState());
    }
  }

  Future<void> getFrontImagefromCamera(context) async {
    frontFile = await frontPicker.pickImage(source: ImageSource.camera);
    if (frontFile != null) {
      frontImage = File(frontFile.path);
      Navigator.pop(context);
      emit(FrontImagePickedFromCameraSuccessState());
    } else {
      showErrorSnackbar(
        context,
        "no image selected",
      );
      emit(FrontImagePickedFromCameraErrorState());
    }
  }

  void removeFrontImage() {
    frontImage = null;
    emit(RemoveImageState());
  }

  //back

  File? backImage;
  var backFile;
  var backPicker = ImagePicker();

  Future<void> getbackImagefromGallery(context) async {
    backFile = await backPicker.pickImage(source: ImageSource.gallery);
    if (backFile != null) {
      backImage = File(backFile.path);
      Navigator.pop(context);
      emit(BackImagePickedFromGallerySuccessState());
    } else {
      showErrorSnackbar(
        context,
        "no image selected",
      );
      emit(BackImagePickedFromGalleryErrorState());
    }
  }

  Future<void> getbackImagefromCamera(context) async {
    backFile = await backPicker.pickImage(source: ImageSource.camera);
    if (backFile != null) {
      backImage = File(backFile.path);
      Navigator.pop(context);
      emit(BackImagePickedFromCameraSuccessState());
    } else {
      showErrorSnackbar(
        context,
        "no image selected",
      );
      emit(BackImagePickedFromCameraErrorState());
    }
  }

  void removebackImage() {
    backImage = null;
    emit(RemoveImageState());
  }

  Future<void> getLocations() async {
    final response = await repositoryImplementation.getOperatingAreas();

    response.fold(
      (l) {
        print(e.toString());
        emit(GetlocationsError());
      },
      (r) {
        emit(GetlocationsSuccess(r));
      },
    );
  }
}