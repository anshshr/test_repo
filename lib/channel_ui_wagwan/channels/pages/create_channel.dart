import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wagwan/core/themes/app_theme.dart';
import 'package:wagwan/core/themes/custom_buttons/large_sized_button.dart';
import 'package:wagwan/modules/channels/blocs/channel_type/channel_type_bloc.dart';
import 'package:wagwan/modules/channels/blocs/channel_type/channel_type_event.dart';
import 'package:wagwan/modules/channels/blocs/channel_type/channel_type_state.dart';
import 'package:wagwan/modules/channels/widgets/buttons/channel_buttons.dart';
import 'package:wagwan/modules/channels/widgets/pick_channel_color.dart';

class CreateChannel extends StatelessWidget {
  CreateChannel({super.key});
  final TextEditingController groupNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passcodeController = TextEditingController();
  final TextEditingController groupIntroduction = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool obscurePassword = true;
    Widget squareDots() {
      return Padding(
        padding: const EdgeInsets.only(right: 3.0, top: 10),
        child: Container(
          height: 3,
          width: 3,
          decoration: BoxDecoration(
            color: Theme.of(context).appColors.tertiary,
            shape: BoxShape.rectangle,
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).appColors.surface,
        border: Border.all(color: Theme.of(context).appColors.secondary),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      height: MediaQuery.of(context).size.height * 0.89,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              squareDots(),
              squareDots(),
              squareDots(),
              squareDots(),
              squareDots(),
              squareDots(),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          //title
          Text('Create Group',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).appColors.onPrimary)),

          Text(
            'Build community groups under the micronet for your members to engage better',
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: Theme.of(context).appColors.accent1),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            maxLines: 6,
          ),
          const SizedBox(
            height: 20,
          ),

          //all the textfields and extra information for channel creation
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BlocBuilder<ChannelTypeBloc, ChannelTypeState>(
                builder: (context, state) {
                  return LargeSizedButton(
                    textcolor:
                        state is ChannelTypeInitial && state.publicChannel
                            ? Theme.of(context).appColors.primary
                            : null,
                    backgroundcolor:
                        state is ChannelTypeInitial && state.publicChannel
                            ? Theme.of(context).appColors.onPrimary
                            : null,
                    onPressed: () {
                      context.read<ChannelTypeBloc>().add(PublicChannel());
                    },
                    text: 'Public',
                  );
                },
              ),
              const SizedBox(
                width: 60,
              ),
              BlocBuilder<ChannelTypeBloc, ChannelTypeState>(
                builder: (context, state) {
                  return LargeSizedButton(
                    textcolor:
                        state is ChannelTypeInitial && state.priavteChannel
                            ? Theme.of(context).appColors.primary
                            : null,
                    backgroundcolor:
                        state is ChannelTypeInitial && state.priavteChannel
                            ? Theme.of(context).appColors.onPrimary
                            : null,
                    onPressed: () {
                      context.read<ChannelTypeBloc>().add(PrivateChannel());
                    },
                    text: 'Private',
                  );
                },
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Group Name',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Theme.of(context).appColors.onPrimary),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                style: TextStyle(
                  color: Theme.of(context).appColors.onPrimary,
                ),
                textAlign: TextAlign.start,
                decoration: const InputDecoration(hintText: 'Group Name'),
                controller: groupNameController,
                obscureText: false,
                keyboardType: TextInputType.multiline,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Email',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Theme.of(context).appColors.onPrimary),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                style: TextStyle(
                  color: Theme.of(context).appColors.onPrimary,
                ),
                textAlign: TextAlign.start,
                decoration: const InputDecoration(hintText: 'Email'),
                controller: emailController,
                obscureText: false,
                keyboardType: TextInputType.multiline,
              ),
              BlocBuilder<ChannelTypeBloc, ChannelTypeState>(
                builder: (context, state) {
                  return state is ChannelTypeInitial && state.priavteChannel
                      ? const SizedBox(
                          height: 20,
                        )
                      : const SizedBox();
                },
              ),
              BlocBuilder<ChannelTypeBloc, ChannelTypeState>(
                builder: (context, state) {
                  return state is ChannelTypeInitial && state.priavteChannel
                      ? Text(
                          'Passcode',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  color: Theme.of(context).appColors.onPrimary),
                        )
                      : const SizedBox();
                },
              ),
              const SizedBox(
                height: 10,
              ),
              BlocBuilder<ChannelTypeBloc, ChannelTypeState>(
                builder: (context, state) {
                  return state is ChannelTypeInitial && state.priavteChannel
                      ? StatefulBuilder(
                          builder: (context, setState) {
                            return TextField(
                              style: TextStyle(
                                color: Theme.of(context).appColors.onPrimary,
                              ),
                              textAlign: TextAlign.start,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      obscurePassword = !obscurePassword;
                                    });
                                  },
                                  icon: Padding(
                                    padding: const EdgeInsets.only(right: 14.0),
                                    child: Icon(
                                      obscurePassword
                                          ? CupertinoIcons.eye_slash
                                          : CupertinoIcons.eye,
                                      color:
                                          Theme.of(context).colorScheme.error,
                                      size: 16,
                                    ),
                                  ),
                                ),
                                hintText: 'Enter the password',
                              ),
                              controller: passcodeController,
                              obscureText: obscurePassword,
                            );
                          },
                        )
                      : const SizedBox();
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Group Introduction',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Theme.of(context).appColors.onPrimary),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                style: TextStyle(
                  color: Theme.of(context).appColors.onPrimary,
                ),
                textAlign: TextAlign.start,
                decoration:
                    const InputDecoration(hintText: 'Group Introduction'),
                controller: passcodeController,
                obscureText: false,
                keyboardType: TextInputType.multiline,
              ),
              const SizedBox(
                height: 50,
              ),
              ChannelButtons(
                text: 'Upload Cover',
                onpressed: () {},
              ),
              const SizedBox(
                height: 30,
              ),
              ChannelButtons(
                  onpressed: () {
                    pickChannelColor(context);
                  },
                  text: 'Pick a Color'),
              const SizedBox(
                height: 40,
              ),
              Center(
                  child: LargeSizedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      text: 'Create'))
            ],
          ),
        ]),
      ),
    );
  }
}
