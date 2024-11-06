import 'package:flutter/material.dart';
import 'package:wagwan_work_testing/replies%20section/pages/bottom_textfield.dart';
import 'package:wagwan_work_testing/replies%20section/widgets/liked_by.dart';
import 'package:wagwan_work_testing/replies%20section/widgets/reply_block.dart';
import 'package:wagwan_work_testing/replies%20section/widgets/user_details.dart';
import 'package:wagwan_work_testing/themes/app_theme.dart';

class Replies extends StatelessWidget {
  final PageController pageController;

  Replies({
    Key? key,
    required this.pageController,
  }) : super(key: key);
  final TextEditingController replyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appColors.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).appColors.surface,
        centerTitle: true,
        title: Text(
          'Replies',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).appColors.onPrimary),
        ),
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Theme.of(context).appColors.secondary,
                borderRadius: BorderRadius.all(Radius.circular(20)),
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
                        child: LikedBy(
                          name:
                              'Madhvik Nemani ksndkandkanklasnclsnlsnvlsnlvnldsvndslvnlds',
                        )),
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
                            onTap: () {
                              //like
                            }),
                        const SizedBox(width: 13),
                        InkWell(
                          child: Icon(
                            Icons.arrow_outward_outlined,
                            color: Theme.of(context).appColors.accent1,
                          ),
                          onTap: () {
                            //share
                          },
                        ),
                        const SizedBox(width: 13),
                        InkWell(
                          child: Icon(
                            Icons.file_download_outlined,
                            color: Theme.of(context).appColors.accent1,
                          ),
                          onTap: () {
                            //download
                          },
                        ),
                        SizedBox(width: 13),
                      ],
                    ),
                  ),
                  // Replies of all the to the post
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return ReplyBlock(
                        commnet: 'oh fuck did you make this? crazy crazy',
                        name: 'Madhvik Nemani',
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          BottomTextfield(
            controller: replyController,
          ),
          Positioned(
              right: 0,
              bottom: 160,
              child: InkWell(
                onTap: () {
                  if (pageController.hasClients) {
                    pageController.previousPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                child: Container(
                  height: 55,
                  width: 60,
                  decoration: BoxDecoration(
                      color: Theme.of(context).appColors.primary,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(23),
                          bottomLeft: Radius.circular(23))),
                  child: Icon(
                    Icons.arrow_upward,
                    color: Theme.of(context).appColors.onPrimary,
                    size: 30,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
