import 'package:graphql_flutter/graphql_flutter.dart';

import '/config/graphql_config.dart';
import '/config/graphql_schema.dart';
import '/models/factory.dart';

class FactoryService {
  static final GraphQLConfiguration _config = GraphQLConfiguration();

  static final Schema _schema = GraphQLSchema();

  static Future<Factory?> factory(String token, String factoryId) async {
    try {
      final GraphQLClient _client = _config.authClientToQuery(token);
      final QueryResult result = await _client.query(
        QueryOptions(
          document: gql(_schema.factory(factoryId)),
        ),
      );
      // // print(result.data!['factories']);
      return Factory.fromMap(result.data!['factory']);
    } catch (error) {
      rethrow;
    }
  }

  static Future<void> updateFactory(String token, Factory factory) async {
    try {
      final GraphQLClient _client = _config.authClientToQuery(token);
      await _client
          .mutate(
            MutationOptions(
                document: gql(
              _schema.updateFactory(
                factory.factoryId,
                factory.factoryName,
              ),
            )),
          )
          .catchError((error) => throw error);
      // print(result.data!['updateFactory']);
    } catch (error) {
      rethrow;
    }
  }
}
