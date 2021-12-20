import 'package:flutter/material.dart';
import 'package:production_automation_web/src/models/factory.dart';
import 'package:production_automation_web/src/models/machine.dart';
import 'package:production_automation_web/src/models/state_enum.dart';
import 'package:production_automation_web/src/screens/machine/machine_screen.dart';
import 'package:production_automation_web/src/widgets/box/sized_box.dart';
import 'package:production_automation_web/src/widgets/label/label.dart';

class MachineCard extends StatefulWidget {
  final String token;
  final Machine machine;
  final FactoryModel factory;
  const MachineCard({
    Key? key,
    required this.machine,
    required this.factory,
    required this.token,
  }) : super(key: key);

  @override
  _MachineCardState createState() => _MachineCardState();
}

class _MachineCardState extends State<MachineCard> {
  bool _productionBolt = false;
  bool _parallelState = false;
  @override
  void initState() {
    super.initState();
    initProduction();
    initParallelState();
  }

  double toDouble(String time) {
    var timeList = time.split(" ")[0].split(":");
    var hh = double.parse(timeList[0]);
    var mm = double.parse(timeList[1]);
    var ss = double.parse(timeList[2]);
    return hh + mm / 60.0 + ss / 3600;
  }

  void initParallelState() {
    if (widget.machine.parallelState) {
      setState(() {
        _parallelState = true;
      });
    }
  }

  void initProduction() {
    var currentTime = DateTime.now().toString().split(" ")[1].split(".")[0];
    var ptsDouble = toDouble(widget.machine.previousTimeStroke);
    var currentDouble = toDouble(currentTime);

    var diff = currentDouble - ptsDouble;
    if (diff < toDouble("00:10:00") && diff > 0) {
      setState(() {
        _productionBolt = true;
      });
      print(_productionBolt);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MachineScreen(
              machine: widget.machine,
              factoryModel: widget.factory,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: widget.machine.state == machineStateEnum.standby ? Colors.red[400] : Colors.white,
          elevation: 8,
          child: SizedBox(
            height: 250,
            width: 250,
            child: Stack(children: [
              Center(
                child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  label(widget.machine.name ?? widget.machine.id),
                  sizedBox(h: 30),
                  label(widget.machine.currentPart1),
                  label("${widget.machine.currentOperation1}"),
                  sizedBox(h: 30),
                  if (_parallelState) label("${widget.machine.currentPart2}"),
                  if (_parallelState) label("${widget.machine.currentOperation2}"),
                  if (_parallelState) const SizedBox(height: 30),
                  label(widget.machine.state.toString()),
                ]),
              ),
              if (_productionBolt == true)
                const Positioned(
                  top: 10,
                  right: 5,
                  child: Icon(
                    Icons.bolt,
                    color: Colors.green,
                  ),
                )
            ]),
          ),
        ),
      ),
    );
  }
}
