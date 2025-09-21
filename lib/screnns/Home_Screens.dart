import 'package:api_applications/Model/category_list.dart';
import 'package:api_applications/abi_service/Api.dart';
import 'package:flutter/material.dart';
class HomeScreens extends StatefulWidget {
  const HomeScreens({super.key});

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  Api b = Api();
  List<Article>? n;

  @override
  void initState() {
    get();
    // TODO: implement initState
    super.initState();
  }

  get()async{
    n = await b.getNews();
    setState(() {

    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.green,
        title: Text('API',style: TextStyle(fontSize: 20,color: Colors.white),),
        centerTitle: true,
      ),
      body:  n == null
          ? Center(child: CircularProgressIndicator()):
      ListView.builder(
        itemCount: n!.length,
        itemBuilder: (context, index) {
          var article = n![index];
          return Card(
            margin: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                article.urlToImage != null
                    ? Image.network(article.urlToImage!, height: 150, fit: BoxFit.cover)
                    : Placeholder(fallbackHeight: 150),
                SizedBox(height: 8),
                Text(article.title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text(article.author ?? "Unknown Author", style: TextStyle(color: Colors.grey)),
                SizedBox(height: 8),
              ],
            ),
          );
        },
      )
    );
  }
}
