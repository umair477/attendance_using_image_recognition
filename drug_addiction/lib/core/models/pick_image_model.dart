
import 'package:image_picker/image_picker.dart';

class PickImageModel {
  String id;
  XFile image;
  String path;
  var confidence;
  var confidenceString;
  var confidenceValue;
  String result;
  var norcoticsResult;

  PickImageModel(
      {required this.id,
      required this.image,
      required this.path,
      required this.result,
      required this.confidence,
      required this.confidenceString,
      required this.confidenceValue,
      required this.norcoticsResult});

  fromJson(Map<String, dynamic> json, id) {
    this.id = id;
    image = json['image'];
    path = json['path'];
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['path'] = this.path;
    data['result'] = this.result;
    return data;
  }
}
