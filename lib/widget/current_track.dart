import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_ui/bloc/cubit.dart';
import 'package:spotify_ui/bloc/states.dart';

class CurrentTrack extends StatelessWidget {
  const CurrentTrack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SpotifyCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          width: double.infinity,
          height: 85.0,
          color: Colors.black87,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _TrackInfo(),
                _PlayerControls(),
                if (MediaQuery.of(context).size.width > 800)
                  _MoreControl(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _TrackInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = SpotifyCubit.get(context);
    final selected = cubit.selected;
    if (selected == null) {
      return const SizedBox.shrink();
    } else {
      return Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.asset(
              "assets/lofigirl.jpg",
              height: 60.0,
              width: 60.0,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 15.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                selected.title,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              const SizedBox(height: 4.0),
              Text(
                selected.artist,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Colors.grey[300],
                      fontSize: 12.0,
                    ),
              ),
            ],
          ),
          const SizedBox(width: 15.0),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite_border_rounded,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
        ],
      );
    }
  }
}

class _PlayerControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = SpotifyCubit.get(context);
    final selected = cubit.selected;
    if (selected == null) {
      return const SizedBox.shrink();
    } else {
      return Column(
        children: [
          Row(
            children: [
              IconButton(
                padding: const EdgeInsets.only(),
                iconSize: 20.0,
                onPressed: () {},
                icon: const Icon(Icons.shuffle_rounded),
              ),
              IconButton(
                padding: const EdgeInsets.only(),
                iconSize: 20.0,
                onPressed: () {},
                icon: const Icon(Icons.skip_previous_rounded),
              ),
              IconButton(
                padding: const EdgeInsets.only(),
                iconSize: 35.0,
                onPressed: () {},
                icon: const Icon(Icons.play_circle_outline_rounded),
              ),
              IconButton(
                padding: const EdgeInsets.only(),
                iconSize: 20.0,
                onPressed: () {},
                icon: const Icon(Icons.skip_next_rounded),
              ),
              IconButton(
                padding: const EdgeInsets.only(),
                iconSize: 20.0,
                onPressed: () {},
                icon: const Icon(Icons.repeat_rounded),
              ),
            ],
          ),
          Row(
            children: [
              Text("0:00", style: Theme.of(context).textTheme.caption),
              const SizedBox(width: 8.0),
              Container(
                height: 5.0,
                width: MediaQuery.of(context).size.width * 0.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.grey[400],
                ),
              ),
              const SizedBox(width: 8.0),
              Text(
                selected.duration ?? "0:00",
                style: Theme.of(context).textTheme.caption,
              )
            ],
          ),
        ],
      );
    }
  }
}

class _MoreControl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = SpotifyCubit.get(context);
    final selected = cubit.selected;
    if (selected == null) {
      return const SizedBox.shrink();
    } else {
      return Row(
        children: [
          IconButton(
            onPressed: () {},
            iconSize: 20.0,
            icon: const Icon(Icons.devices_rounded),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.volume_up_rounded),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 9),
            child: Container(
              height: 5.0,
              width: 70.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.grey[800],
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.fullscreen_rounded),
          ),
        ],
      );
    }
  }
}
