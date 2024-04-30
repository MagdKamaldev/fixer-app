import 'package:fixer/features/craftsman_sign_up/presentation/upload_photos/presentation/views/widgets/upload_photos_body.dart';
import 'package:flutter/material.dart';

class UploadPhotosView extends StatelessWidget {
  const UploadPhotosView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const UploadPhotosBody(),
    );
  }
}