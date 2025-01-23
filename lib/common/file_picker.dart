
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/widgets/CustomTextStyle.dart';
import '../widgets/widgets/colors.dart';

Future<File?> openFilePicker(
    BuildContext context,{bool hideGalery = false}) async{
  return await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 300,
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                height: 5,
                width: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: ColorSelect.greyColor),
              ),
              SizedBox(
                height: 40,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment:hideGalery?MainAxisAlignment.center : MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () async{
                          var file= await getImageFromCamera();
                          Get.back(result: file);
                        },
                        child: Container(
                            height: 180,
                            width:  (Get.width /2)-20,
                            child: Card(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(top: 50),
                                        child: Icon(Icons.camera_alt,
                                            size: 20,
                                            color: ColorSelect.blackColor),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "Open Camera",
                                        style:
                                        CustomTextStyle.blackColorBold16,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )),
                      ),
                      if(!hideGalery)  GestureDetector(
                        onTap: () async{
                          var file = await getImageFromGallery();
                          Get.back(result: file);
                        },
                        child: Container(
                            height: 180,
                            width:  (Get.width /2)-20,

                            child: Card(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(top: 50),
                                        child: Icon(
                                            Icons.photo_library_outlined,
                                            size: 20,
                                            color: ColorSelect.blackColor),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "Open Gallery",
                                        style:
                                        CustomTextStyle.blackColorBold16,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      });
}

Future<File?> getImageFromGallery() async {
  ImagePicker _picker = ImagePicker();
  var pickedFile =
  await _picker.pickImage(source: ImageSource.gallery, imageQuality: 60);
  if (pickedFile != null) {
    return File(pickedFile.path!);
  } else {return null;
  }
}

Future<File?> getImageFromCamera() async {
  ImagePicker _picker = ImagePicker();
  var pickedFile =
  await _picker.pickImage(source: ImageSource.camera, imageQuality: 60);
  if (pickedFile != null) {
    print(pickedFile.path);
    return  File(pickedFile.path);
  } else {
    return null;
  }
}