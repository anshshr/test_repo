// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class Posts extends StatefulWidget {
  const Posts({super.key});

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  CameraController? controller;

  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  Future<void> initializeCamera() async {
    WidgetsFlutterBinding.ensureInitialized();
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    controller = CameraController(
      firstCamera,
      ResolutionPreset.high,
    );

    await controller!.initialize();
    setState(() {});
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final PageController bottomPageController =
        PageController(viewportFraction: .2);
    return Stack(
      children: [
        //camera
        Positioned.fill(
          child: FutureBuilder(
            future: controller?.initialize(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Positioned.fill(child: CameraPreview(controller!));
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
        //scaffold and things upon it
        Positioned.fill(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: const Text('Posts'),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              centerTitle: false,
            ),

            //bottom container
            body: Container(
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Positioned(
                    bottom: 50,
                    right: 40,
                    left: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
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
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                        ),
                        Container(
                          height: 60,
                          child: Icon(
                            Icons.flash_on,
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                            ),
                          ),
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
                        ),
                        Container(
                          height: 70,
                          child: Icon(
                            Icons.cached,
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          height: 70,
                          child: Icon(
                            Icons.tag_faces,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 0,
                    left: 0,
                    bottom: 10,
                    height: 20,
                    child: PageView.builder(
                      controller: bottomPageController,
                      itemBuilder: (context, index) {
                        return Text(
                          "Item $index",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        );
                      },
                      itemCount: 20,
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    width: 10,
                    height: 10,
                    child: Icon(
                      Icons.arrow_drop_up,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
