// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:wagwan_work_testing/replies%20section/widgets/reply_block.dart';
import 'package:wagwan_work_testing/replies%20section/widgets/user_details.dart';
import 'package:wagwan_work_testing/themes/app_theme.dart';

class R2 extends StatelessWidget {
  R2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          // Post of user
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Theme.of(context).appColors.secondary,
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10)
                      .copyWith(top: 10),
                  child: UserDetails(
                      image_url:
                          'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/3f01db52-f675-48dc-9c91-f245d99f1486/d2nqynw-af694fd2-e1ba-4e9c-badb-630a48474599.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzNmMDFkYjUyLWY2NzUtNDhkYy05YzkxLWYyNDVkOTlmMTQ4NlwvZDJucXludy1hZjY5NGZkMi1lMWJhLTRlOWMtYmFkYi02MzBhNDg0NzQ1OTkuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.59_LN0TnrsDrVLS266jLpfZZfte_OZeNGkNQFJzgQCM',
                      name: 'Ansh Shrivastav',
                      time_posed: '12 days ago'),
                ),
    
                // Image of the post
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        'https://w0.peakpx.com/wallpaper/382/238/HD-wallpaper-random-abstract-shape-cube-triangle-creative-pattern.jpg',
                        height: 220,
                        width: 160,
                        fit: BoxFit.cover,
                        alignment: Alignment.centerLeft,
                      ),
                    ),
                  ),
                ),
    
                // Liked by text
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15)
                      .copyWith(top: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Text(
                          'Liked By:  ',
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(
                                  color:
                                      Theme.of(context).appColors.onPrimary),
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
                          padding: const EdgeInsets.only(right: 5),
                          child: Text(
                            'Madhvik Nemani',
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(
                                    color: Theme.of(context)
                                        .appColors
                                        .onPrimary),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                // Icons
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15, bottom: 10, top: 10),
                  child: Row(
                    children: <Widget>[
                      InkWell(
                          child: Icon(
                            Icons.favorite_outline,
                            color: Theme.of(context).appColors.accent1,
                          ),
                          onTap: () {}),
                      SizedBox(width: 13),
                      InkWell(
                        child: Icon(
                          Icons.arrow_outward_outlined,
                          color: Theme.of(context).appColors.accent1,
                        ),
                        onTap: () {},
                      ),
                      SizedBox(width: 13),
                      InkWell(
                        child: Icon(
                          Icons.file_download_outlined,
                          color: Theme.of(context).appColors.accent1,
                        ),
                        onTap: () {},
                      ),
                      SizedBox(width: 13),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Replies of all the to the post
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return ReplyBlock();
            },
          ),
        ],
      ),
    );
  }
}
