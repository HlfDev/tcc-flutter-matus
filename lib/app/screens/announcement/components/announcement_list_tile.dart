import 'package:flutter/material.dart';
import 'package:matus_app/app/models/announcement.dart';

class AnnouncementListTile extends StatelessWidget {
  const AnnouncementListTile(this.announcement);

  final Announcement announcement;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed('/announcement_open', arguments: announcement);
        },
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          child: Container(
            height: 100,
            padding: const EdgeInsets.all(8),
            child: Row(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(announcement.images.first),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        announcement.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        'Preço: ${announcement.price}',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: Theme.of(context).primaryColor),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
