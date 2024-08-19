import 'dart:io';
import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wagwan_work_testing/posts/widgets/camera_button.dart';
import 'package:wagwan_work_testing/posts/widgets/open_gallery.dart';
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

  // void SwitchCamera() async {
  //   selectedCameraIndex = selectedCameraIndex == 0 ? 1 : 0;
  //   await controller?.dispose();
  //   controller = CameraController(
  //     cameras![selectedCameraIndex],
  //     ResolutionPreset.high,
  //   );
  //   await controller!.initialize();
  //   setState(() {});
  // }

  // void ToggleFlash() async {
  //   try {
  //     if (flashMode == FlashMode.off) {
  //       flashMode = FlashMode.torch;
  //     } else {
  //       flashMode = FlashMode.off;
  //     }
  //     await controller!.setFlashMode(flashMode);
  //     setState(() {});
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // Future<void> OpenGallery() async {
  //   final pickedFile =
  //       await ImagePicker().pickImage(source: ImageSource.gallery);

  //   if (pickedFile == null) return;

  //   file = File(pickedFile.path);

  //   setState(() {});
  // }

  // Future CaptureImage() async {
  //   if (controller != null && controller!.value.isInitialized) {
  //     try {
  //       XFile image = await controller!.takePicture();
  //       print('Picture taken: ${image.path}');
  //       file = File(image.path); // Save the captured image to the file variable
  //       setState(() {});
  //     } catch (e) {
  //       print(e);
  //     }
  //   }
  // }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    GetCamera();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  final PostBloc postBloc = PostBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostBloc, PostState>(
      bloc: postBloc,
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
            padding: EdgeInsets.only(top: 44),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
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
                  //change camera icon
                  Positioned(
                    top: 0,
                    right: 10,
                    child: Container(
                      height: 70,
                      child: IconButton(
                        onPressed: () {
                          postBloc.add(SwitchCamera());
                        },
                        icon: Icon(
                          Icons.cached,
                          size: 30,
                          color: Theme.of(context).appColors.onPrimary,
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 100,
                    left: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //open gallery
                        InkWell(
                            onTap: () {
                              postBloc.add(OpenGallery());
                            },
                            child: GalleryView()),
                        SizedBox(
                          width: 23,
                        ),
                        //flash button
                        Container(
                          height: 70,
                          child: IconButton(
                            onPressed: () {
                              postBloc.add(ToggleFlash());
                            },
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
                          height: 20,
                        ),

                        // camera button
                        InkWell(
                            onTap: () {
                              postBloc.add(CaptureImage());
                            },
                            child: CameraButton()),
                      ],
                    ),
                  ),
                  // Bottom sheet to drag up
                  DraggableScrollableSheet(
                    initialChildSize: 0.12,
                    minChildSize: 0.12,
                    maxChildSize: 1,
                    builder: (context, scrollController) {
                      return ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                            height: 50,
                            color: Theme.of(context)
                                .appColors
                                .primary
                                .withOpacity(0.3),
                            child: SingleChildScrollView(
                              controller: scrollController,
                              child: Column(
                                children: [
                                  // top bar
                                  Padding(
                                    padding: const EdgeInsets.only(top: 14),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
                                          // list of other functions
                                          SizedBox(width: 10),
                                          UploadButton(
                                            onPressed: () {},
                                            text: 'Ask AI',
                                            iconData: Icons.bubble_chart,
                                          ),
                                          SizedBox(width: 20),
                                          UploadButton(
                                            onPressed: () {},
                                            text: 'Website',
                                            iconData: Icons.web_asset_outlined,
                                          ),
                                          SizedBox(width: 20),
                                          UploadButton(
                                            onPressed: () {},
                                            text: 'PDF',
                                            iconData: Icons.picture_as_pdf,
                                          ),
                                          SizedBox(width: 20),
                                          UploadButton(
                                            onPressed: () {},
                                            text: 'Audio',
                                            iconData: Icons.audiotrack,
                                          ),
                                          SizedBox(width: 20),
                                        ],
                                      ),
                                    ),
                                  ),

                                  // Gallery grid
                                  GridView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      crossAxisSpacing: 2,
                                      mainAxisSpacing: 2,
                                    ),
                                    itemCount: 30,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        color:
                                            Theme.of(context).appColors.accent1,
                                        child:
                                            Center(child: Text('Item $index')),
                                      );
                                    },
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ])));
      },
    );
  }
}
