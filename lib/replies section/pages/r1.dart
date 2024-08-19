import 'package:flutter/material.dart';
import 'package:wagwan_work_testing/themes/app_theme.dart';

class R1 extends StatelessWidget {
  // var pageController;

  // final PageController pageController;
  const R1({super.key});

  @override
  Widget build(BuildContext context) {
    final Shadow shadow = Shadow(
      blurRadius: 10.0,
      color: Theme.of(context).appColors.primary,
      offset: Offset(2.0, 2.0),
    );

    return Scaffold(
      body: Center(
        child: Container(
          constraints: BoxConstraints(
            minHeight: 200.0,
            maxHeight: 650.0,
            minWidth: double.infinity,
          ),
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: Image.network(
                  'https://i.pinimg.com/564x/8d/1a/22/8d1a22610e7682dc279cfb0f995b6f24.jpg',
                  // 'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/3f01db52-f675-48dc-9c91-f245d99f1486/d2nqynw-af694fd2-e1ba-4e9c-badb-630a48474599.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzNmMDFkYjUyLWY2NzUtNDhkYy05YzkxLWYyNDVkOTlmMTQ4NlwvZDJucXludy1hZjY5NGZkMi1lMWJhLTRlOWMtYmFkYi02MzBhNDg0NzQ1OTkuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.59_LN0TnrsDrVLS266jLpfZZfte_OZeNGkNQFJzgQCM',
                  height: 650,
                  width: double.infinity,
                  fit: BoxFit.cover,
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
                      //profile photo of post owner
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(
                            'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/3f01db52-f675-48dc-9c91-f245d99f1486/d2nqynw-af694fd2-e1ba-4e9c-badb-630a48474599.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzNmMDFkYjUyLWY2NzUtNDhkYy05YzkxLWYyNDVkOTlmMTQ4NlwvZDJucXludy1hZjY5NGZkMi1lMWJhLTRlOWMtYmFkYi02MzBhNDg0NzQ1OTkuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.59_LN0TnrsDrVLS266jLpfZZfte_OZeNGkNQFJzgQCM'),
                      ),
                      //name of post owner
                      Padding(
                        padding: const EdgeInsets.only(left: 5, top: 5),
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
                                color: Theme.of(context).appColors.onPrimary,
                                shadows: [shadow],
                              ),
                            ),
                            //time of post
                            Padding(
                              padding: const EdgeInsets.only(top: 3),
                              child: Text(
                                '20 days ago',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(
                                  color: Theme.of(context).appColors.onPrimary,
                                  shadows: [shadow],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
              //bottom text of like and commnet
              Positioned(
                left: 12,
                bottom: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Siu baby is so cute',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).appColors.onPrimary,
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
                                  color: Theme.of(context).appColors.onPrimary,
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
                                    color:
                                        Theme.of(context).appColors.onPrimary,
                                    shadows: [shadow]),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              //notification icon
              Positioned(
                  right: 0,
                  bottom: 18,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 56,
                      width: 64,
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
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                          InkWell(
                              onTap: () {
                                // if (pageController.hasClients) {
                                //   pageController.nextPage(
                                //     duration: Duration(milliseconds: 300),
                                //     curve: Curves.easeInOut,
                                //   );
                                // }
                              },
                              child: Icon(
                                Icons.comment,
                                size: 25,
                                color: Theme.of(context).appColors.onPrimary,
                              )),
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
