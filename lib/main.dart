import 'package:blocexmple/Products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login/couter_bloc.dart';
import 'login/loginnn_bloc.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<CouterBloc>(
        create: (BuildContext context) => CouterBloc()..add(Fetch()),
      ),
    ],
    child: Myapp(),
  ));
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CouterBloc, CouterState>(
        builder: (context, state) {
          return state.prlist!.length == 0
              ? Text('No data')
              : ListView.builder(
                  itemCount: state.prlist!.length,
                  itemBuilder: (BuildContext context, int index) {
                    Products p = state.prlist![index];
                    return ListTile(
                      title: Text('${p.title}'),
                      subtitle: Text('${p.category}'),
                      leading: CircleAvatar(backgroundImage: NetworkImage('${p.images}'),),
                      trailing: Text('${p.price}'),
                    );
                  },
                );
        },
      ),
    );
  }
}
