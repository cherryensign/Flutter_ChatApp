import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  const UserImagePicker({super.key, required this.onPickImage});

  final void Function(File pickedImage) onPickImage;

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File? _pickedImageFile;

  void _pickImage() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
      maxWidth: 150,
    );
    if (pickedImage == null) {
      return;
    }
    setState(() {
      _pickedImageFile = File(pickedImage.path);
    });

    widget.onPickImage(_pickedImageFile!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          backgroundImage:
              _pickedImageFile != null ? FileImage(_pickedImageFile!) : null,
          child: IconButton(
            onPressed: _pickImage,
            icon: _pickedImageFile != null
                ? const Icon(
                    Icons.edit,
                    semanticLabel: 'Edit image',
                  )
                : const Icon(
                    Icons.camera_enhance,
                    semanticLabel: 'Add image',
                  ),
          ),
        ),
      ],
    );
  }
}
