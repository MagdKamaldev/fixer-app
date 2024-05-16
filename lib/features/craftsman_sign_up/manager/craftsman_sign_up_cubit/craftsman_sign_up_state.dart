part of 'craftsman_sign_up_cubit.dart';

sealed class CraftsmanSignUpState {}

final class CraftsmanSignUpInitial extends CraftsmanSignUpState {}

class FrontImagePickedFromGallerySuccessState extends CraftsmanSignUpState {}

class FrontImagePickedFromGalleryErrorState extends CraftsmanSignUpState {}

class FrontImagePickedFromCameraSuccessState extends CraftsmanSignUpState {}

class FrontImagePickedFromCameraErrorState extends CraftsmanSignUpState {}

class BackImagePickedFromGallerySuccessState extends CraftsmanSignUpState {}

class BackImagePickedFromGalleryErrorState extends CraftsmanSignUpState {}

class BackImagePickedFromCameraSuccessState extends CraftsmanSignUpState {}

class BackImagePickedFromCameraErrorState extends CraftsmanSignUpState {}

class UploadFrontImageLoadingState extends CraftsmanSignUpState {}

class UploadFrontImageSuccessState extends CraftsmanSignUpState {}

class UploadFrontImageErrorState extends CraftsmanSignUpState {}

class RemoveImageState extends CraftsmanSignUpState {}

class GetLocationsLoading extends CraftsmanSignUpState {}

class GetlocationsSuccess extends CraftsmanSignUpState {
  final List<OperatingAreaModel> locations;

  GetlocationsSuccess(this.locations);
}

class GetlocationsError extends CraftsmanSignUpState {}

class RegisterCraftsmanLoading extends CraftsmanSignUpState {}

class RegisterCraftsmanSuccess extends CraftsmanSignUpState {
  final CraftsmanModel craftsman;

  RegisterCraftsmanSuccess(this.craftsman);
}

class RegisterCraftsmanError extends CraftsmanSignUpState {
  final String message;

  RegisterCraftsmanError(this.message);
}
