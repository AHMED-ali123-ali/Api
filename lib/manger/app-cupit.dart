import 'package:api_applications/Model/category_list.dart';
import 'package:api_applications/manger/app_state.dart';
import 'package:api_applications/network/Api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Appcupit extends Cubit<AppState> {
  Appcupit(): super(InitialState());

  abi apiservice = abi();
  List<ProductCard> proudect = [];

  void run() async {
    emit(loadingState());
    try {
      proudect = await apiservice.getNow();
      emit(SuccessState(product: proudect));
    } catch (e) {
      emit(ErrorState(message: e.toString()));
    }
  }
}