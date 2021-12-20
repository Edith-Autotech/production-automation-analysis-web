import 'package:graphql_flutter/graphql_flutter.dart';

import '/config/graphql_config.dart';
import '/config/graphql_schema.dart';

import '/src/models/count_model.dart';
import '/src/models/factory.dart';
import '/src/models/machine.dart';
import '/src/models/part.dart';
import '/src/models/reason_model.dart';
import '/src/models/user.dart';

abstract class ApiDatabase {
  Future<String> login(
    String email,
    String password,
  );
  Future<UserModel> currentUser(String token);
  Future<List<FactoryModel>> factories(String token);
  Future<List<Machine>> machines(
    String token,
    String factoryId,
  );
  Future<Machine> machine(
    String token,
    String machineId,
  );
  Future<Part> part(String token, String partNumber);
  Future<List<Part>> parts(String token, String factoryId, {bool? onlyPartNumbers});
  Future<List<Reason>> reasons(String token);
  Future<CountModel> dailyCount(String token, String date, String machineId);
  Future<bool> createSubscibedDevice(
    String token,
    String deviceToken,
    String factoryId,
  );
  Future<bool> deleteSubscribedDevice(
    String token,
    String deviceToken,
  );
  Future<void> updateFactory(
    String token,
    FactoryModel factory,
  );
  Future<void> updateMachine(
    String token,
    Machine machine,
  );
}

class GraphQLDatabase extends ApiDatabase {
  final GraphQLConfiguration _config = GraphQLConfiguration();
  final Schema _schema = GraphQLSchema();
  @override
  Future<String> login(String email, String password) async {
    final GraphQLClient _client = _config.clientToQuery();
    final QueryResult result = await _client.query(QueryOptions(
      document: gql(_schema.login(email, password)),
    ));
    if (result.hasException) {
      // // print(result.exception!.graphqlErrors.first.message);
      throw result.exception!.graphqlErrors.first.message;
    }
    return result.data!['login']['token'];
  }

  @override
  Future<bool> createSubscibedDevice(
    String token,
    String deviceToken,
    String factoryId,
  ) async {
    final GraphQLClient _client = _config.authClientToQuery(token);

    await _client
        .mutate(
          MutationOptions(
            document: gql(_schema.createSubscribedDevice(factoryId, deviceToken)),
          ),
        )
        .catchError(
          (error) => throw error,
        );
    // print(result.data!['createSubscribedDevice']);

    // ! fix return type
    return true;
  }

  @override
  Future<UserModel> currentUser(String token) async {
    final GraphQLClient _client = _config.authClientToQuery(token);
    final QueryResult result = await _client.query(QueryOptions(document: gql(_schema.user())));
    // print(result.data!['user']);
    return UserModel.fromMap(result.data!['user']);
  }

  @override
  Future<CountModel> dailyCount(
    String token,
    String date,
    String machineId,
  ) async {
    // print(date);
    final GraphQLClient _client = _config.authClientToQuery(token);
    final QueryResult result = await _client.query(QueryOptions(document: gql(_schema.dailyCount(date, machineId))));
    // print(result.data!['fetchDailyCount']);
    return CountModel.fromMap(result.data!['fetchDailyCount']);
  }

  @override
  Future<bool> deleteSubscribedDevice(String token, String deviceToken) async {
    final GraphQLClient _client = _config.authClientToQuery(token);

    await _client
        .query(QueryOptions(document: gql(_schema.deleteSubscribedDevice(deviceToken))))
        .catchError((error) => throw error);

    // print(result.data!['deleteSubscribedDevice']);

    // ! fix return type
    return true;
  }

  @override
  Future<List<FactoryModel>> factories(String token) async {
    final GraphQLClient _client = _config.authClientToQuery(token);
    final QueryResult result = await _client.query(QueryOptions(document: gql(_schema.factories())));
    // // print(result.data!['factories']);
    return (result.data!['factories'] as List)
        .map(
          (factory) => FactoryModel.fromMap(factory),
        )
        .toList();
  }

