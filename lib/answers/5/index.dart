// 5. What is StatelessWidget and StatefulWidget? Please provide some code
// on how you used it.

// answer: StatelessWidget is a widget with immutable states. StatefulWidget
// is a widget that has mutable state and widget lifecycle.

import 'package:flutter/material.dart';

class DemoStatelessWidget extends StatelessWidget {
  const DemoStatelessWidget({Key? key}) : super(key: key);

  final String _title = 'Demo Stateless Widget'; // an immutable state

  @override
  Widget build(BuildContext context) {
    return Text(_title);
  }
}

class DemoStatefulWidget extends StatefulWidget {
  const DemoStatefulWidget({Key? key}) : super(key: key);

  @override
  State<DemoStatefulWidget> createState() => _DemoStatefulWidgetState();
}

class _DemoStatefulWidgetState extends State<DemoStatefulWidget> {
  String _title = 'Demo Stateless Widget'; // a mutable state in state class

  // in state class, we can access its lifecycle
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(_title),
      TextButton(
        onPressed: () {
          // We can change the state using this 'setState' method.
          setState(() {
            _title = 'Demo Stateless Widget';
          });
        },
        child: const Text('change state'),
      ),
    ]);
  }
}
