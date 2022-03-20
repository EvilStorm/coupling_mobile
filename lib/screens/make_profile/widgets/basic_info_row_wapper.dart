import 'package:flutter/material.dart';

class BasicInfoItemWidget extends StatelessWidget {
  final String title;
  final Widget child;
  final bool showHelp;
  final int? space;
  final Function? helpCallback;
  const BasicInfoItemWidget({
    Key? key,
    required this.title,
    required this.child,
    this.showHelp = false,
    this.helpCallback,
    this.space,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(
          flex: space ?? 3,
          fit: FlexFit.tight,
          child: Row(
            children: [
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                width: 8.0,
              ),
              Visibility(
                  visible: showHelp,
                  child: GestureDetector(
                    onTap: () => helpCallback?.call(),
                    child: Icon(
                      Icons.help_outline,
                      color: Theme.of(context).primaryColor,
                    ),
                  ))
            ],
          ),
        ),
        Flexible(
          flex: 7,
          fit: FlexFit.tight,
          child: child,
        ),
      ],
    );
  }
}
