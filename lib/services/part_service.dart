import 'package:graphql_flutter/graphql_flutter.dart';

import '/config/graphql_config.dart';
import '/config/graphql_schema.dart';
import '/models/part.dart';

class PartService {
  static final GraphQLConfiguration _config = GraphQLConfiguration();
  static final Schema _schema = GraphQLSchema();

  static Future<List<Part>?> parts(
    String token,
    String factoryId, {
    bool? onlyPartNumbers,
  }) async {
    // try {
    // print(factoryId);
    final GraphQLClient _client = _config.authClientToQuery(token);
    final QueryResult result = await _client.query(
      QueryOptions(document: gql(_schema.parts(factoryId))),
    );
    // print(result);
    // print(result.data!['parts']);
    return (result.data!['parts'] as List)
        .map(
          (part) => Part.fromMap(part),
        )
        .toList();
    // } catch (error) {
    //   rethrow;
    // }
  }

  static Future<Part> part(String token, String partNumber) async {
    final GraphQLClient _client = _config.authClientToQuery(token);
    // print(partNumber);
    final QueryResult result = await _client.query(
      QueryOptions(document: gql(_schema.part(partNumber))),
    );
    // print(result);
    // print(result.data!['part']);
    return Part.fromMap(result.data!['part']);
  }
}
