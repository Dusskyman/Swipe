import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_pj/models/user_api/user_from_database.dart';
import 'package:flutter_test_pj/screens/profile_screen/api/user_data_api.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class UserCard extends StatefulWidget {
  @override
  _UserCardState createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  File _image;
  PickedFile _picker;
  imageFromGallery() async {
    _picker = await ImagePicker().getImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    _image = await ImageCropper.cropImage(
      sourcePath: _picker.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
    );
    setState(() {
      loadImage();
    });
  }

  loadImage() {
    if (_image != null) {
      return ClipRRect(
          borderRadius: BorderRadius.circular(50), child: Image.file(_image));
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
    UserDataApi.getData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserFromDatabase>(
      future: UserDataApi.getData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                InkWell(
                  onTap: () => imageFromGallery(),
                  child: Container(
                    width: 75,
                    height: 75,
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: loadImage(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            '${snapshot.data.name} ${snapshot.data.surname}',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Text('${snapshot.data.email}'),
                      ]),
                ),
              ],
            ),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
