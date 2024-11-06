import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wagwan/core/themes/app_theme.dart';
import 'package:wagwan/modules/channels/blocs/channel_type/channel_type_bloc.dart';
import 'package:wagwan/modules/channels/pages/create_channel.dart';
import 'package:wagwan/modules/channels/widgets/buttons/create_channel_button.dart';
import 'package:wagwan/modules/channels/widgets/buttons/home_button.dart';
import 'package:wagwan/modules/channels/widgets/circle_decsription.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ChannelTypeBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        darkTheme: AppTheme.dark,
        theme: AppTheme.light,
        themeMode: ThemeMode.dark,
        home: const ChannelHomePage(),
      ),
    ),
  );
}

class ChannelHomePage extends StatelessWidget {
  const ChannelHomePage({super.key});

  Future showcreateChannel(BuildContext context) async {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return CreateChannel();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).appColors.surface,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // channel  introduction
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Theme.of(context).appColors.surface,
                  border:
                      Border.all(color: Theme.of(context).appColors.secondary),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Channel',
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(
                                color: Theme.of(context).appColors.onPrimary)),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Divider(
                        color: Theme.of(context).appColors.onPrimary,
                        height: 1,
                      ),
                    ),
                    //channel details
                    const CircleDecsription(
                      imageURL:
                          'https://yt3.googleusercontent.com/T8-hkTayp0l95yMAH-kSazaAe9BsbRR9ClojRDQ9YOqVPBpLBGa8Cj9Jk2TFIG4xCMz82IzBDfo=s900-c-k-c0x00ffffff-no-rj',
                      circleName: 'WTF Community',
                      descriptionText:
                          "Your Gateway to India's finest Enterpreneurial league",
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              // home and create  buttoon for circle
              Row(
                children: [
                  HomeButton(
                    onPressed: () {},
                    text: 'Home',
                    circleAvatar: const CircleAvatar(
                      radius: 23,
                      backgroundImage: AssetImage(
                          'assets/icons/Wagwan_buy_button_white.png'),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CreateChannelButton(
                    onPressed: () {
                      showcreateChannel(context);
                    },
                    text: 'Create',
                    icons: Icons.add,
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Divider(
                  color: Theme.of(context).appColors.onPrimary,
                  height: 1,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              //circle title
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                decoration: BoxDecoration(
                  color: Theme.of(context).appColors.primary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Circles',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Theme.of(context).appColors.onPrimary),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                  child: ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 9),
                    decoration: BoxDecoration(
                      color: Theme.of(context).appColors.surface,
                      border: Border.all(
                          color: Theme.of(context).appColors.secondary),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    child: const CircleDecsription(
                        imageURL:
                            'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSH661deKAR50-zNAZUz3KqyU-ODCib_9N9R6K3ehcjGqKKsWPD',
                        circleName: 'Founders Ideas',
                        descriptionText:
                            'Share your ideas and get  some feedback on it'),
                  );
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
