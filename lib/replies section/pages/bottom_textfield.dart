// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wagwan_work_testing/replies%20section/bloc/textfield_toggle/textfield_toggle_bloc.dart';
import 'package:wagwan_work_testing/replies%20section/bloc/textfield_toggle/textfield_toggle_event.dart';
import 'package:wagwan_work_testing/replies%20section/bloc/textfield_toggle/textfield_toggle_state.dart';
import 'package:wagwan_work_testing/replies%20section/bloc/upload_visibility/upload_visibility_bloc.dart';
import 'package:wagwan_work_testing/replies%20section/bloc/upload_visibility/upload_visibility_event.dart';
import 'package:wagwan_work_testing/replies%20section/bloc/upload_visibility/upload_visibility_state.dart';
import 'package:wagwan_work_testing/replies%20section/widgets/expanded_media.dart';
import 'package:wagwan_work_testing/replies%20section/widgets/gif_button.dart';
import 'package:wagwan_work_testing/themes/app_theme.dart';

class BottomTextfield extends StatelessWidget {
  final TextEditingController controller;
  BottomTextfield({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UploadVisibilityBloc(),
        ),
        BlocProvider(
          create: (context) => TextFieldToggleBloc(),
        ),
      ],
      child: BlocBuilder<UploadVisibilityBloc, UploadVisibilityState>(
        builder: (context, uploadState) {
          bool isExpanded = uploadState is ScrollViewVisibleState;

          return BlocBuilder<TextFieldToggleBloc, TextFieldToggleState>(
            builder: (context, textFieldState) {
              bool isTextFieldExpanded =
                  textFieldState is TextFieldVisibleState;
              double uploadBoxHeight = 160;
              double collapsedHeight = 80;
              double bottomRowHeight = 80;

              return Align(
                alignment: Alignment.bottomCenter,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 50.0, sigmaY: 50.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          width: double.maxFinite,
                          height: isExpanded
                              ? uploadBoxHeight - bottomRowHeight
                              : collapsedHeight - bottomRowHeight,
                          decoration: BoxDecoration(
                            color: context.theme.appColors.surface
                                .withOpacity(0.4),
                          ),
                          child: isExpanded
                              ? const ExpandedMediaContent()
                              : const SizedBox.shrink(),
                        ),
                        Container(
                          width: double.maxFinite,
                          height: bottomRowHeight,
                          decoration: BoxDecoration(
                            border: isTextFieldExpanded
                                ? Border(
                                    top: BorderSide(
                                      color: context.theme.appColors.secondary
                                          .withOpacity(0.7),
                                    ),
                                  )
                                : null,
                            color: context.theme.appColors.surface
                                .withOpacity(0.4),
                          ),
                          child: Row(
                            children: [
                              if (!isTextFieldExpanded)
                                Row(
                                  children: [
                                    GifIconButton(
                                      onPressed: () {
                                        context
                                            .read<UploadVisibilityBloc>()
                                            .add(ToggleScrollViewEvent());
                                      },
                                      iconData:
                                          isExpanded ? Icons.clear : Icons.add,
                                    ),
                                    if (!isExpanded)
                                      GifIconButton(
                                          onPressed: () {},
                                          iconData: Icons.gif),
                                    if (!isExpanded)
                                      GifIconButton(
                                          onPressed: () {},
                                          iconData: Icons.mic),
                                  ],
                                ),
                              Expanded(
                                child: Padding(
                                  padding: isTextFieldExpanded
                                      ? const EdgeInsets.only(left: 8.0)
                                      : const EdgeInsets.all(0),
                                  child: TextField(
                                    decoration: const InputDecoration(
                                      hintText: 'Type a message...',
                                    ),
                                    controller: controller,
                                    onTap: () {
                                      context
                                          .read<TextFieldToggleBloc>()
                                          .add(ToggleTextFieldEvent());
                                    },
                                    obscureText: false,
                                    keyboardType: TextInputType.multiline,
                                    textInputAction: TextInputAction.newline,
                                    maxLines: null,
                                    onSubmitted: (value) {
                                      //enter the content
                                    },
                                  ),
                                ),
                              ),
                              GifIconButton(
                                  onPressed: () {
                                    // Post API
                                  },
                                  iconData: Icons.send),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
