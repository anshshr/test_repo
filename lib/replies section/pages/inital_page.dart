import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wagwan_work_testing/replies%20section/pages/image_size.dart';
import 'package:wagwan_work_testing/themes/app_theme.dart';


class InitalPage extends StatefulWidget {
  final PageController pageController;
  const InitalPage({super.key, required this.pageController});

  @override
  State<InitalPage> createState() => _InitalPageState();
}

class _InitalPageState extends State<InitalPage> {
  bool isPortrait = false;
  @override
  void initState() {
    super.initState();
    get_image_dimensions();
  }

  Future get_image_dimensions() async {
    bool diemnsion = await isImagePortrait(
      'https://i.pinimg.com/564x/8d/1a/22/8d1a22610e7682dc279cfb0f995b6f24.jpg',
    );
    if (diemnsion == true) {
      setState(() {
        isPortrait = false;
      });
    } else {
      setState(() {
        isPortrait = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Shadow shadow = Shadow(
      blurRadius: 70.0,
      color: Theme.of(context).appColors.onTertiary,
      offset: Offset(20.0, 20.0),
    );

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Container(
              constraints: BoxConstraints(
                minHeight: 200.0,
                maxHeight: 650.0,
                minWidth: double.infinity,
              ),
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: Image.network(
                      // 'https://w0.peakpx.com/wallpaper/382/238/HD-wallpaper-random-abstract-shape-cube-triangle-creative-pattern.jpg',
                      // 'https://i.pinimg.com/564x/8d/1a/22/8d1a22610e7682dc279cfb0f995b6f24.jpg',
                      // 'https://thumbs.dreamstime.com/b/baby-costume-lay-pillow-baby-costume-lay-pillow-studio-background-121816524.jpg',
                      // 'https://img.freepik.com/free-photo/calm-adorable-baby-lying-mattress_74855-3993.jpg',
                      'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/3f01db52-f675-48dc-9c91-f245d99f1486/d2nqynw-af694fd2-e1ba-4e9c-badb-630a48474599.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzNmMDFkYjUyLWY2NzUtNDhkYy05YzkxLWYyNDVkOTlmMTQ4NlwvZDJucXludy1hZjY5NGZkMi1lMWJhLTRlOWMtYmFkYi02MzBhNDg0NzQ1OTkuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.59_LN0TnrsDrVLS266jLpfZZfte_OZeNGkNQFJzgQCM',
                      height: 650,
                      width: double.infinity,
                      fit: isPortrait ? BoxFit.contain : BoxFit.cover,
                    ),
                  ),

                  //photo poster details

                  Positioned(
                    left: 10,
                    top: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // Profile photo of post owner
                        CircleAvatar(
                          radius: 25,
                          backgroundImage: NetworkImage(
                              'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/3f01db52-f675-48dc-9c91-f245d99f1486/d2nqynw-af694fd2-e1ba-4e9c-badb-630a48474599.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzNmMDFkYjUyLWY2NzUtNDhkYy05YzkxLWYyNDVkOTlmMTQ4NlwvZDJucXludy1hZjY5NGZkMi1lMWJhLTRlOWMtYmFkYi02MzBhNDg0NzQ1OTkuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.59_LN0TnrsDrVLS266jLpfZZfte_OZeNGkNQFJzgQCM'),
                        ),
                        // Name and time of post
                        Padding(
                          padding: const EdgeInsets.only(left: 5, top: 5),
                          child: ClipRRect(
                            child: BackdropFilter(
                              filter:
                                  ImageFilter.blur(sigmaX: 0.1, sigmaY: 0.1),
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Madhvik Nemani',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                        color: Theme.of(context)
                                            .appColors
                                            .onSecondary,
                                        shadows: [shadow],
                                      ),
                                    ),
                                    // Time of post
                                    Padding(
                                      padding: const EdgeInsets.only(top: 3),
                                      child: Text(
                                        '20 days ago',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge
                                            ?.copyWith(
                                          color: Theme.of(context)
                                              .appColors
                                              .onSecondary,
                                          shadows: [shadow],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //bottom text of like and text
                  Positioned(
                    left: 12,
                    bottom: 20,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 0.1, sigmaY: 0.1),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Siu baby is so cute',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                  color:
                                      Theme.of(context).appColors.onSecondary,
                                  shadows: [shadow],
                                )),
                            SizedBox(
                              height: 7,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Liked By:  ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .appColors
                                              .onSecondary,
                                          shadows: [shadow]),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 2),
                                  child: Icon(
                                    Icons.favorite,
                                    size: 10,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    right: 5,
                                  ),
                                  child: Text(
                                    'Madhvik Nemani',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall!
                                        .copyWith(
                                            color: Theme.of(context)
                                                .appColors
                                                .onPrimary,
                                            shadows: [shadow]),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              //icon for notifiaction and text
            ),
          ),
          //notification icon
          Positioned(
              right: 0,
              bottom: 100,
              child: InkWell(
                onTap: () {
                  if (widget.pageController.hasClients) {
                    widget.pageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                child: Container(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                      color: Theme.of(context).appColors.primary,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(23),
                          bottomLeft: Radius.circular(23))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '2',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.comment,
                            size: 20,
                            color: Theme.of(context).appColors.onPrimary,
                          )),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
