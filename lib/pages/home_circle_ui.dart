import 'package:flutter/material.dart';
import 'package:wagwan_work_testing/themes/app_theme.dart';

class HomeCircleUi extends StatefulWidget {
  final String name;
  final String imageURL;
  final VoidCallback onPressed;
  bool ispublic;

  HomeCircleUi({
    super.key,
    required this.name,
    required this.imageURL,
    required this.onPressed,
    required this.ispublic,
  });

  @override
  State<HomeCircleUi> createState() => _HomeCircleUiState();
}

class _HomeCircleUiState extends State<HomeCircleUi> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: widget.onPressed,
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 52,
                  backgroundImage: NetworkImage(widget.imageURL),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    height: 39,
                    width: 39,
                    decoration: BoxDecoration(
                          color: widget.ispublic == true
                            ? Theme.of(context).appColors.tertiary
                            : Theme.of(context).appColors.primary,
                        shape: BoxShape.circle,
                        border: Border.all(
                            width: 2,
                            color: Theme.of(context).appColors.primary)),
                    child: Center(
                      child: widget.ispublic == true
                          ? Text(
                              '2',
                              style: TextStyle(
                                      color:
                                          Theme.of(context).appColors.onPrimary)
                                  .copyWith(
                                      fontSize: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .fontSize),
                            )
                          : Icon(
                              Icons.lock,
                              color: Theme.of(context).appColors.onPrimary,
                              size: 18,
                            ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Text(
              widget.name,
              style: Theme.of(context).textTheme.bodyLarge,
              maxLines: 1,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
