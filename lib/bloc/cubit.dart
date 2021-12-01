import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_ui/bloc/states.dart';
import 'package:spotify_ui/data/data.dart';

class SpotifyCubit extends Cubit<AppStates>{
  SpotifyCubit() : super(AppInitialState());

  Song? selected;
  static SpotifyCubit get(context) => BlocProvider.of(context);

  void selectTrack(Song track){
    selected = track;
    emit(ChangeSelectedColor());
  }

}