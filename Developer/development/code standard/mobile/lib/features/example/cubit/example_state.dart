part of 'example_cubit.dart';

class ExampleState extends Equatable {
  final List<Photo> photos;
  final NetWorkStatus status;
  final String statusMessage;

  const ExampleState({
    this.photos = const [],
    this.status = NetWorkStatus.initial,
    this.statusMessage = 'Initial',
  });

  const ExampleState.init({
    this.photos = const [],
    this.status = NetWorkStatus.initial,
    this.statusMessage = 'Initial',
  });

  @override
  List<Object?> get props => [photos, status, statusMessage];

  ExampleState copyWith({
    List<Photo>? photos,
    NetWorkStatus? status,
    String? statusMessage,
  }) {
    return ExampleState(
      photos: photos ?? this.photos,
      status: status ?? this.status,
      statusMessage: statusMessage ?? this.statusMessage,
    );
  }
}
