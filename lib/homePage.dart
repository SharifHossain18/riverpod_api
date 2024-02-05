import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_api/data_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data=ref.watch(userDataProvider);
    return Scaffold(
      appBar: AppBar(title: Text("RiverPod Api Calling"),
      centerTitle: true,
      ),
      body: data.when(
          data: (data){
            // List userData=data.map((e)=>e).toList();
            return ListView.builder(
              itemCount: data.length,
                itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    child: Card(
                      color: Colors.blue,
                      elevation: 4,
                      child: ListTile(
                        title: Text(data[index].firstName),
                        subtitle: Text(data[index].lastName),
                        trailing: CircleAvatar(
                          backgroundImage: NetworkImage(data[index].avatar),
                        ),
                      ),
                    ),
                  );
                });
          },
          error: (err,s){
            print(err.toString());
          },
          loading: (){
            CircularProgressIndicator();
          }),
    );
  }
}
