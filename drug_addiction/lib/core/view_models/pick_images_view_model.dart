import 'dart:io';

import 'package:drug_addiction/core/constants/colors.dart';
import 'package:drug_addiction/core/constants/text_styles.dart';
import 'package:drug_addiction/core/enums/view_state.dart';
import 'package:drug_addiction/core/view_models/base_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../main.dart';
import 'package:http/http.dart' as http;
import 'package:convert/convert.dart';

class PickImagesViewModel extends BaseViewModel {
  final pickImageModel = ImagePicker();
  List<File> pickImageList = [];
  bool isImageTaken = false;
  File? image;
  String Kharkoos = '';
  bool isPr = false;
  PickImagesViewModel();

  void pickGalleryImage(context) async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      showAlertDialog(
        context: context,
        image: Image.file(File(pickedImage.path)),
        onPressed: () async {
          Navigator.pop(context);
          prgressDialogue(
              context: context,
              image: CircularProgressIndicator(
                strokeWidth: 7,
              ),
              onPressed: () {});
          final url = Uri.parse('$URL/upload_image');
          String filename = pickedImage.path.split('/').last;
          Kharkoos = filename;
          var request = http.MultipartRequest(
            'POST',
            url,
          );
          Map<String, String> headers = {"Content-type": "multipart/form-data"};
          request.files.add(
            http.MultipartFile(
              'image',
              File(pickedImage.path).readAsBytes().asStream(),
              File(pickedImage.path).lengthSync(),
              filename: filename,
            ),
          );
          request.headers.addAll(headers);
          var res = await request.send();
          var response = await http.Response.fromStream(res);
          final data = response.bodyBytes;
          final Directory systemTempDir = Directory.systemTemp;
          var tempFile = File('${systemTempDir.path}/$filename');
          if (tempFile.existsSync()) {
            await tempFile.delete();
          }
          tempFile.writeAsBytesSync(data);
          image = tempFile;
          addRecord();
          Navigator.pop(context);
          pickImageList.add(image!);
        },
      );
      notifyListeners();
    } else {
      print('Exception image Picker');
    }
  }

  void pickCameraImage(context) async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      //pickImageModel.image = File(pickedImage.path);
      //pickImageModel.path = pickedImage.path;

      showAlertDialog(
        context: context,
        image: Image.file(File(pickedImage.path)),
        onPressed: () async {
          Navigator.pop(context);
          prgressDialogue(
              context: context,
              image: CircularProgressIndicator(
                strokeWidth: 7,
              ),
              onPressed: () {});
          final url = Uri.parse('$URL/upload_image');
          String filename = pickedImage.path.split('/').last;
          Kharkoos = filename;

          var request = http.MultipartRequest(
            'POST',
            url,
          );
          Map<String, String> headers = {"Content-type": "multipart/form-data"};
          request.files.add(
            http.MultipartFile(
              'image',
              File(pickedImage.path).readAsBytes().asStream(),
              File(pickedImage.path).lengthSync(),
              filename: filename,
            ),
          );
          request.headers.addAll(headers);
          var res = await request.send();
          var response = await http.Response.fromStream(res);
          final data = response.bodyBytes;
          final Directory systemTempDir = Directory.systemTemp;
          var tempFile = File('${systemTempDir.path}/$filename');
          if (tempFile.existsSync()) {
            await tempFile.delete();
          }
          tempFile.writeAsBytesSync(data);
          image = tempFile;

          // final u = Uri.parse('http://192.168.100.214:3000/get_image');
          // await http.get(u).then((response) async {
          //   if (response.statusCode == 200) {
          //     final data = response.bodyBytes;
          //     image!.writeAsBytesSync(data);
          //     print(data);
          //   } else {
          //     print('Error' + response.body.toString());
          //   }
          // });
          addRecord();
          Navigator.pop(context);
          pickImageList.add(image!);
        },
      );
      notifyListeners();
    } else {
      print('Exception image Picker');
    }
  }

  void addRecord() async {
    setState(ViewState.busy);
    setState(ViewState.idle);
  }

  void showAlertDialog({context, image, onPressed}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          content: image,
          actions: [
            // ignore: deprecated_member_use
            TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  'Cancel',
                  style: halfBoldTextStyle.copyWith(color: whiteColor),
                )),
            // ignore: deprecated_member_use
            TextButton(
                onPressed: onPressed,
                child: Text(
                  'Process',
                  style: halfBoldTextStyle.copyWith(color: whiteColor),
                ))
          ],
        );
      },
    );
  }

  void prgressDialogue({context, image, onPressed}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          content: Container(
            padding: const EdgeInsets.all(40),
            decoration: const BoxDecoration(shape: BoxShape.circle),
            height: 180,
            width: 180,
            child: image,
          ),
        );
      },
    );
  }
}
