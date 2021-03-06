/**
 * Author: Damodar Lohani
 * profile: https://github.com/lohanidamodar
  */

import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/features/announcements/data/model/announcement.dart';
import 'package:flutter_ui_challenges/features/announcements/pages/annoucnement_details.dart';
import 'package:flutter_ui_challenges/src/designs/pages/invitation/inauth.dart';
import 'package:flutter_ui_challenges/src/designs/widgets/network_image.dart';

class AnnouncementListItem extends StatelessWidget {
  const AnnouncementListItem({
    Key key,
    @required this.announcement,
  }) : super(key: key);

  final Announcement announcement;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => AnnouncementDetails(
                    announcement: announcement,
                  ))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                if (announcement.image != null) ...[
                  Expanded(
                    child: PNetworkImage(
                      announcement.image,
                    ),
                  ),
                ],
                const SizedBox(height: 10.0),
                Text(
                  announcement.title,
                  style: boldText,
                ),
                const SizedBox(height: 10.0),
              ],
            ),
            Align(
                alignment: Alignment.topRight, child: Icon(Icons.open_in_new)),
          ],
        ),
      ),
    );
  }
}
