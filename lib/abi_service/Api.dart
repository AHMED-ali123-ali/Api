import 'package:api_applications/Model/category_list.dart';
import 'package:dio/dio.dart';

class Api {

Dio x = Dio();

getNews()async{

  var response = await x.get('https://newsapi.org/v2/everything?q=Apple&from=2025-09-21&sortBy=popularity&apiKey=API_KEY'
  );
  var jason = response.data;
  List<Article> newarticles =[];

  for(var item in jason['articles']){
    newarticles.add(
      Article(id: item['id'], author: item['author'], title: item['title'], description: item['description'], urlToImage: item['urlToImage'])
    );

  }
  return newarticles;


}











}