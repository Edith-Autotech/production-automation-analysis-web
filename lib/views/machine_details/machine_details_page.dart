import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/constants/controllers.dart';
import '/constants/style.dart';
import '/helper/responsive.dart';
import '/widgets/custom_text.dart';
import '/widgets/loading_spinner.dart';
import '../base_page_layout.dart';
import 'widgets/charts/count_charts.dart';
import 'widgets/charts/hourly_count_charts.dart';
import 'widgets/header/header.dart';
import 'widgets/machine_data/machine_data_section.dart';
import 'widgets/state_cards/state_cards_large_screen.dart';
import 'widgets/state_cards/state_cards_small_screen.dart';

class MachineDetailsPage extends StatefulWidget {
  const MachineDetailsPage({Key? key}) : super(key: key);

  @override
  State<MachineDetailsPage> createState() => _MachineDetailsPageState();
}

class _MachineDetailsPageState extends State<MachineDetailsPage> {
  @override
  void initState() {
    super.initState();
    countController.fetchCount();
  }

  @override
  Widget build(BuildContext context) {
    return BasePageLayout(
      child: Obx(() {
        if (countController.isLoading.value) {
          return const LoadingSpinner();
        }
        return ListView(
          children: [
            const MachineDetailsHeader(),
            const SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (ResponsiveWidget.isLargeScreen(context) || ResponsiveWidget.isMediumScreen(context))
                        const StateCardsLargeScreen()
                      else
                        const StateCardsSmallScreen(),
                      const SizedBox(height: defaultPadding),
                      if (ResponsiveWidget.isSmallScreen(context))
                        const SizedBox(
                          height: 10,
                        ),
                      const SizedBox(height: defaultPadding),
                      const CustomText(
                        "Hourly Count",
                        weight: FontWeight.bold,
                        size: 20,
                      ),
                      const SizedBox(height: defaultPadding),
                      const HourlyCountCharts(),
                      const SizedBox(height: defaultPadding),
                      if (ResponsiveWidget.isSmallScreen(context))
                        const SizedBox(
                          height: 200,
                          child: Center(
                            child: MachineDataSection(),
                          ),
                        ),
                      const SizedBox(height: defaultPadding),
                      if (ResponsiveWidget.isSmallScreen(context))
                        const Center(
                          child: CountChart(),
                        ),
                      const SizedBox(height: defaultPadding),
                    ],
                  ),
                ),
                // if (!ResponsiveWidget.isSmallScreen(context)) const SizedBox(width: defaultPadding),
                // if (!ResponsiveWidget.isSmallScreen(context))
                //   Expanded(
                //     flex: 2,
                //     child: Column(
                //       children: const [
                //         CountChart(),
                //         SizedBox(height: defaultPadding),
                //         SizedBox(
                //           height: 200,
                //           child: Center(
                //             child: MachineDataSection(),
                //           ),
                //         )
                //       ],
                //     ),
                //   )
              ],
            ),
          ],
        );
      }),
    );
  }
}
