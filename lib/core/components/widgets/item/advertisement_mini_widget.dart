import 'package:flutter/material.dart';
import 'package:sahiplen/core/constants/app_constants.dart';
import 'package:sahiplen/core/extensions/app_extensions.dart';

import 'package:sahiplen/ui/home/navigation_bar/profile/create_advertisement/adversitement_model.dart';

class AdvertisementMiniWidget extends StatelessWidget {
  final AdversitementModel adversitementModel;
  const AdvertisementMiniWidget(this.adversitementModel, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(adversitementModel.getLocation, style: context.textTheme.subtitle2),
              Text(AppConstants.instance.convertMiliSecondToDate(adversitementModel.adversitementID!)),
            ],
          ),
          ListTile(
              leading: CircleAvatar(
                radius: 26,
                backgroundImage: NetworkImage(adversitementModel.profileUrl!),
              ),
              title: Text(adversitementModel.adversitementHeader!),
              subtitle: Text(adversitementModel.advertisementExplanation!),
              trailing: CircleAvatar(
                backgroundColor: Colors.grey[200],
                radius: 18,
                child: Center(child: Icon(Icons.edit)),
              )),
        ],
      ),
    );
  }
}
