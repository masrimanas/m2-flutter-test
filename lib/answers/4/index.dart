// 4. Which state management you used on daily basis? Why? Please provide
// some code on how you use it.

//
// answer: I chose Bloc for my apps' state manager. It is a popular package
// for its quality in developing a scalable and maintainable flutter app. It is
// in top 3 most popular flutter state manager package and has big community,
// because I'm still in the process of learning, if I face some errors related to
// it I will find so many references by googling it.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// bloc start
abstract class DemoEvent {}

class DemoEventSwitch extends DemoEvent {
  final int index;
  final bool status;

  DemoEventSwitch(
    this.index,
    this.status,
  );
}

class DemoBloc extends Bloc<DemoEvent, List<bool>> {
  DemoBloc() : super(List<bool>.generate(20, (int index) => false)) {
    on<DemoEventSwitch>((event, emit) {
      List<bool> newState = List<bool>.generate(20, (int index) => false);
      newState[event.index] = event.status;
      emit(newState);
    });
  }
}
// bloc end

class DemoWidget extends StatelessWidget {
  const DemoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // We must use BlocProvider widget to get the access to use our bloc.
    return BlocProvider(
      create: (context) => DemoBloc(),
      child: Column(
        children: [
          Builder(builder: (context) {
            // This variable is used to watch the state, if any changes happen
            // in the the state, Flutter will rebuild 'Text' widget
            final state = context.select((DemoBloc bloc) => bloc.state);
            return Text(state[1].toString());
          }),
          TextButton(
            onPressed: () {
              // ReadContext is used to call event of our bloc
              context.read<DemoBloc>().add(DemoEventSwitch(1, true));
            },
            child: const Text('switch it'),
          ),
        ],
      ),
    );
  }
}
