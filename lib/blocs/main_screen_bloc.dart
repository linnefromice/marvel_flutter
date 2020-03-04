import 'dart:async';

class MainScreenBloc {
  final _selectPhaseController = StreamController<int>();
  Sink<int> get select => _selectPhaseController.sink;
  Stream<int> get getSelected => _selectPhaseController.stream;

  MainScreenBloc() {
    select.add(0);
  }

  void dispose() {
    _selectPhaseController.close();
  }
}