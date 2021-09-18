import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfilePicture extends StatefulWidget {
  const ProfilePicture({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfilePicture> createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {
  String _image = 'assets/images/Profile Image.png';
  final picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 115,
        width: 115,
        child: Stack(
          fit: StackFit.expand,
          clipBehavior: Clip.none,
          children: <Widget>[
            CircleAvatar(
              maxRadius: 60,
              child: ClipOval(
                child: Image.asset(_image),
              ),
            ),
            Positioned(
              right: -16,
              bottom: 0,
              child: SizedBox(
                height: 46,
                width: 46,
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: const BorderSide(color: Colors.white),
                    ),
                    primary: Colors.white,
                    backgroundColor: const Color(0xFFF5F6F9),
                  ),
                  onPressed: () async {
                    final filePicker =
                        await picker.pickImage(source: ImageSource.gallery);
                    if (filePicker != null) {
                      setState(() {
                        _image = filePicker.path;
                      });
                    }
                  },
                  child: SvgPicture.asset('assets/icons/Camera Icon.svg'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
