import 'package:flutter/material.dart';
import 'package:wagwan_work_testing/pages/home_circle_ui.dart';
import 'package:wagwan_work_testing/themes/app_theme.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Circles(),
    darkTheme: AppTheme.dark,
    theme: AppTheme.light,
    themeMode: ThemeMode.dark,
  ));
}

class Circles extends StatelessWidget {
  const Circles({super.key});
  @override
  Widget build(BuildContext context) {
    String coverPhotoURL =
        "https://i.pinimg.com/236x/eb/09/69/eb096917cedb8fd3b3363d3dec531baa.jpg";
    return Scaffold(
      backgroundColor: Theme.of(context).appColors.surface,
      body: Container(
        color: Theme.of(context).appColors.surface,
        padding: const EdgeInsets.only(top: 20),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            GridView.builder(
              itemCount: 30,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.9),
              itemBuilder: (context, index) {
                return HomeCircleUi(
                  ispublic: false,
                  name: 'Funny Memes of the year',
                  imageURL:
                      'https://i.pinimg.com/236x/eb/09/69/eb096917cedb8fd3b3363d3dec531baa.jpg',
                  onPressed: () {},
                );
              },
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.7,
              left: 200,
              right: 0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).appColors.onSurface,
                  side: const BorderSide(color: Colors.transparent),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(23),
                        bottomLeft: Radius.circular(23)),
                  ),
                  padding: EdgeInsets.zero,
                ),
                onPressed: () {
                  // CreateCircleRouteData().go(context);
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        color: Theme.of(context).appColors.onSurface,
                        child: CircleAvatar(
                          radius: 20,
                          backgroundImage: (coverPhotoURL.isNotEmpty)
                              ? NetworkImage(coverPhotoURL)
                              : const NetworkImage(
                                  'https://i.pinimg.com/236x/eb/09/69/eb096917cedb8fd3b3363d3dec531baa.jpg',
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                      height: 0,
                    ),
                    Expanded(
                      child: Text(
                        'Create a Circle',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: context.theme.appColors.accent1,
                                ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              // left: 350,
              // right: 0,
              top: 625,
              left: 293,
              // top: MediaQuery.of(context).size.height * 0.6,
              child: InkWell(
                onTap: () {
                  // Add action for the notification icon
                },
                child: Stack(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          color: Theme.of(context).appColors.onSurface,
                          border: Border.all(
                            color: Theme.of(context).appColors.secondary,
                          ),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(25),
                              bottomLeft: Radius.circular(25))),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.notifications,
                          color: Theme.of(context).appColors.accent1,
                          size: 36,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 27,
                      right: 0,
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            color: Theme.of(context).appColors.tertiary,
                            shape: BoxShape.circle,
                            border: Border.all(
                                width: 2,
                                color: Theme.of(context).appColors.primary)),
                        child: Center(
                          child: Text(
                            '27',
                            style: TextStyle(
                                    color:
                                        Theme.of(context).appColors.onPrimary)
                                .copyWith(
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .labelSmall!
                                        .fontSize),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
