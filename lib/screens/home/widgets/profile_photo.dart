import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/colors/app_colors.dart';
import '../../../utils/images/app_images.dart';
import '../../../utils/size/app_size.dart';
import '../../../utils/styles/app_text_styles.dart';

class ProfilePhoto extends StatefulWidget {
  const ProfilePhoto({super.key});

  @override
  State<ProfilePhoto> createState() => _ProfilePhotoState();
}

class _ProfilePhotoState extends State<ProfilePhoto> {
  File? _image;

  final String defaultImage = AppImages.profile;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  Future<void> _loadImage() async {
    final prefs = await SharedPreferences.getInstance();
    final imagePath = prefs.getString('profileImagePath');
    if (imagePath != null) {
      setState(() {
        _image = File(imagePath);
      });
    }
  }

  Future<void> _saveImage(String path) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('profileImagePath', path);
  }


  Future getImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      _saveImage(pickedFile.path);
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: _image != null
              ? FileImage(_image!) as ImageProvider
              : AssetImage(defaultImage),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Material(
            color: AppColors.transparent,
            child: InkWell(
              splashColor: AppColors.black,
              borderRadius: BorderRadius.circular(50),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      backgroundColor: AppColors.c_0E0E0E,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: BorderSide(
                          color: AppColors.white.withOpacity(0.40),
                          width: 2
                        )
                      ),
                      child: SizedBox(
                        height: 100.w,
                        width: 100.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.camera_alt,
                                    color: AppColors.cBDBDBD,
                                  ),
                                  onPressed: () async {
                                    var permissionStatus =
                                        await Permission.camera.request();

                                    if (permissionStatus.isGranted) {
                                      getImage(ImageSource.camera);
                                    }

                                    if (context.mounted){
                                      Navigator.pop(context);
                                    }
                                  },
                                ),
                                Text(
                                  'Camera',
                                  style: AppTextStyles.poppinsRegular
                                      .copyWith(fontSize: 12),
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.photo,
                                    color: AppColors.cBDBDBD,
                                  ),
                                  onPressed: () async {
                                    var permissionStatus =
                                        await Permission.photos.request();

                                    if (permissionStatus.isGranted) {
                                      getImage(ImageSource.gallery);
                                    }

                                    if (context.mounted){
                                      Navigator.pop(context);
                                    }
                                  },
                                ),
                                Text(
                                  'Gallery',
                                  style: AppTextStyles.poppinsRegular
                                      .copyWith(fontSize: 12),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Ink(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                      color: AppColors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(50)),
                  child: const Icon(Icons.add_a_photo,
                      color: AppColors.white, size: 15)),
            ),
          ),
        )
      ],
    );
  }
}
