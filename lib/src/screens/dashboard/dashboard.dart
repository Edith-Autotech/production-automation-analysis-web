import 'package:flutter/material.dart';
import 'package:production_automation_web/config/grapqhql_database.dart';
import 'package:production_automation_web/constants.dart';
import 'package:production_automation_web/responsive.dart';
import 'package:production_automation_web/src/models/count_model.dart';
import 'package:production_automation_web/src/models/machine.dart';
import 'package:production_automation_web/src/widgets/loading_spinner/loading_spinner.dart';
import 'package:provider/provider.dart';

import 'components/archives/header.dart';
import 'components/archives/my_fields.dart';
import 'components/archives/recent_files.dart';
import 'components/archives/storage_details.dart';

class DashboardArgs {
  final String token;
  final Machine machine;

  DashboardArgs(this.token, this.machine);
}

class Dashboard extends StatefulWidget {
  const Dashboard({
    Key? key,
    required this.token,
    required this.machine,
  }) : super(key: key);

  final String token;
  final Machine machine;

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late CountModel _todaysCount;
  final String date = '2021-07-23';
  bool _isLoading = false;
  // final String todaysDate = DateTime.now().toString();

  void updateLoading(bool isLoading) {
    setState(() {
      _isLoading = isLoading;
    });
  }

  @override
  void initState() {
    super.initState();
    fetch();
  }

  Future<void> fetch() async {
    // fetch today's date and then fetch today's count
    updateLoading(true);
    try {
      final ApiDatabase database = Provider.of<ApiDatabase>(context, listen: false);
      CountModel todaysCount = await database.dailyCount(widget.token, date, widget.machine.id);
      updateLoading(false);
      _todaysCount = todaysCount;
      print(_todaysCount);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    // print(widget.token);
    // print(widget.machine);
    return SafeArea(
      child: _isLoading
          ? loadingSpinner(context)
          : SingleChildScrollView(
              padding: const EdgeInsets.all(Constants.defaultPadding),
              child: Column(
                children: [
                  const Header(),
                  const SizedBox(height: Constants.defaultPadding),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Column(
                          children: [
                            const MyFiles(),
                            const SizedBox(height: Constants.defaultPadding),
                            const RecentFiles(),
                            if (Responsive.isMobile(context)) const SizedBox(height: Constants.defaultPadding),
                            if (Responsive.isMobile(context)) const StarageDetails(),
                          ],
                        ),
                      ),
                      if (!Responsive.isMobile(context)) const SizedBox(width: Constants.defaultPadding),
                      // On Mobile means if the screen is less than 850 we dont want to show it
                      if (!Responsive.isMobile(context))
                        const Expanded(
                          flex: 2,
                          child: StarageDetails(),
                        ),
                    ],
                  )
                ],
              ),
            ),
    );
  }
}
