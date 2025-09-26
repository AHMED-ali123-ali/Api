import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Model/category_list.dart';
import '../manger/app-cupit.dart';
import '../manger/app_state.dart';
import '../network/Api.dart';
import '../widgets/proudect_item.dart';
class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  abi x= abi();
  List<ProductCard>? v;
  @override
  void initState() {
   get();
    super.initState();
  }

  get()async{
    v =await x.getNow();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
        create: (_) => Appcupit()..run(),
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.green,
              title: Text('Application of products'),
              centerTitle: true,
            ),
            body: BlocBuilder<Appcupit, AppState>(
                builder: (context, state) {
                  if (state is loadingState) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is SuccessState) {
                    return ListView.builder(
                      itemCount: state.product.length,
                      itemBuilder: (context, index) {
                        return ProductItem(product: state.product[index]);
                      },
                    );
                  } else if (state is ErrorState) {
                    return Center(child: Text(state.message));
                  }
                  return Container(); // InitialState


  })));
}}
