import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'loginnn_event.dart';
part 'loginnn_state.dart';

class LoginnnBloc extends Bloc<LoginnnEvent, LoginnnState> {
  LoginnnBloc() : super(LoginnnInitial(globalcounter: 0)) {
    on<LoginnnEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<AddCounterEvent>((event, emit) {
      int counter_value=state.globalcounter;
      counter_value=counter_value+1;
      print('add one');
      emit(LoginnnState(globalcounter: counter_value));
    });
    on<DeleteCounterEvent>((event, emit) {
      int counter_value=state.globalcounter;
      counter_value=counter_value-1;
      print('minus one');
      emit(LoginnnState(globalcounter: counter_value));
    });
  }
}
