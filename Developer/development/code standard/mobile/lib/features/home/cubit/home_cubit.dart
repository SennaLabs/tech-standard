import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tooling/core/api/example/collections/photos_collection/get_photos.dart';
import 'package:tooling/core/enum/network_status.dart';
import 'package:tooling/core/models/models.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  Future<void> fetchDataFromApi() async {
    emit(state.copyWith(status: NetWorkStatus.loading, statusMessage: 'Loading'));
    try {
      final List<Photo> photos = await getPhoto();
      emit(state.copyWith(
        photos: photos,
        status: NetWorkStatus.success,
        statusMessage: 'Success',
      ));
    } catch (error) {
      emit(state.copyWith(
        status: NetWorkStatus.error,
        statusMessage: error.toString(),
      ));
    }
  }
}
