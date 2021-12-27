import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:production_automation_web/config/graphql_config.dart';
import 'package:production_automation_web/config/graphql_schema.dart';
import 'package:production_automation_web/models/factory.dart';

class FactoryService {
  static final GraphQLConfiguration _config = GraphQLConfiguration();

  static final Schema _schema = GraphQLSchema();

  static Future<Factory?> factory(String token) async {
    try {
      final GraphQLClient _client = _config.authClientToQuery(token);
      final QueryResult result = await _client.query(QueryOptions(document: gql(_schema.factory())));
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
