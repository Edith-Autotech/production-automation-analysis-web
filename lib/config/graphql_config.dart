import 'package:flutter/material.dart';

import 'package:graphql_flutter/graphql_flutter.dart';
import '/constants.dart';

// ? setting up graphql client
class GraphQLConfiguration {
  static String url = Constants.configUrl;

  ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
    GraphQLClient(
      cache: GraphQLCache(),
      link: HttpLink(url, defaultHeaders: {'Content-Type': "application/json"}),
    ),
  );

  GraphQLClient clientToQuery() => GraphQLClient(
        link: HttpLink(
          url,
          defaultHeaders: {'Content-Type': "application/json"},
        ),
        cache: GraphQLCache(),
      );

  GraphQLClient authClientToQuery(String token) => GraphQLClient(
        link: HttpLink(
          url,
          defaultHeaders: {
            'Content-Type': "application/json",
            "authorization": "Bearer $token",
          },
        ),
        cache: GraphQLCache(),
      );
}
