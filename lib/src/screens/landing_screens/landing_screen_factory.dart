// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '/src/models/factory.dart';

// import '/config/grapqhql_database.dart';

// import '/src/screens/factory/components/factory_card.dart';

// import '/src/widgets/app_bar/default_app_bar.dart';
// import '/src/widgets/label/label.dart';
// import '/src/widgets/loading_spinner/loading_spinner.dart';

// import '/constants.dart';

// class FactoryLandingScreen extends StatefulWidget {
//   static const String routeName = Constants.factoryLandingRoute;
//   final String? token;
//   const FactoryLandingScreen({Key? key, this.token}) : super(key: key);
//   @override
//   _FactoryLandingScreenState createState() => _FactoryLandingScreenState();
// }

// class _FactoryLandingScreenState extends State<FactoryLandingScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final ApiDatabase database = Provider.of<ApiDatabase>(context, listen: false);
//     return Scaffold(
//       appBar: defaultAppBar(context),
//       body: FutureBuilder<List<FactoryModel>>(
//           future: database.factories(widget.token!),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return snapshot.data!.isNotEmpty
//                   ? Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: ListView.builder(
//                         itemCount: snapshot.data!.length,
//                         itemBuilder: (context, index) => Padding(
//                           padding: const EdgeInsets.all(8),
//                           child: FactoryCard(
//                             token: widget.token!,
//                             factory: snapshot.data![index],
//                           ),
//                         ),
//                       ),
//                     )
//                   : Center(child: label(Constants.contactEA));
//             }
//             return loadingSpinner(context);
//           }),
//     );
//   }
// }
