// ? creating opertion strings based on graphql schema

import '../helper/state_enum.dart';

abstract class Schema {
  String login(String email, String password);
  String user();
  String createNewUser(
    String name,
    String email,
    String password,
    String userRoleString,
    String factoryId,
  );
  String allFactoryUsers(String factoryId);
  String updateUser(String name, String role);
  String factory(String factoryId);
  String machines(String factoryId);
  String machine(String machineId);
  String part(String partNumber);
  String parts(String factoryId);
  String reasons();
  String dailyCount(String date, String machineId);
  String createSubscribedDevice(String factoryId, String deviceToken);
  String deleteSubscribedDevice(String deviceToken);
  String updateFactory(String factoryId, String factoryName);
  String updateMachine({
    required String machineName,
    required String machineId,
    required String currentPart1,
    required machineStateEnum state,
    required String previousTimeStroke,
    required int reasonCode,
    required int currentOperation1,
    String? currentPart2,
    int? currentOperation2,
    required bool parallelState,
  });
  String machineSubscription(String machineId);
  String countSubscription(String date, String machineId);
}

class GraphQLSchema extends Schema {
  @override
  String createSubscribedDevice(
    String factoryId,
    String deviceToken,
  ) {
    return ''' 
    mutation createSubscribedDevice {
      createSubscribedDevice(subscribedDeviceInput: {
        deviceToken: "$deviceToken"
        factoryId: "$factoryId"
      })
    }
    ''';
  }

  @override
  String dailyCount(String date, String machineId) {
    return ''' 
    query dailyCount {
      fetchDailyCount(dailyCountInput: {
        date: "$date"
        machineId: "$machineId"
      }) {
        _id
        machineId
        date
        count
        standbyCount
        productionCount
        idleCount
        productionTime
        idleTime
        standbyTime
        hourlyCount {
          timeRange
          productionCount
          standbyCount
          idleCount
        }
      }
    }
    ''';
  }

  @override
  String deleteSubscribedDevice(String deviceToken) {
    return ''' 
    mutation createSubscribedDevice {
      deleteSubscribedDevice(deviceToken: "$deviceToken")
    }
  ''';
  }

  @override
  String factory(String factoryId) {
    return ''' 
    query Factory {
      factory(factoryId: "$factoryId") {
        _id
        factoryName
      }
    }
    ''';
  }

  @override
  String login(String email, String password) {
    return ''' 
    query login {
      login(email: "$email" 
        password: "$password") {
        token
      }
    }
    ''';
  }

  @override
  String machines(String factoryId) {
    return ''' 
    query machines{
      machines(queryMachineInput: {factoryId: "$factoryId"}){
        _id
        factoryId
        machineName
        parallelState
        currentPart_1
        currentPart_2
        currentOperation_1
        currentOperation_2
        reasonCode
        state
        previousTimeStroke
      }
    }
''';
  }

  @override
  String parts(String factoryId) {
    return ''' 
    query parts{
      parts(allPartsInput: { factoryId: "$factoryId" }){
        _id
        factoryId
        companyName
        noOfOperations
        partName
        partNumber
        stock {
          stock
          operationNumber
        }
      }
    }
   ''';
  }

  @override
  String reasons() {
    return ''' 
    query reasons{
      reasons {
        _id
        reasonCode
        reasonDescription
      }
    }
    ''';
  }

  @override
  String updateFactory(String factoryId, String factoryName) {
    return ''' 
    mutation updateFactory{
      updateFactory(factoryInputData : {
        factoryId: "60edf21afe5d80842c2052e3"
        factoryName: "saptasatij-2.0"
      }){
        _id
        userId
        factoryName
      }
    }
    ''';
  }

  @override
  String updateMachine({
    required String machineId,
    required String machineName,
    required String currentPart1,
    required machineStateEnum state,
    required String previousTimeStroke,
    required int reasonCode,
    required int currentOperation1,
    String? currentPart2,
    int? currentOperation2,
    required bool parallelState,
  }) {
    String? nullVariable(dynamic variableName) {
      return variableName == null ? null : '"$variableName"';
    }

    return ''' 
    mutation updateMachine{
      updateMachineWithId(machineInput: {
        machineName: "$machineName"
        _id: "$machineId"
        currentPart_1: "$currentPart1"
        currentPart_2:  ${nullVariable(currentPart2)}
        currentOperation_1: $currentOperation1
        currentOperation_2: ${nullVariable(currentOperation2)}
        reasonCode: $reasonCode
        state: "${returnStringFromEnum(state)}"
        previousTimeStroke: "$previousTimeStroke"
        parallelState: $parallelState
      }) {
        _id
        factoryId
        machineName
        state
        currentPart_1
        currentPart_2
        currentOperation_1
        currentOperation_2
        reasonCode
        previousTimeStroke
      }
    }
    ''';
  }

  @override
  String user() {
    return ''' 
    query user {
      user {
        _id
        email
        name
        role
        factoryId
      }
    }
    ''';
  }

  @override
  String countSubscription(String date, String machineId) {
    return ''' 
  subscription countSubscription {
    streamCount(date: "$date", machineId: "$machineId") {
      id
      message {
        _id
        machineId
        date
        count
        standbyCount
        productionCount
        idleCount
        productionTime
        idleTime
        standbyTime
        hourlyCount {
          timeRange
          standbyCount
          productionCount
          idleCount
        }
      }
    }
  }
  ''';
  }

  @override
  String machineSubscription(String machineId) {
    return ''' 
    subscription machineSubscription {
      streamMachine(machineId: "$machineId") {
        id
        message {
          _id
          factoryId
          machineName
          parallelState
          currentPart_1
          currentPart_2
          currentOperation_1
          currentOperation_2
          reasonCode
          previousTimeStroke
          state
        }
      }
    }
    ''';
  }

  @override
  String part(String partNumber) {
    return ''' 
    query part{
      part(partInput : { partNumber : "$partNumber" }) {
        _id
        factoryId
        companyName
        partName
        partNumber
        noOfOperations
        stock {
          _id
          stock
          operationNumber
        }
      }
    }
    ''';
  }

  @override
  String machine(String machineId) {
    return '''
    query machineWithId {
      machineWithId(machineId: "$machineId"){
        _id
        factoryId
        machineName
        parallelState
        currentPart_1
        currentPart_2
        currentOperation_1
        currentOperation_2
        reasonCode
        state
        previousTimeStroke
      }
    }
    ''';
  }

  @override
  String allFactoryUsers(String factoryId) {
    return ''' 
    query AllUsers {
      allUsers(factoryId: "$factoryId") {
        _id
        email
        name
        factoryId
        role
      }
    }
    ''';
  }

  @override
  String updateUser(String name, String role) {
    return ''' 
    mutation UpdateUser {
      updateUser(userInputData: {
        name: "$name"
        role: "$role"
      }) {
        _id
        email
        name
        factoryId
        role
      }
    }
    ''';
  }

  @override
  String createNewUser(
    String name,
    String email,
    String password,
    String userRoleString,
    String factoryId,
  ) {
    return ''' 
    mutation CreateUser {
      createUser(userInputData: { 
        email: "$email", 
        name: "$name", 
        password: "$password",
        factoryId: "$factoryId",
        role: "$userRoleString"
      })
    }
    ''';
  }
}
