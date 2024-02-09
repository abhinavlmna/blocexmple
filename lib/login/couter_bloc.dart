import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../Products.dart';
import '../apiservice.dart';

part 'couter_event.dart';
part 'couter_state.dart';

class CouterBloc extends Bloc<Fetch, CouterState> {
  CouterBloc() : super(CouterInitial(prlist: [])) {
    Apiservice api=Apiservice();
    on<Fetch>((event,emit) async {
      var p=await api.fetchdata();
      emit(CouterState(prlist:p));
    });
  }
}
