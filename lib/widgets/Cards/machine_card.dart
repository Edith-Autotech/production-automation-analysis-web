import 'package:flutter/material.dart';
import 'package:production_automation_web/models/factory.dart';
import 'package:production_automation_web/models/machine.dart';
import 'package:production_automation_web/screens/machine_screen.dart';


class MachineCard extends StatefulWidget {
  final Machine machine;
  final FactoryModel factory;
  MachineCard({this.machine, this.factory});

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
    if (widget.machine.parallelState == 'true')
      setState(() {
        _parallelState = true;
      });
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
          color: widget.machine.previousState == 'standby'
              ? Colors.red[400]
              : Colors.white,
          elevation: 8,
          child: Container(
            height: 250,
            width: 250,
            child: Stack(children: [
              Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.machine.name == null
                            ? widget.machine.id
                            : widget.machine.name,
                        softWrap: true,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "${widget.machine.currentPart1}",
                        softWrap: true,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "${widget.machine.currentOperation1}",
                        softWrap: true,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      if (_parallelState)
                        Text(
                          "${widget.machine.currentPart2}",
                          softWrap: true,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      if (_parallelState)
                        Text(
                          "${widget.machine.currentOperation2}",
                          softWrap: true,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      if (_parallelState) SizedBox(height: 30),
                      Text(
                        widget.machine.previousState,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ]),
              ),
              if (_productionBolt == true)
                Positioned(
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
