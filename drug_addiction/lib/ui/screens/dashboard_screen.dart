import 'package:drug_addiction/constants.dart';
import 'package:drug_addiction/core/constants/colors.dart';
import 'package:drug_addiction/core/constants/text_styles.dart';
import 'package:drug_addiction/core/view_models/pick_images_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PickImagesViewModel>(
      builder: (context, model, child) {
        return Scaffold(
            backgroundColor: backGroundColor,
            body: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Image.asset(
                        logo,
                        color: whiteColor,
                      )),
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            pickImage(
                                icon: Icons.camera,
                                title: 'Camera',
                                onPressed: () async {
                                  model.pickCameraImage(context);
                                }),
                            SizedBox(
                              width: 20,
                            ),
                            pickImage(
                                icon: Icons.photo_library,
                                title: 'Gallery',
                                onPressed: () {
                                  model.pickGalleryImage(context);
                                })
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            pickImage(
                                icon: Icons.bar_chart_outlined,
                                title: 'Result',
                                onPressed: () => Navigator.pushNamed(
                                    context, 'resuldScreen')),
                            SizedBox(
                              width: 20,
                            ),
                            pickImage(
                                icon: Icons.photo_outlined,
                                title: 'Record',
                                onPressed: () {
                                  Navigator.pushNamed(context, 'record');
                                })
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(
                        bottom: 4, // Space between underline and text
                      ),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                        color: whiteColor,
                        width: 2.0, // Underline thickness
                      ))),
                      child: Text('About App',
                          style: halfBoldTextStyle.copyWith(
                              fontSize: 20, color: Colors.blue[200]))),
                ],
              ),
            ));
      },
    );
  }

  Widget pickImage({icon, title, onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 110,
        width: 120,
        decoration: BoxDecoration(
            color: activeColor, borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: whiteColor,
              size: 42,
            ),
            SizedBox(
              height: 5,
            ),
            Text(title, style: halfBoldTextStyle.copyWith(color: whiteColor)),
          ],
        ),
      ),
    );
  }
}
// Navigator.of(context).push(MaterialPageRoute(builder: (_) =>
//                                   ResultScreen(result: model.pickImageModel.result,)))
