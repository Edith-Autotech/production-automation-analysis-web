import 'package:flutter/material.dart';
import 'package:production_automation_web/config/grapqhql_database.dart';
import 'package:production_automation_web/src/models/factory.dart';
import 'package:production_automation_web/src/models/machine.dart';
import 'package:production_automation_web/src/widgets/loading_spinner/loading_spinner.dart';
import 'package:provider/provider.dart';

// import '../../../responsive.dart';
import 'components/machine_card_grid_view.dart';

class MachinesScreen extends StatefulWidget {
  final String token;
  const MachinesScreen({Key? key, required this.token}) : super(key: key);

  @override
  State<MachinesScreen> createState() => _MachinesScreenState();
}

class MachinesScreenArguments {
  final String token;
  MachinesScreenArguments(this.token);
}

class _MachinesScreenState extends State<MachinesScreen> {
  late FactoryModel _userFactory;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchFactory();
  }

  void updateLoading(bool loading) => setState(() => _isLoading = loading);

  Future<void> fetchFactory() async {
    updateLoading(true);
    final ApiDatabase database = Provider.of<ApiDatabase>(context, listen: false);
    FactoryModel factory = await database.factory(widget.token);
    _userFactory = factory;
    updateLoading(false);
  }

  @override
  Widget build(BuildContext context) {
    final ApiDatabase database = Provider.of<ApiDatabase>(context, listen: false);
    return Scaffold(
      body: _isLoading
          ? loadingSpinner(context)
          : Center(
              child: Column(
                children: [
                  Text(_userFactory.factoryId),
                  FutureBuilder<List<Machine>>(
                    future: database.machines(widget.token, _userFactory.factoryId),
                    builder: (ctx, snapshot) {
                      if (snapshot.data == null) {
                        return loadingSpinner(context);
                      }
                      List<Machine> data = snapshot.data!;
                      data.sort(
                        (a, b) => a.machineName.compareTo(b.machineName),
                      );
                      // print(data);
                      return MachineCardGridView(
                        data: data,
                        token: widget.token,
                      );
                    },
                  )
                ],
              ),
            ),
    );
  }
}
