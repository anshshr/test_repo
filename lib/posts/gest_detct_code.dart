import 'dart:io';
import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wagwan_work_testing/themes/app_theme.dart';
import 'package:wagwan_work_testing/themes/custom_buttons/upload_button.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PostNew(),
  ));
}

class PostNew extends StatefulWidget {
  const PostNew({super.key});

  @override
  State<PostNew> createState() => _PostNewState();
}

class _PostNewState extends State<PostNew> {
  CameraController? controller;
  List<CameraDescription>? cameras;
  int selectedCameraIndex = 1;
  FlashMode flashMode = FlashMode.off;
  File? file;

  Future<void> GetCamera() async {
    try {
      cameras = await availableCameras();

      controller = CameraController(
        cameras![selectedCameraIndex],
        ResolutionPreset.high,
      );

      await controller!.initialize();
      setState(() {});
    } catch (e) {
      print(e.toString());
    }
  }

  void SwitchCamera() async {
    selectedCameraIndex = selectedCameraIndex == 0 ? 1 : 0;
    await controller?.dispose();
    controller = CameraController(
      cameras![selectedCameraIndex],
      ResolutionPreset.high,
    );
    await controller!.initialize();
    setState(() {});
  }

  void ToggleFlash() {
    flashMode = flashMode == FlashMode.off ? FlashMode.torch : FlashMode.off;
    controller!.setFlashMode(flashMode);
    setState(() {});
  }

  Future<void> OpenGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile == null) return;

    file = File(pickedFile.path);

    setState(() {});
  }

  Future CaptureImage() async {
    final PickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (PickedFile == null) return;
    file = File(PickedFile.path);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    GetCamera();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 44),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20)
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(children: [
              FutureBuilder(
                future: controller?.initialize(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Positioned.fill(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: CameraPreview(controller!)));
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
              Positioned(
                bottom: 90,
                left: 80,
                child: Row(
                  children: [
                    //flash button
                    Container(
                      height: 70,
                      child: IconButton(
                        onPressed: ToggleFlash,
                        icon: Icon(
                          flashMode == FlashMode.off
                              ? Icons.flash_off
                              : Icons.flash_on,
                          size: 30,
                          color: Theme.of(context).appColors.onPrimary,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    //camera button
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(35),
                          ),
                          border: Border.all(
                            width: 10,
                            color: Theme.of(context).appColors.onPrimary.withOpacity(.5),
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).appColors.onPrimary,
                            borderRadius: BorderRadius.all(
                              Radius.circular(25),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: GestureDetector(
                  onVerticalDragEnd: (details) {
                    if (details.primaryVelocity! < 0) {
                      OpenGallery();
                    }
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        height: 80,
                        width: double.infinity,
                        color: Theme.of(context).appColors.primary
                            .withOpacity(0.3), // Optional: to enhance blur effect
                        child: Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            // Gallery
                            InkWell(
                              onTap: () async {
                                await OpenGallery();
                              },
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Theme.of(context).appColors.onPrimary,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                  child: Image.network(
                                    'https://live.staticflickr.com/65535/50344935577_1aa9d7bb4c_o.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            // list of other functions
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              height: 69,
                              width: MediaQuery.of(context).size.width * 0.63,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(35)),
                              ),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 20,
                                    ),
                                    UploadButton(
                                      onPressed: () {},
                                      text: '',
                                      iconData: Icons.chat,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    UploadButton(
                                      onPressed: () {},
                                      text: '',
                                      iconData: Icons.web_asset_outlined,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    UploadButton(
                                      onPressed: () {},
                                      text: '',
                                      iconData: Icons.picture_as_pdf,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    UploadButton(
                                      onPressed: () {},
                                      text: '',
                                      iconData: Icons.audiotrack,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //change camera
                            Container(
                              height: 70,
                              child: IconButton(
                                onPressed: SwitchCamera,
                                icon: Icon(
                                  Icons.cached,
                                  size: 30,
                                  color: Theme.of(context).appColors.onPrimary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ])));
  }
}
