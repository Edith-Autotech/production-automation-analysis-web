import 'package:flutter/material.dart';
import 'package:production_automation_web/src/models/factory.dart';
import 'package:production_automation_web/src/models/user.dart';

class StockTabBody extends StatefulWidget {
  final UserModel user;
  final FactoryModel factoryModel;
  const StockTabBody({Key? key, required this.user, required this.factoryModel}) : super(key: key);

  @override
  _StockTabBodyState createState() => _StockTabBodyState();
}

class _StockTabBodyState extends State<StockTabBody> {
  // final FirebaseFirestore _instance = FirebaseFirestore.instance;
  // late Part _selectedPart;

  // Widget _rowItem({required List<Widget> children}) => Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //       children: children,
  //     );

  // List<QueryDocumentSnapshot> returnParts({required QuerySnapshot snapshot}) {
  //   print(widget.user.comapanyName);
  //   if (widget.user.admin) {
  //     return snapshot.docs;
  //   } else {
  //     return snapshot.docs
  //         .where((element) =>
  //             element.data()['company_name'] == widget.user.comapanyName)
  //         .toList();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // final database = Provider.of<Database>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          color: Colors.grey[400],
          width: 1 / 3 * MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Container(),
              // StreamBuilder<List<Part>>(
              //     stream: database.getParts(model: widget.factoryModel),
              //     builder: (context, snapshot) {
              //       if (snapshot.connectionState == ConnectionState.active) {
              //         if (snapshot.hasData) {
              //           List<Part> data = snapshot.data;
              //           return Stack(
              //             children: [
              //               ListView.builder(
              //                 itemCount: data.length,
              //                 itemBuilder: (context, index) => PartCard(
              //                   factoryModel: widget.factoryModel,
              //                   part: data[index],
              //                   handler: () =>
              //                       setState(() => _selectedPart = data[index]),
              //                 ),
              //               ),
              //               Positioned(
              //                 top: 2.5,
              //                 child: Container(
              //                   color: Colors.black.withOpacity(1.0),
              //                   child: SearchWidget<Part>(
              //                     dataList: data,
              //                     popupListItemBuilder: (part) =>
              //                         PartTile(part: part),
              //                     hideSearchBoxWhenItemSelected: false,
              //                     onItemSelected: (item) =>
              //                         setState(() => _selectedPart = item),
              //                     textFieldBuilder: (controller, focusNode) =>
              //                         Padding(
              //                       padding: const EdgeInsets.all(8.0),
              //                       child: SizedBox(
              //                         width: 1 /
              //                             3.2 *
              //                             MediaQuery.of(context).size.width,
              //                         child: CustomTextField(
              //                           controller: controller,
              //                           focusNode: focusNode,
              //                           hintText: "Search by part number..",
              //                           enabled: true,
              //                           onEditingComplete: () =>
              //                               setState(() {}),
              //                         ),
              //                       ),
              //                     ),
              //                     selectedItemBuilder:
              //                         (selectedPart, currentlyWorking) =>
              //                             SelectedPartWidget(
              //                       selectedPart,
              //                       () => setState(
              //                         () => _selectedPart = selectedPart,
              //                       ),
              //                     ),
              //                     queryBuilder: (query, list) => data
              //                         .where((part) => part.partNumber
              //                             .toLowerCase()
              //                             .contains(query.toLowerCase()))
              //                         .toList(),
              //                   ),
              //                 ),
              //               )
              //             ],
              //           );
              //         }
              //       } else if (snapshot.connectionState ==
              //           ConnectionState.waiting) {
              //         return Center(child: CircularProgressIndicator());
              //       } else {
              //         return Center(child: Text("Check connection"));
              //       }
              //       return null;
              //     }),
            ),
          ),
        ),
        // Container(
        //   width: 2 / 3 * MediaQuery.of(context).size.width,
        //   child: Center(
        //       child: _selectedPart != null
        //           ? Padding(
        //               padding: const EdgeInsets.all(8.0),
        //               child: Column(
        //                 mainAxisAlignment: MainAxisAlignment.start,
        //                 children: [
        //                   _rowItem(children: [Text("Part Number"), Text(_selectedPart.partNumber)]),
        //                   SizedBox(height: 0.1 * MediaQuery.of(context).size.height),
        //                   _rowItem(children: [Text("No Of Operations"), Text(_selectedPart.noOfOperations)]),
        //                   SizedBox(height: 0.1 * MediaQuery.of(context).size.height),
        //                   _rowItem(children: [Text("Comapnay Name"), Text(_selectedPart.companyName)]),
        //                   SizedBox(height: 0.1 * MediaQuery.of(context).size.height),
        //                   _rowItem(children: [Text("Part Name"), Text(_selectedPart.partName)]),
        //                   SizedBox(height: 0.1 * MediaQuery.of(context).size.height),
        //                   SizedBox(
        //                     height: 100,
        //                     child: StockBar(
        //                       factoryModel: widget.factoryModel,
        //                       part: _selectedPart,
        //                     ),
        //                   )
        //                 ],
        //               ),
        //             )
        //           : Text("Select a Part")),
        // )
      ],
    );
  }
}
