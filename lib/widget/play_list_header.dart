import 'package:flutter/material.dart';
import 'package:spotify_ui/data/data.dart';

class PlayListHeader extends StatelessWidget {
  const PlayListHeader({
    Key? key,
    required this.playlist,
  }) : super(key: key);

  final Playlist playlist;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(17.0),
              child: Image.asset(
                playlist.imageURL,
                height: 200.0,
                width: 200.0,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 15.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "PLAYLIST",
                    style: Theme.of(context)
                        .textTheme
                        .overline!
                        .copyWith(fontSize: 12.0),
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    playlist.name,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    playlist.description,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    "Created by ${playlist.creator} - ${playlist.songs.length} songs, ${playlist.duration}",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20.0),
        _PlayListButtons(
          followers: playlist.followers,
        ),
      ],
    );
  }
}

class _PlayListButtons extends StatelessWidget {
  final String followers;

  const _PlayListButtons({
    Key? key,
    required this.followers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 48.0,
              vertical: 20.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            backgroundColor: Theme.of(context)
                // ignore: deprecated_member_use
                .accentColor,
            primary: Theme.of(context).iconTheme.color,
            textStyle: Theme.of(context).textTheme.caption!.copyWith(
                  fontSize: 12.0,
                  letterSpacing: 2.0,
                ),
          ),
          onPressed: () {},
          child: const Text("PLAY"),
        ),
        const SizedBox(width: 10.0),
        IconButton(
          onPressed: () {},
          iconSize: 30.0,
          icon: const Icon(Icons.favorite_border_rounded),
        ),
        IconButton(
          onPressed: () {},
          iconSize: 30.0,
          icon: const Icon(Icons.more_horiz_rounded),
        ),
        const Spacer(),
        Text(
          "FOLLOWERS\n$followers",
          style: Theme.of(context).textTheme.overline!.copyWith(
                fontSize: 12.0,
              ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
