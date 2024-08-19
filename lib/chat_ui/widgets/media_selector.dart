import 'package:flutter/material.dart';
import 'package:wagwan_work_testing/themes/app_theme.dart';

Future mediaSelector(BuildContext context) async {
    await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Container(
          height: 320,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Choose Source',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Theme.of(context)
                          .appColors
                          .onPrimary
                          .withOpacity(.5))),
              Divider(
                thickness: .1,
                color: Theme.of(context).appColors.onPrimary.withOpacity(.5),
              ),
              InkWell(
                onTap: () {
                  //open gallery for photo
                },
                child: Text('Gallery(Photo)',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Theme.of(context).appColors.onPrimary)),
              ),
              Divider(
                thickness: .1,
                color: Theme.of(context).appColors.onPrimary.withOpacity(.5),
              ),
              InkWell(
                  onTap: () {
                    ///open gallery for video
                  },
                  child: Text('Gallery(Video)',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              color: Theme.of(context).appColors.onPrimary))),
              Divider(
                thickness: .1,
                color: Theme.of(context).appColors.onPrimary.withOpacity(.5),
              ),
              InkWell(
                  onTap: () {
                    //open camera
                  },
                  child: Text('Camera',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              color: Theme.of(context).appColors.onPrimary))),
              Divider(
                thickness: .1,
                color: Theme.of(context).appColors.onPrimary.withOpacity(.5),
              ),
            ],
          ),
        );
      },
    );
  }