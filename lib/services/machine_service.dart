import 'package:graphql_flutter/graphql_flutter.dart';

import '/config/graphql_config.dart';
import '/config/graphql_schema.dart';

import '/models/machine.dart';

class MachineService {
  static final GraphQLConfiguration _config = GraphQLConfiguration();
  static final Schema _schema = GraphQLSchema();

  static Future<Machine?> machine(String token, String machineId) async {
    try {
      final GraphQLClient _client = _config.authClientToQuery(token);
      final QueryResult result = await _client.query(
        QueryOptions(document: gql(_schema.machine(machineId))),
      );
      // print(result.data!['machineWithId']);
      return Machine.fromMap(result.data!['machineWithId']);
    } catch (error) {
      rethrow;
    }
  }

  static Future<List<Machine>?> machines(
    String token,
    String factoryId,
  ) async {
    // print(token);
    // print(factoryId);
    try {
      final GraphQLClient _client = _config.authClientToQuery(token);
      final QueryResult result = await _client.query(QueryOptions(
        document: gql(_schema.machines(factoryId)),
      ));
      // print(result.data!['machines']);
      return (result.data!['machines'] as List)
          .map(
            (machine) => Machine.fromMap(machine),
          )
          .toList();
    } catch (error) {
      rethrow;
    }
  }

  static Future<void> updateMachine(String token, Machine machine) async {
    try {
      final GraphQLClient _client = _config.authClientToQuery(token);
      // print(machine);
      await _client
          .mutate(
            MutationOptions(
                document: gql(
              _schema.updateMachine(
                machineName: machine.machineName,
                machineId: machine.id,
                currentPart1: machine.currentPart_1,
                state: machine.state,
                previousTimeStroke: machine.previousTimeStroke,
                reasonCode: machine.reasonCode,
                currentOperation1: machine.currentOperation_1,
                currentPart2: machine.currentPart_2,
                currentOperation2: machine.currentOperation_2,
                parallelState: machine.parallelState,
              ),
            )),
          )
          .catchError((error) => throw error);
      // // print(result);
      // print(result.data!['updateMachine']);
    } catch (error) {
      rethrow;
    }
  }
}
