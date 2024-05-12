part of 'craftsman_sign_up_cubit.dart';
sealed class CraftsmanSignUpState {}

final class CraftsmanSignUpInitial extends CraftsmanSignUpState {}


class FrontImagePickedFromGallerySuccessState extends CraftsmanSignUpState{}

class FrontImagePickedFromGalleryErrorState extends CraftsmanSignUpState{}

class FrontImagePickedFromCameraSuccessState extends CraftsmanSignUpState{}

class FrontImagePickedFromCameraErrorState extends CraftsmanSignUpState{}


class BackImagePickedFromGallerySuccessState extends CraftsmanSignUpState{}

class BackImagePickedFromGalleryErrorState extends CraftsmanSignUpState{}

class BackImagePickedFromCameraSuccessState extends CraftsmanSignUpState{}

class BackImagePickedFromCameraErrorState extends CraftsmanSignUpState{}

class RemoveImage extends CraftsmanSignUpState{}
