import 'package:flutter/material.dart';
import 'package:spotify_ui/data/data.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 280.0,
      color: Theme.of(context).primaryColor,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  "assets/spotify_logo.png",
                  height: 55.0,
                  filterQuality: FilterQuality.medium,
                ),
              ),
            ],
          ),
          _SideMenuIconTap(
            onTap: () {},
            label: "Home",
            icon: Icons.home_rounded,
          ),
          _SideMenuIconTap(
            onTap: () {},
            label: "Search",
            icon: Icons.search_rounded,
          ),
          _SideMenuIconTap(
            onTap: () {},
            label: "Your Library",
            icon: Icons.library_music_rounded,
          ),
          const SizedBox(
            height: 15.0,
          ),
          _LibraryPlayLists(),
        ],
      ),
    );
  }
}

class _SideMenuIconTap extends StatelessWidget {
  const _SideMenuIconTap({
    required this.label,
    required this.icon,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final VoidCallback onTap;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        size: 28.0,
        color: Theme.of(context).iconTheme.color,
      ),
      title: Text(
        label,
        style: Theme.of(context).textTheme.bodyText1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class _LibraryPlayLists extends StatefulWidget {
  @override
  State<_LibraryPlayLists> createState() => _LibraryPlayListsState();
}

class _LibraryPlayListsState extends State<_LibraryPlayLists> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        physics: const ClampingScrollPhysics(),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: Text(
                  "YOUR LIBRARY",
                  style: Theme.of(context).textTheme.headline4!.copyWith(fontSize: 15),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              ...yourLibrary.map(
                (e) => ListTile(
                  dense: true,
                  title: Text(
                    e,
                    style: Theme.of(context).textTheme.bodyText2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: (){},
                ),
              ).toList(),
            ],
          ),
          const SizedBox(height: 25,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: Text(
                  "PLAYLISTS",
                  style: Theme.of(context).textTheme.headline4!.copyWith(fontSize: 15),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              ...playlists.map(
                    (e) => ListTile(
                  dense: true,
                  title: Text(
                    e,
                    style: Theme.of(context).textTheme.bodyText2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: (){},
                ),
              ).toList(),
            ],
          )
        ],
      ),
    );
  }
}
