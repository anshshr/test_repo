import 'package:flutter/material.dart';
import 'package:wagwan/core/themes/app_theme.dart';

class CircleDecsription extends StatelessWidget {
  final String imageURL;
  final String circleName;
  final String? descriptionText;

  const CircleDecsription({
    super.key,
    required this.imageURL,
    required this.circleName,
    required this.descriptionText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        crossAxisAlignment:
            descriptionText != null && descriptionText!.isNotEmpty
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
        children: <Widget>[
          // Profile picture
          CircleAvatar(
            radius: 25,
            backgroundImage: (imageURL.isNotEmpty)
                ? NetworkImage(imageURL)
                : const AssetImage('assets/icons/default_pfp.jpg'),
          ),
          // circleName and description
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment:
                  descriptionText != null && descriptionText!.isNotEmpty
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  circleName,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Theme.of(context).appColors.onPrimary),
                ),
                descriptionText != null && descriptionText!.isNotEmpty
                    ? Container(
                        constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.7),
                        child: Text(
                          descriptionText!,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  color: Theme.of(context).appColors.accent1),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 6,
                        ),
                      )
                    : const SizedBox(
                        height: 10,
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
