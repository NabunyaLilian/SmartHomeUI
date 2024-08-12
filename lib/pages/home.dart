import 'package:flutter/material.dart';
import 'package:smart_home/entities/smart_device.dart';
import 'package:smart_home/pages/widgets/smart_device_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// List of smart devices
  List<SmartDevice> smartDevices = [
    const SmartDevice(
        name: "Smart \nLight", imagePath: "assets/images/light.png"),
    const SmartDevice(
        name: "Smart \nAC", imagePath: "assets/images/air-conditioner.png"),
    const SmartDevice(
        name: "Smart \nTV", imagePath: "assets/images/smart-tv.png"),
    const SmartDevice(name: "Smart Fan", imagePath: "assets/images/fan.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Image.asset('assets/images/more.png'),
        ),
        backgroundColor: Colors.grey[100],
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Image.asset(
              'assets/images/account.png',
              color: Colors.black87,
              width: 45,
              height: 45,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),

            /// Welcome section
            SizedBox(
              width: double.infinity,
              height: 180,
              child: Stack(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 22.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome Home',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'Charlotte Reynolds',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: -20,
                    child: Image.asset(
                      'assets/images/home.png',
                      height: 200,
                      width: 250,
                    ),
                  )
                ],
              ),
            ),

            /// Headline
            const Padding(
              padding: EdgeInsets.only(left: 22.0, bottom: 10, top: 20),
              child: Text(
                'Smart Devices',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),

            ///grid view - smart devices
            Expanded(
                child: GridView.builder(
                    itemCount: smartDevices.length,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 22.0, vertical: 10),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1 / 1.1,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20),
                    itemBuilder: (context, index) {
                      return SmartDeviceContainer(
                        smartDevices: smartDevices,
                        index: index,
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
