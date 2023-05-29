import 'dart:io';

import 'package:drug_addiction/core/constants/colors.dart';
import 'package:drug_addiction/core/view_models/pick_images_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PickImagesViewModel>(
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: backGroundColor,
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: backGroundColor,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: whiteColor,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          body: model.pickImageList.isEmpty
              ? Center(
                  child: Text(
                    'No Records Yet!',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                )
              : ListView.builder(
                  reverse: true,
                  itemCount: model.pickImageList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 8),
                      height: 180,
                      decoration: BoxDecoration(
                          color: ThemeData.dark().cardColor,
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: FileImage(
                                  File(model.pickImageList[index].path)))),
                    );
                  },
                ),
        );
      },
    );
  }
}
