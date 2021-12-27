import 'package:graphql_flutter/graphql_flutter.dart';

import '/config/graphql_config.dart';
import '/config/graphql_schema.dart';

import '/models/count.dart';

class CountService {
  static final GraphQLConfiguration _config = GraphQLConfiguration();

  static final Schema _schema = GraphQLSchema();

  static Future<Count?> dailyCount(
    String token,
    String date,
    String machineId,
  ) async {
    try {
      final GraphQLClient _client = _config.authClientToQuery(token);
      final QueryResult result = await _client.query(QueryOptions(document: gql(_schema.dailyCount(date, machineId))));
      // print(result.data!['fetchDailyCount']);
      return Count.fromMap(result.data!['fetchDailyCount']);
    } catch (error) {
      rethrow;
    }
  }
}
