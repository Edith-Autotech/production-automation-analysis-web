import 'package:graphql_flutter/graphql_flutter.dart';

import '/config/graphql_config.dart';
import '/config/graphql_schema.dart';
import '/models/user.dart';

class UserService {
  static final GraphQLConfiguration _config = GraphQLConfiguration();

  static final Schema _schema = GraphQLSchema();

  static Future<String?> login(String email, String password) async {
    try {
      final GraphQLClient _client = _config.clientToQuery();
      final QueryResult result = await _client.query(QueryOptions(
        document: gql(_schema.login(email, password)),
      ));
      if (result.hasException) {
        // // print(result.exception!.graphqlErrors.first.message);
        throw result.exception!.graphqlErrors.first.message;
      }
      return result.data!['login']['token'];
    } catch (error) {
      rethrow;
    }
  }

  static Future<UserModel?> currentUser(String token) async {
    try {
      final GraphQLClient _client = _config.authClientToQuery(token);
      final QueryResult result = await _client.query(QueryOptions(document: gql(_schema.user())));
      // print(result.data!['user']);
      return UserModel.fromMap(result.data!['user']);
    } catch (error) {
      rethrow;
    }
  }

  static Future<List<UserModel>?> allFactoryUsers(
    String token,
    String factoryId,
  ) async {
    try {
      final GraphQLClient _client = _config.authClientToQuery(token);
      final QueryResult _result = await _client.query(
        QueryOptions(
          document: gql(_schema.allFactoryUsers(factoryId)),
        ),
      );
      // print(_result.data);
      List data = _result.data!['allUsers'] as List;
      // print(data);
      return List<UserModel>.generate(
        data.length,
        (index) => UserModel.fromMap(data[index]),
      );
    } catch (error) {
      rethrow;
    }
  }

  static Future<void> updateUser(String token, String name, String role) async {
    try {
      final GraphQLClient _client = _config.authClientToQuery(token);
      await _client.mutate(
        MutationOptions(
          document: gql(_schema.updateUser(name, role)),
        ),
      );
    } catch (error) {
      rethrow;
    }
  }

  static Future<void> createNewUser(
    String token,
    String name,
    String password,
    String email,
    String userRoleString,
    String factoryId,
  ) async {
    try {
      final GraphQLClient _client = _config.authClientToQuery(token);
      await _client.mutate(
        MutationOptions(
          document: gql(
            _schema.createNewUser(
              name,
              email,
              password,
              userRoleString,
              factoryId,
            ),
          ),
        ),
      );
    } catch (error) {
      rethrow;
    }
  }
}
