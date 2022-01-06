import 'package:graphql_flutter/graphql_flutter.dart';

import '/config/graphql_config.dart';
import '/config/graphql_schema.dart';

import '/models/reason.dart';

class ReasonService {
  static final GraphQLConfiguration _config = GraphQLConfiguration();

  static final Schema _schema = GraphQLSchema();

  static Future<List<Reason>?> reasons(String token) async {
    final GraphQLClient _client = _config.authClientToQuery(token);
    final QueryResult _result = await _client.query(
      QueryOptions(
        document: gql(_schema.reasons()),
      ),
    );
    // print(_result.data!['reasons']);

    List data = _result.data!['reasons'] as List;
    List<Reason> reasons = List<Reason>.generate(
      data.length,
      (index) => Reason.fromMap(data[index]),
    );
    // print(reasons);
    return reasons;
  }
}
