import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test_pj/screens/profile_screen/api/avatar_api.dart';
import 'package:flutter_test_pj/screens/profile_screen/api/user_data_api.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class Avatar extends StatefulWidget {
  @override
  _AvatarState createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  String _imageUrl;
  PickedFile _picker;

  void imageFromGallery() async {
    _picker = await ImagePicker().getImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    File _cropImage = await ImageCropper.cropImage(
      sourcePath: _picker.path,
      maxHeight: 100,
      maxWidth: 100,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
    );
    await AvatarApi.avatarToStorage(_cropImage).then((value) {
      setState(() {
        loadImage();
      });
    });
    await UserDataApi.uploadData(photoURL: _imageUrl);
  }

  Future<Widget> loadImage() async {
    _imageUrl = await AvatarApi.avatarFromStorage();
    if (_imageUrl != null) {
      return ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.network(_imageUrl));
    } else {
      return Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 75,
            width: 75,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey),
            ),
          ),
          Container(height: 25, width: 1, color: Colors.grey),
          Container(width: 25, height: 1, color: Colors.grey),
        ],
      );
    }
  }

  @override
  void initState() {
    loadImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Widget>(
      future: loadImage(),
      builder: (context, snaphot) {
        if (snaphot.connectionState == ConnectionState.done) {
          return InkWell(
            onTap: () => imageFromGallery(),
            child: Container(
              width: 75,
              height: 75,
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: snaphot.data,
            ),
          );
        } else if (snaphot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
