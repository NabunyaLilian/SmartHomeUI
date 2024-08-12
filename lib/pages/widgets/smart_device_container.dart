import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/entities/smart_device.dart';

class SmartDeviceContainer extends StatefulWidget {
  const SmartDeviceContainer(
      {super.key, required this.smartDevices, required this.index});

  final List<SmartDevice> smartDevices;
  final int index;

  @override
  State<SmartDeviceContainer> createState() => _SmartDeviceContainerState();
}

class _SmartDeviceContainerState extends State<SmartDeviceContainer> {
  List<SmartDevice>? smartDevices;
  int? index;
  bool isOn = false;

  @override
  void initState() {
    smartDevices = widget.smartDevices;
    index = widget.index;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: isOn ? Colors.black87 : Colors.grey[300],
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          ///image
          Image.asset(
            smartDevices != null || index != null
                ? smartDevices![index!].imagePath
                : 'assets/images/light.png',
            width: 50,
            color: isOn ? Colors.white : Colors.black87,
          ),
          const Spacer(),

          ///smart device name and switch
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  smartDevices != null || index != null
                      ? smartDevices![index!].name
                      : 'Smart Light',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isOn ? Colors.white : Colors.black87,
                  ),
                ),
                Transform.rotate(
                  angle: -pi / 2,
                  child: CupertinoSwitch(
                      thumbColor: isOn ? Colors.black : Colors.grey.shade200,
                      activeColor: isOn ? Colors.white : Colors.grey.shade400,
                      value: isOn,
                      onChanged: (bool val) {
                        setState(() {
                          isOn = !isOn;
                        });
                      }),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
