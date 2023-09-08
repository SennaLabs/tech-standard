import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fresh_graphql/fresh_graphql.dart' as fresh;
import 'package:graphql_flutter/graphql_flutter.dart' as gql;

export 'package:graphql_flutter/graphql_flutter.dart';

part 'gql_exception.dart';

part 'gql_link.dart';

class GQLService {
  static final GQLService _gqlService = GQLService._();

  factory GQLService() => _gqlService;

  static GQLService get instance => _gqlService;

// VARIABLES
  late gql.HttpLink _httpLink;

  late fresh.FreshLink _freshLink;
  late gql.ErrorLink _errorLink;

  late gql.AuthLink _deviceLink;

  late gql.Link _link;
  late ValueNotifier<gql.GraphQLClient> _client;

  static final gql.Policies policies = gql.Policies(
    fetch: gql.FetchPolicy.noCache,
  );

  gql.GraphQLClient get clientToQuery => _client.value;

  ValueNotifier<gql.GraphQLClient> get client => _client;

  Future<void> setToken({bool force = false}) async {
    final token = await FirebaseAuth.instance.currentUser?.getIdToken(force);
    await _freshLink.setToken(token);
  }

  Future<void> removeToken() async => await _freshLink.clearToken();

  GQLService._() {
    _httpLink = gql.HttpLink("${dotenv.env['BASE_URL']}/");

    _freshLink = GqlLink().freshLink;
    _errorLink = GqlLink().errorLink;

    _deviceLink = gql.AuthLink(
      headerKey: "device-name",
      getToken: () {
        return null;
      },
    );

    _link = gql.Link.from([_freshLink, _deviceLink, _errorLink, _httpLink]);
    _client = ValueNotifier(gql.GraphQLClient(
      cache: gql.GraphQLCache(),
      link: _link,
      defaultPolicies: gql.DefaultPolicies(
        watchQuery: policies,
        query: policies,
      ),
    ));
  }
}
