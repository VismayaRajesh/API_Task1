import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../productBloc/product_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          return ListView.builder(itemCount : state.plist.length ,itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(image: NetworkImage("${state.plist[index].image}"),
                      height: 250,
                      width: 400,
                      fit: BoxFit.fill,),
                  ),
                  Positioned(
                      bottom: 100,
                      left: 20,
                      child: Text("${state.plist[index].title}", style: TextStyle(color: Colors.grey),)),
                  Positioned(

                    child: Container(
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow,),
                          Text("${state.plist[index].rating?.rate}")
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            );
          },);
        },
      ),
    );
  }
}

