// Number 7
import 'dart:developer';

import 'package:answers_app/answers/4/index.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late FirebaseMessaging fcm = FirebaseMessaging.instance;
  @override
  void initState() {
    super.initState();
    fcm.getToken();
    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      print('Pesan ${event.notification!.body!}');
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Notification"),
              content: Text(event.notification!.body!),
              actions: [
                TextButton(
                  child: const Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    });
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print('Message clicked!');
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: FittedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Main Page'),
              Text(
                'Welcome',
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {},
            child: const Text('Add'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 3; i++)
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      margin: const EdgeInsets.only(right: 10),
                      color: Colors.grey,
                      width: size.width * 0.25,
                      height: (size.width * 0.25) * 1.25,
                      child: Center(
                        child: Text('C${i + 1}'),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            const _ExpandedPanelMenu(),
            // const _ExpansionMenu(),
          ],
        ),
      ),
    );
  }
}

class _ExpandedPanelMenu extends StatelessWidget {
  const _ExpandedPanelMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.select((DemoBloc bloc) => bloc.state);
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 20,
      itemBuilder: ((context, index) {
        return Container(
          decoration: BoxDecoration(border: Border.all()),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
          child: ExpansionPanelList(
            animationDuration: const Duration(milliseconds: 500),
            expansionCallback: (panelIndex, isExpanded) {
              context.read<DemoBloc>().add(DemoEventSwitch(index, !isExpanded));
            },
            children: [
              ExpansionPanel(
                headerBuilder: ((context, isExpanded) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Menu ${index + 1}')),
                  );
                }),
                isExpanded: state[index],
                body: Container(
                  decoration: const BoxDecoration(
                      border: Border(
                    top: BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                  )),
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Information',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text('Name ${index + 1}'),
                              Text('Address ${index + 1}'),
                            ],
                          ),
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            log('Menu ${index + 1}');
                          },
                          child: const Text('OK'))
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
