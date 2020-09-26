import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:production_automation_web/models/factory.dart';
import 'package:production_automation_web/models/part.dart';
import 'package:production_automation_web/providers/database.dart';
import 'package:production_automation_web/services/api_path.dart';
import 'package:production_automation_web/widgets/Cards/part_card.dart';
import 'package:production_automation_web/widgets/bar/stock_bar.dart';
import 'package:production_automation_web/widgets/listTile/partTile.dart';
import 'package:production_automation_web/widgets/listTile/selectedPart.dart';
import 'package:production_automation_web/widgets/text_field/custom_text_field.dart';
import 'package:provider/provider.dart';
import 'package:search_widget/search_widget.dart';

class StockTabBody extends StatefulWidget {
  final FactoryModel factoryModel;
  StockTabBody({this.factoryModel});

  @override
  _StockTabBodyState createState() => _StockTabBodyState();
}

class _StockTabBodyState extends State<StockTabBody> {
  final FirebaseFirestore _instance = FirebaseFirestore.instance;
  Part _selectedPart;

  Widget _rowItem({List<Widget> children}) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: children,
      );

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          color: Colors.grey[400],
          width: 1 / 3 * MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: StreamBuilder<QuerySnapshot>(
                  stream: _instance
                      .collection(ApiPath.parts(key: widget.factoryModel.key))
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.active) {
                      if (snapshot.hasData) {
                        QuerySnapshot data = snapshot.data;
                        return Stack(
                          children: [
                            ListView.builder(
                              itemCount: data.docs.length,
                              itemBuilder: (context, index) => PartCard(
                                factoryModel: widget.factoryModel,
                                part: database.returnPartFromDocument(
                                    snapshot: snapshot.data.docs[index]),
                                handler: () => setState(() => _selectedPart =
                                    database.returnPartFromDocument(
                                        snapshot: snapshot.data.docs[index])),
                              ),
                            ),
                            Positioned(
                              top: 10,
                              child: SearchWidget<Part>(
                                dataList: data.docs
                                    .map((doc) => database
                                        .returnPartFromDocument(snapshot: doc))
                                    .toList(),
                                popupListItemBuilder: (part) =>
                                    PartTile(part: part),
                                hideSearchBoxWhenItemSelected: false,
                                onItemSelected: (item) =>
                                    setState(() => _selectedPart = item),
                                textFieldBuilder: (controller, focusNode) =>
                                    Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width: 1 /
                                        3.2 *
                                        MediaQuery.of(context).size.width,
                                    child: CustomTextField(
                                      controller: controller,
                                      focusNode: focusNode,
                                      hintText: "Search by part number..",
                                      enabled: true,
                                      onEditingComplete: () => setState(() {}),
                                    ),
                                  ),
                                ),
                                selectedItemBuilder:
                                    (selectedPart, currentlyWorking) =>
                                        SelectedPartWidget(
                                            selectedPart, currentlyWorking),
                                queryBuilder: (query, list) => data.docs
                                    .map((doc) => database
                                        .returnPartFromDocument(snapshot: doc))
                                    .toList()
                                    .where((part) => part.partNumber
                                        .toLowerCase()
                                        .contains(query.toLowerCase()))
                                    .toList(),
                              ),
                            )
                          ],
                        );
                      }
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else
                      return Center(child: Text("Check connection"));
                    return null;
                  }),
            ),
          ),
        ),
        Container(
          width: 2 / 3 * MediaQuery.of(context).size.width,
          child: Center(
              child: _selectedPart != null
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          _rowItem(children: [
                            Text("Part Number"),
                            Text(_selectedPart.partNumber)
                          ]),
                          SizedBox(
                              height: 0.1 * MediaQuery.of(context).size.height),
                          _rowItem(children: [
                            Text("No Of Operations"),
                            Text(_selectedPart.noOfOperations)
                          ]),
                          SizedBox(
                              height: 0.1 * MediaQuery.of(context).size.height),
                          _rowItem(children: [
                            Text("Comapnay Name"),
                            Text(_selectedPart.companyName)
                          ]),
                          SizedBox(
                              height: 0.1 * MediaQuery.of(context).size.height),
                          _rowItem(children: [
                            Text("Part Name"),
                            Text(_selectedPart.partName)
                          ]),
                          SizedBox(
                              height: 0.1 * MediaQuery.of(context).size.height),
                          SizedBox(
                            height: 100,
                            child: StockBar(
                              factoryModel: widget.factoryModel,
                              part: _selectedPart,
                            ),
                          )
                        ],
                      ),
                    )
                  : Text("Select a Part")),
        )
      ],
    );
  }
}
