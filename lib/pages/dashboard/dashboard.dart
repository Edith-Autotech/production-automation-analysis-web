import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/helper/responsive.dart';

import '/constants/controllers.dart';
import '/constants/style.dart';

import '../base_page_layout.dart';

import '/pages/dashboard/widgets/machine_data/machine_data_section.dart';
import '/pages/dashboard/widgets/charts/count_charts.dart';
import '/pages/dashboard/widgets/header/header.dart';
import '/pages/dashboard/widgets/charts/hourly_count_charts.dart';

import 'widgets/state_cards/state_cards_large_screen.dart';
import 'widgets/state_cards/state_cards_small_screen.dart';

import '/widgets/loading_spinner.dart';
import '/widgets/custom_text.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
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
          return loadingSpinner();
        }
        return ListView(
          children: [
            const Header(),
            SizedBox(height: defaultPadding),
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
                      if (ResponsiveWidget.isSmallScreen(context))
                        const SizedBox(
                          height: 10,
                        ),
                      SizedBox(height: defaultPadding),
                      const CustomText(
                        text: "Hourly Count",
                        weight: FontWeight.bold,
                        size: 20,
                      ),
                      SizedBox(height: defaultPadding),
                      const HourlyCountCharts(),
                      SizedBox(height: defaultPadding),
                      if (ResponsiveWidget.isSmallScreen(context))
                        const SizedBox(
                          height: 200,
                          child: Center(
                            child: MachineDataSection(),
                          ),
                        ),
                      SizedBox(height: defaultPadding),
                      if (ResponsiveWidget.isSmallScreen(context))
                        const Center(
                          child: CountChart(),
                        ),
                      SizedBox(height: defaultPadding),
                    ],
                  ),
                ),
                if (!ResponsiveWidget.isSmallScreen(context)) SizedBox(width: defaultPadding),
                if (!ResponsiveWidget.isSmallScreen(context))
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        const CountChart(),
                        SizedBox(height: defaultPadding),
                        const SizedBox(
                          height: 200,
                          child: Center(
                            child: MachineDataSection(),
                          ),
                        )
                      ],
                    ),
                  )
              ],
            ),
          ],
        );
      }),
    );
  }
}
