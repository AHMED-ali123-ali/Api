
import 'package:api_applications/Model/category_list.dart';

abstract class AppState{}

class InitialState extends AppState {}
class loadingState extends AppState {}
class SuccessState  extends AppState  {
  final  List<ProductCard> product;
  SuccessState({required this.product});
}
class ErrorState extends AppState {
  final String message;

  ErrorState({required this.message});

}