  @override
  Future<List<Machine>> machines(String token, String factoryId) async {
    final GraphQLClient _client = _config.authClientToQuery(token);
    final QueryResult result = await _client.query(QueryOptions(
      document: gql(_schema.machines(factoryId)),
    ));
    // // print(result.data!['machines']);
    return (result.data!['machines'] as List)
        .map(
          (machine) => Machine.fromMap(machine),
        )
        .toList();
  }

  @override
  Future<List<Part>> parts(
    String token,
    String factoryId, {
    bool? onlyPartNumbers,
  }) async {
    final GraphQLClient _client = _config.authClientToQuery(token);
    final QueryResult result = await _client.query(QueryOptions(
        document:
            //     ?
            gql(
      _schema.parts(factoryId),
    )));
    return (result.data!['parts'] as List)
        .map(
          (part) => Part.fromMap(part),
        )
        .toList();
  }

  @override
  Future<List<Reason>> reasons(String token) async {
    final GraphQLClient _client = _config.authClientToQuery(token);
    final QueryResult result = await _client.query(QueryOptions(document: gql(_schema.reasons())));
    // print(result.data!['reasons']);
    return (result.data!['reasons'] as List)
        .map(
          (machine) => Reason.fromMap(machine),
        )
        .toList();
  }

  @override
  Future<void> updateFactory(String token, FactoryModel factory) async {
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
  }

  @override
  Future<void> updateMachine(String token, Machine machine) async {
    final GraphQLClient _client = _config.authClientToQuery(token);
    print(machine);
    await _client
        .mutate(
          MutationOptions(
              document: gql(
            _schema.updateMachine(
              machineName: machine.name!,
              machineId: machine.id,
              currentPart1: machine.currentPart1,
              state: machine.state,
              previousTimeStroke: machine.previousTimeStroke,
              reasonCode: machine.reasonCode,
              currentOperation1: machine.currentOperation1,
              currentPart2: machine.currentPart2,
              currentOperation2: machine.currentOperation2,
              parallelState: machine.parallelState,
            ),
          )),
        )
        .catchError((error) => throw error);
    // // print(result);
    // print(result.data!['updateMachine']);
  }

  @override
  Future<Part> part(String token, String partNumber) async {
    final GraphQLClient _client = _config.authClientToQuery(token);
    print(partNumber);
    final QueryResult result = await _client.query(
      QueryOptions(document: gql(_schema.part(partNumber))),
    );
    print(result);
    print(result.data!['part']);
    return Part.fromMap(result.data!['part']);
  }

  @override
  Future<Machine> machine(String token, String machineId) async {
    final GraphQLClient _client = _config.authClientToQuery(token);
    final QueryResult result = await _client.query(
      QueryOptions(document: gql(_schema.machine(machineId))),
    );
    // print(result.data!['machineWithId']);
    return Machine.fromMap(result.data!['machineWithId']);
  }

  // @override
  // Future<String> loginWithGoogle(String authCode) async {
  //   final GraphQLClient _client = _config.clientToQuery();
  //   final QueryResult result = await _client.query(QueryOptions(document: gql(_schema.generateAuthUrl())));
  //   // print(result);
  //   return '';
  // }

  // @override
  // Future<void> registerUser(String email, String name, String password) async {
  //   final GraphQLClient _client = _config.clientToQuery();
  //   final QueryResult result = await _client.query(
  //     QueryOptions(document: gql(_schema.register(email, password, name))),
  //   );
  //   // print(result);
  // }

  // @override
  // Future<String> generateAuthUrl() async {
  //   final GraphQLClient _client = _config.clientToQuery();
  //   final QueryResult result = await _client.query(QueryOptions(document: gql(_schema.generateAuthUrl())));
  //   // print(result);
  //   return "";
  // }
}
