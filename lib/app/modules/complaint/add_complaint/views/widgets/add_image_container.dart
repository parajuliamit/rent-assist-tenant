import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

import '../../../../../utils/constants.dart';

class InsertImageContainer extends StatefulWidget {
  const InsertImageContainer({
    Key? key,
  }) : super(key: key);

  @override
  State<InsertImageContainer> createState() => _InsertImageContainerState();
}

class _InsertImageContainerState extends State<InsertImageContainer> {
  File? _image;

  Future getImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      // final imageTemporary = File(image.path);
      final imagePermanent = await savefilePermamently(image.path);

      setState(() {
        this._image = imagePermanent;
      });
    } on PlatformException catch (e) {
      print('failed to pick image $e');
    }
  }

  Future<File> savefilePermamently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');

    return File(imagePath).copy(image.path);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Insert Image',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        const SizedBox(
          height: 10,
        ),
        GestureDetector(
          child: Container(
            height: 50,
            width: 50,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: kGreyColor.withOpacity(0.5),
            ),
            child: Icon(Icons.add),
          ),
          onTap: () {
            getImage(ImageSource.camera);
          },
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          // height: 200,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: kGreyColor.withOpacity(0.5),
          ),
          child: Column(
            children: [
              _image != null
                  ? Image.file(
                      _image!,
                      height: 250,
                      width: 250,
                      fit: BoxFit.cover,
                    )
                  : const Text('Insert a image'),
            ],
          ),
        ),
        // _image != null
        // ? Image.file(
        //     _image!,
        //     height: 250,
        //     width: 250,
        //     fit: BoxFit.cover,
        //   )
        // : const Text('Insert a image'),
      ],
    );
  }
}
