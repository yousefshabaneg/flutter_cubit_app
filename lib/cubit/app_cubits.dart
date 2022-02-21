import 'package:bloc/bloc.dart';
import 'package:flutter_cubit_appp/cubit/app_cubit_states.dart';
import 'package:flutter_cubit_appp/models/data_model.dart';
import 'package:flutter_cubit_appp/services/data_services.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }
  final DataServices data;
  late final places;
  void getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places));
    } catch (e) {
      print("Get Data Error $e");
    }
  }

  detailPage(DataModel dataModel) {
    emit(DetailState(dataModel));
  }

  goHome() {
    emit(LoadedState(places));
  }
}
