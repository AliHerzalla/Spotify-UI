import 'package:flutter/material.dart';
import 'package:spotify_ui/data/data.dart';
import 'package:spotify_ui/widget/widgets.dart';

class PlayListScreen extends StatefulWidget {
  final Playlist playList;

  const PlayListScreen({
    Key? key,
    required this.playList,
  }) : super(key: key);

  @override
  State<PlayListScreen> createState() => _PlayListScreenState();
}

class _PlayListScreenState extends State<PlayListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leadingWidth: 200.0,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              InkWell(
                onTap: () {},
                customBorder: const CircleBorder(),
                child: Container(
                  padding: const EdgeInsets.all(6.0),
                  decoration: const BoxDecoration(
                    color: Colors.black26,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.chevron_left),
                ),
              ),
              const SizedBox(width: 16),
              InkWell(
                onTap: () {},
                customBorder: const CircleBorder(),
                child: Container(
                  padding: const EdgeInsets.all(6.0),
                  decoration: const BoxDecoration(
                    color: Colors.black26,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.chevron_right),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton.icon(
            style: TextButton.styleFrom(
              primary: Theme.of(context).iconTheme.color,
            ),
            onPressed: () {},
            icon: const Icon(
              Icons.account_circle_rounded,
              size: 30.0,
            ),
            label: const Text("Ali"),
          ),
          const SizedBox(width: 10),
          IconButton(
            padding: EdgeInsets.zero,
            color: Theme.of(context).iconTheme.color,
            onPressed: () {},
            icon: const Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 30.0,
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(7),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFFAF1018),
              Theme.of(context).backgroundColor,
            ],
            stops: const [0, 0.4],
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.symmetric(
            vertical: 60.0,
            horizontal: 20.0,
          ),
          children: [
            PlayListHeader(playlist: widget.playList),
            TracksList(tracks: widget.playList.songs,),
          ],
        ),
      ),
    );
  }
}
