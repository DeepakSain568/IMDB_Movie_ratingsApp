// import 'package:dart/MVVM/data/response/api_response.dart';
import 'package:http_amdb/MVVM/data/response/status.dart';
import 'package:http_amdb/MVVM/utils/routes/routes_names.dart';
import 'package:http_amdb/MVVM/view_model/home_viewmodel.dart';
import 'package:http_amdb/MVVM/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import '../utils/services/splash_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final preferences = Provider.of<UserViewModel>(context);
    final Data = Provider.of<MoviesData>(context);
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('HomeScreen')),
          automaticallyImplyLeading: false,
          surfaceTintColor: Colors.amber,
          actions: [
            InkWell(
                onTap: () {
                  preferences.remove().then((value) =>
                      Navigator.pushNamed(context, RoutesName.Login));
                },
                child: Icon(Icons.logout)),
            SizedBox(
              width: 20,
            ),
            InkWell(
              onTap: () {
                Data.moviesdata();
              },
              child: Center(child: Text('Api Hit')),
            )
          ],
        ),
        body: Consumer<MoviesData>(
          builder: (context, value, child) {
            switch (value.moviesList.status) {
              case Status.LOADING:
                return Center(child: CircularProgressIndicator());
              case Status.COMPLETED:
                return ListView.separated(
                    itemBuilder: (context, index) {
                     
                      return ListTile(
                          leading: Image.network(
                                value.moviesList.data![index].image!,
                                  errorBuilder:(context, error, stackTrace) {
                                    return Icon(Icons.error);
                                  },),
                              title: Text(value.moviesList.data![index].title!),
                              subtitle: Text(value.moviesList.data![index].year!.toString()),
                              trailing: 
                                  Row(mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(value.moviesList.data![index].rating!),
                                      Icon(Icons.star_border_outlined)
                                    ],
                                  ),
                                    );
                    },
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: value.moviesList.data!.length);
              case Status.ERROR:
                return Text(value.moviesList.message.toString());
              default:
                return Center(
                    child: ElevatedButton(
                        onPressed: () {
                          value.moviesdata();
                        },
                        child: Text('Hit Api')));
            }
          },
        ));
  }
}
  



















// FutureBuilder(
//           future: Data.moviesdata(context),
//           builder: (context, snapshot) {
//             if (!snapshot.hasData) {
//               return Center(child: CircularProgressIndicator());
//             } else {
//               return ListView.separated(
//                   itemBuilder: (context, index) {
//                     return Card(
//                       semanticContainer: false,
//                      child: Image(height:100,width: 100,image:NetworkImage(Data.DATA[index].thumbnail!)
//                      ));
//                   },
//                   separatorBuilder: (context, index) => Divider(),
//                   itemCount: Data.DATA.length);
//             }
//           },
//         )