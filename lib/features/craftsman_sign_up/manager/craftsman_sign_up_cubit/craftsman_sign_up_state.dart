part of 'craftsman_sign_up_cubit.dart';
sealed class CraftsmanSignUpState {}

final class CraftsmanSignUpInitial extends CraftsmanSignUpState {}


class StoryImagePickedFromGallerySuccessState extends CraftsmanSignUpState{}

class StoryImagePickedFromGalleryErrorState extends CraftsmanSignUpState{}

class StoryImagePickedFromCameraSuccessState extends CraftsmanSignUpState{}

class StoryImagePickedFromCameraErrorState extends CraftsmanSignUpState{}

class RemoveImage extends CraftsmanSignUpState{}
