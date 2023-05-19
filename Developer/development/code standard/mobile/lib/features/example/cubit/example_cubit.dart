import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tooling/core/api/example/collections/photos_collection/get_photos.dart';
import 'package:tooling/core/enum/export.dart';
import 'package:tooling/core/models/example/photo.dart';

part 'example_state.dart';

class ExampleCubit extends Cubit<ExampleState> {
  ExampleCubit() : super(const ExampleState.init());

  void fetchDataFromApi() async {
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
