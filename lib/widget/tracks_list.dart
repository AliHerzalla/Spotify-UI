import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_ui/bloc/cubit.dart';
import 'package:spotify_ui/bloc/states.dart';
import 'package:spotify_ui/data/data.dart';

class TracksList extends StatelessWidget {
  final List<Song> tracks;

  const TracksList({
    Key? key,
    required this.tracks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SpotifyCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = SpotifyCubit.get(context);
        return DataTable(
          dataRowHeight: 54.0,
          headingTextStyle:
              Theme.of(context).textTheme.overline!.copyWith(fontSize: 12.0),
          showCheckboxColumn: false,
          columns: const [
            DataColumn(label: Text("TITLE")),
            DataColumn(label: Text("ARTIST")),
            DataColumn(label: Text("ALBUM")),
            DataColumn(label: Icon(Icons.access_time_rounded)),
          ],
          rows: tracks.map(
            (e) {
              final selected = cubit.selected?.id == e.id;
              final textStyle = TextStyle(
                color: selected
                    // ignore: deprecated_member_use
                    ? Theme.of(context).accentColor
                    : Theme.of(context).iconTheme.color,
              );
              return DataRow(
                cells: [
                  DataCell(
                    Text(
                      e.title,
                      style: textStyle,
                    ),
                  ),
                  DataCell(
                    Text(
                      e.artist,
                      style: textStyle,
                    ),
                  ),
                  DataCell(
                    Text(
                      e.album,
                      style: textStyle,
                    ),
                  ),
                  DataCell(
                    Text(
                      e.duration,
                      style: textStyle,
                    ),
                  ),
                ],
                selected: selected,
                onSelectChanged: (_) => cubit.selectTrack(e),
              );
            },
          ).toList(),
        );
      },
    );
  }
}
