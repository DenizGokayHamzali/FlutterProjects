import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<StatefulWidget> {
  XFile? _image;

  Future<void> _getImageFromCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    if(image!=null) { // If image is not null send it to _image.
      ImageCropper cropper = ImageCropper();
      final croppedImage = await cropper.cropImage(
        sourcePath: image.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        iosUiSettings: const IOSUiSettings(
          title: 'Cropper',
        ),
      );
      setState(() {
        _image = croppedImage != null ? XFile(croppedImage.path) : null;
      });
    }
  }

  _openCamera() {
    if(_image == null) {
      _getImageFromCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GeminiMath"),
      ),
      body: Stack(
        children: [
          _image == null ? const Text("No Image is selected!") : Image.file(File(_image!.path)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _openCamera();
        },
        tooltip: _image == null ? "Pick image" : "Send image",
        child: Icon(_image == null ? Icons.camera_alt : Icons.send),
      )
    );
  }
}
