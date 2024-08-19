import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:wagwan_work_testing/themes/app_theme.dart';
import 'package:wagwan_work_testing/themes/custom_buttons/upload_button.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PostNew1(),
  ));
}

class PostNew1 extends StatefulWidget {
  const PostNew1({super.key});

  @override
  State<PostNew1> createState() => _PostNew1State();
}

class _PostNew1State extends State<PostNew1> {
  CameraController? controller;
  List<CameraDescription>? cameras;
  int selectedCameraIndex = 1;
  FlashMode flashMode = FlashMode.off;

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

  void SwitchCamera() {
    selectedCameraIndex = selectedCameraIndex == 0 ? 1 : 0;
    GetCamera();
  }

  void ToggleFlash() {
    flashMode = flashMode == FlashMode.off ? FlashMode.torch : FlashMode.off;
    controller!.setFlashMode(flashMode);
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
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        padding: EdgeInsets.only(top: 42),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            //camera  screen
            Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.85,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Stack(
                  children: [
                    FutureBuilder(
                      future: controller?.initialize(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return Positioned.fill(
                              child:
                                  Container(child: CameraPreview(controller!)));
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                    //camera icon and flash toggle

                    Positioned(
                      bottom: 0,
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
                                  color: Colors.white.withOpacity(.5),
                                ),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(25),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
            SizedBox(
              height: 5,
            ),
            //bottom part
            Container(
              height: 63,
              width: double.infinity,
              color: Colors.green,
              child: Center(
                  child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  //gallery
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: ClipRRect(
                        child: Image.network(
                          'https://live.staticflickr.com/65535/50344935577_1aa9d7bb4c_o.jpg',
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                    ),
                  ),
                  //center scroll
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    height: 63,
                    width: MediaQuery.of(context).size.width * 0.60,
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
                ],
              )),
            )
          ],
        ),
      ),
    );
  }
}
