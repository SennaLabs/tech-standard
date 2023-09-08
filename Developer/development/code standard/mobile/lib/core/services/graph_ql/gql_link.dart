part of 'gql_service.dart';

class GqlLink {
  static final GqlLink _gqlLink = GqlLink._internal();
  factory GqlLink() {
    return _gqlLink;
  }
  GqlLink._internal() {
    initFreshLink();
    initErrorLink();
  }
  late gql.ErrorLink _errorLink;
  late fresh.FreshLink _freshLink;

  gql.ErrorLink get errorLink => _errorLink;
  fresh.FreshLink get freshLink => _freshLink;

  static mapError(gql.OperationException exception) {
    if (exception.graphqlErrors.isNotEmpty) {
      final error = exception.graphqlErrors.first.extensions!;
      final int? code = error['statusCode'];
      final String? message = error['message'];
      switch (code) {
        case 400:
          throw BadRequestException(message);
        case 401:
          throw UnauthorizedException(message);
        case 403:
          throw UnauthorizedException(message);
        case 404:
          throw NotFoundException(message);
        case 409:
          throw ConflictException(message);
        case 500:
          throw InternalServerErrorException(message);
        case 502:
          throw InternalServerErrorException(message);
        default:
          throw BadRequestException(message);
      }
    }
  }

  void initErrorLink() {
    _errorLink = gql.ErrorLink(
      onGraphQLError: (request, forward, response) {
        final error = response.errors!.first.extensions!;
        final int? code = error['statusCode'];
        debugPrint("=========== >>>  ERROR $code ${error['message']}   <<< ===========");
        switch (code) {
          case 400:
            if (error['message'] == "Receiver not allow message") {
              //
            }
            break;
          case 401:
            if (error['message'] == "Device not found.") {
              //  คนอื่นเตะเราออก
            } else if (error['message'] == "Invalid pdpa consent version") {
              // DESC: case PDPA consent (Term Of Use / Privacy Policy) invalid
            } else if (error['message'] == "Invalid consent version") {
              // DESC: case writer consent invalid
            }
            break;
          case 403:
            if (error['message'] == "Device not found.") {
              //  คนอื่นเตะเราออก
            } else if (error['message'] == "User was banned.") {
              // ผู้ใช้งานโดนแบนจาก admin
            }
            break;
          case 404:
            break;
          case 409:
            break;
          case 500:
            break;
          case 502:
            break;
        }
        return forward(request);
      },
    );
  }

  void initFreshLink() {
    _freshLink = fresh.FreshLink(
      tokenHeader: (token) {
        // debugPrint(' CALL WITH TOKEN =>> $token');
        return {"Authorization": "Bearer $token"};
      },
      tokenStorage: fresh.InMemoryTokenStorage(),
      refreshToken: (token, client) {
        try {
          // DO REFRESH WORK
          debugPrint('=>>>> DO REFRESH WORK');
          final user = FirebaseAuth.instance.currentUser;
          if (user == null) {
            debugPrint('=>>>> DO REFRESH WORK user = null');
            return Future.delayed(const Duration(seconds: 0));
          } else {
            debugPrint('=>>>> DO REFRESH WORK get Id token = null');
            return user.getIdToken(true);
          }
        } catch (ex) {
          debugPrint('=>>>> CATCH ON DO REFRESH WORK');
          freshLink.clearToken();
          throw fresh.RevokeTokenException(); // refresh fails and should result in a force-logout.
        }
      },
      shouldRefresh: (response) {
        if (response.errors != null && response.errors!.isNotEmpty) {
          final error = response.errors!.first.extensions!;
          final int? code = error['statusCode'];
          bool shouldRefresh = false;
          if (code == 401) {
            if (error['message'] == "Device not found.") {
              // โดนเตะออกไม่ใช่ token หมดอายุเลยไม่ต้อง refresh token
              shouldRefresh = false;
            } else if (error['message'] == "Invalid pdpa consent version") {
              // invalid consent โดย token ยังไม่หมดอายุ ไม่ต้อง refresh token
              shouldRefresh = false;
            } else {
              shouldRefresh = true;
            }
          }
          debugPrint('Should Refresh $shouldRefresh');

          return shouldRefresh;
        }
        return false;
      },
    )..authenticationStatus.listen((value) => debugPrint);
  }
}