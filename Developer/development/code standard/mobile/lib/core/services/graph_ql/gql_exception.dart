part of 'gql_service.dart';

class BadRequestException extends ErrorLink {
  final String? message;
  const BadRequestException(this.message);

  @override
  String toString() {
    return message ?? 'Invalid request';
  }
}

class InternalServerErrorException extends ErrorLink {
  final String? message;

  const InternalServerErrorException(this.message);
  @override
  String toString() {
    return message ?? 'Unknown error occurred, please try again later.';
  }
}

class ConflictException extends ErrorLink {
  final String? message;

  const ConflictException(this.message);
  @override
  String toString() {
    return message ?? 'Conflict occurred';
  }
}

class UnauthorizedException extends ErrorLink {
  final String? message;

  const UnauthorizedException(this.message);
  @override
  String toString() {
    return message ?? 'Access denied';
  }
}

class NotFoundException extends ErrorLink {
  final String? message;

  const NotFoundException(this.message);
  @override
  String toString() {
    return message ?? 'The requested information could not be found';
  }
}

class NoInternetConnectionException extends ErrorLink {
  final String? message;

  const NoInternetConnectionException(this.message);
  @override
  String toString() {
    return message ?? 'No internet connection detected, please try again.';
  }
}

class DeadlineExceededException extends ErrorLink {
  final String? message;

  const DeadlineExceededException(this.message);
  @override
  String toString() {
    return message ?? 'The connection has timed out, please try again.';
  }
}

abstract class ErrorLink implements Exception {
  const ErrorLink();
}