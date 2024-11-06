import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wagwan/core/themes/app_theme.dart';
import 'package:wagwan/core/themes/custom_buttons/gif_icon_button.dart';
import 'package:wagwan/modules/chat/bloc/buttons_visibilty/button_visibility_bloc.dart';
import 'package:wagwan/modules/chat/bloc/buttons_visibilty/button_visibility_event.dart';
import 'package:wagwan/modules/chat/bloc/buttons_visibilty/button_visibility_state.dart';
import 'package:wagwan/modules/chat/bloc/textfield_visibility/textfield_visibility_bloc.dart';
import 'package:wagwan/modules/chat/bloc/textfield_visibility/textfield_visibility_event.dart';
import 'package:wagwan/modules/chat/bloc/textfield_visibility/textfield_visibility_state.dart';
import 'package:wagwan/modules/chat/widgets/chat_media.dart';

class ChatTextfield extends StatelessWidget {
  final TextEditingController controller;

  const ChatTextfield({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ButtonVisibilityBloc(),
          ),
          BlocProvider(
            create: (context) => TextfieldVisibilityBloc(),
          ),
        ],
        child: BlocBuilder<ButtonVisibilityBloc, ButtonVisibilityState>(
          builder: (context, uploadState) {
            final bool isExpanded = uploadState is UploadButtonsAppearState;

            return BlocBuilder<TextfieldVisibilityBloc,
                TextfieldVisibilityState>(
              builder: (context, textFieldState) {
                final bool isTextFieldExpanded =
                    textFieldState is TextFieldAppear;
                const double uploadBoxHeight = 160;
                const double collapsedHeight = 80;
                const double bottomRowHeight = 80;

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
                                ? const ChatMedia()
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
                                              .read<ButtonVisibilityBloc>()
                                              .add(ButttonsVisible());
                                        },
                                        iconData: isExpanded
                                            ? Icons.clear
                                            : Icons.add,
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
                                        : EdgeInsets.zero,
                                    child: TextField(
                                      decoration: const InputDecoration(
                                        hintText: 'Type a message...',
                                      ),
                                      controller: controller,
                                      onTap: () {
                                        context
                                            .read<TextfieldVisibilityBloc>()
                                            .add(TextFieldExpanded());
                                      },
                                      obscureText: false,
                                      keyboardType: TextInputType.multiline,
                                      textInputAction: TextInputAction.newline,
                                      maxLines: null,
                                      onSubmitted: (value) {
                                        // Enter the content
                                      },
                                    ),
                                  ),
                                ),
                                GifIconButton(
                                    onPressed: () {}, iconData: Icons.send),
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
        ));
  }
}
