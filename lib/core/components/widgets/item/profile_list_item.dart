import 'package:flutter/material.dart';

import 'package:sahiplen/core/extensions/app_extensions.dart';

class ProfileListItem extends StatelessWidget {
  final String titleText;
  final String subtitleText;
  final IconData icon;
  final Function() onTap;

  const ProfileListItem({
    Key? key,
    required this.titleText,
    required this.subtitleText,
    required this.onTap,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: context.borderRadiusNormal),
      clipBehavior: Clip.hardEdge,
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: context.borderRadiusNormal),
        onTap: onTap,
        title: Text(titleText, style: context.textTheme.bodyText2!.copyWith(color: context.theme.primaryColor)),
        subtitle: Text(subtitleText),
        leading: CircleAvatar(backgroundColor: Colors.white, child: Icon(icon, color: context.theme.primaryColor)),
      ),
    );
  }
}
