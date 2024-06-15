// ignore_for_file: library_private_types_in_public_api
import 'dart:io';
import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/service_locator/service_locator.dart';
import 'package:fixer/core/widgets/buttons/default_button.dart';
import 'package:fixer/features/craftsman_sign_up/data/repos/craftsman_signup_repo_implementation.dart';
import 'package:fixer/features/craftsman_sign_up/manager/craftsman_sign_up_cubit/craftsman_sign_up_cubit.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class CraftsmanProfileScreen extends StatefulWidget {
  const CraftsmanProfileScreen({super.key});

  @override
  _CraftsmanProfileScreenState createState() => _CraftsmanProfileScreenState();
}

class _CraftsmanProfileScreenState extends State<CraftsmanProfileScreen> {
  File? _profileImage;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => CraftsmanSignUpCubit(
          getIt<CraftsmanSignUpRepositoryImplementation>()),
      child: BlocBuilder<CraftsmanSignUpCubit, CraftsmanSignUpState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(S.of(context).uploadProfile),
              centerTitle: true,
              toolbarHeight: 80.h,
            ),
            body: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  verticalSpace(size.height * 0.2),
                  Center(
                    child: GestureDetector(
                      onTap: _pickImage,
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.grey[300],
                        backgroundImage: _profileImage != null
                            ? FileImage(_profileImage!)
                            : const AssetImage('assets/placeholder.png')
                                as ImageProvider,
                        child: _profileImage == null
                            ? Icon(
                                Icons.camera_alt,
                                size: 40,
                                color: Colors.grey[800],
                              )
                            : null,
                      ),
                    ),
                  ),
                  verticalSpace(40),
                  if (state is! CraftsmenUploadProfileImageLoading)
                    DefaultButton(
                      text: "Upload",
                      onPressed: () {},
                    ),
                  if (state is! CraftsmenUploadProfileImageLoading)
                    const CircularProgressIndicator.adaptive()
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
