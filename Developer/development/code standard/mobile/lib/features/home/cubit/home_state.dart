part of 'home_cubit.dart';

class HomeState extends Equatable {
  final List<Photo> photos;
  final NetWorkStatus status;
  final String statusMessage;

  const HomeState({
    this.photos = const [],
    this.status = NetWorkStatus.initial,
    this.statusMessage = 'Initial',
  });

  const HomeState.init({
    this.photos = const [],
    this.status = NetWorkStatus.initial,
    this.statusMessage = 'Initial',
  });

  @override
  List<Object?> get props => [photos, status, statusMessage];

  HomeState copyWith({
    List<Photo>? photos,
    NetWorkStatus? status,
    String? statusMessage,
  }) {
    return HomeState(
      photos: photos ?? this.photos,
      status: status ?? this.status,
      statusMessage: statusMessage ?? this.statusMessage,
    );
  }
}
