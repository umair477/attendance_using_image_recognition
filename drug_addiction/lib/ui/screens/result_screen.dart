import 'dart:convert';

import 'package:drug_addiction/core/constants/colors.dart';
import 'package:drug_addiction/core/constants/text_styles.dart';
import 'package:drug_addiction/core/view_models/pick_images_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';

class ResultScreen extends StatelessWidget {
  final String result;
  ResultScreen({required this.result});

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
                size: 25,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: model.image == null
              ? Center(
                  child: Text(
                    'No Results Yet!',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                )
              : Padding(
                  padding: EdgeInsets.all(15.0),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      model == null
                          ? Text('Image not taken yet')
                          : Padding(
                              padding: EdgeInsets.all(20.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.file(model.image!),
                              )),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        '\t\tPresent Students: ',
                        style: boldTextStyle.copyWith(color: whiteColor),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: FutureBuilder(
                            future: http.post(Uri.parse('$URL/output_list'),
                                headers: {"Content-Type": "application/json"},
                                body: jsonEncode(
                                    {'file_name': 'output_' + model.Kharkoos})),
                            builder: (context,
                                AsyncSnapshot<http.Response> snapshot) {
                              if (snapshot.hasData) {
                                final list =
                                    jsonDecode(snapshot.data!.body)['list'];
                                if (list.length < 1)
                                  return Center(
                                    child: Text(
                                      'No Faces Found',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white),
                                    ),
                                  );
                                return ListView.builder(
                                    itemCount: list.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          list[index],
                                          style: halfBoldTextStyle.copyWith(
                                              color: whiteColor, fontSize: 16),
                                        ),
                                      );
                                    });
                              } else if (snapshot.hasError) {
                                return Center(
                                  child: Text(snapshot.error.toString()),
                                );
                              } else {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                            }),
                      )
                    ],
                  ),
                ),
        );
      },
    );
  }
}
