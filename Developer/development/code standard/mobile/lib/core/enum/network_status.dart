enum NetWorkStatus { initial, loading, error, success }

extension NetWorkStatusX on NetWorkStatus {
  bool get isInitial => this == NetWorkStatus.initial;
  bool get isLoading => this == NetWorkStatus.loading;
  bool get isError => this == NetWorkStatus.error;
  bool get isSuccess => this == NetWorkStatus.success;
}
