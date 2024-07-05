 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthy_app/features/meal/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:healthy_app/features/meal/presentation/bloc/article/remote/remote_article_state.dart';

class Articles extends StatelessWidget {
  const Articles({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:appBar(),
      body:body()

    );
  }

  AppBar appBar(){
    return AppBar(
      title: Text('news'),
    );
  }

  Widget body(){
    return BlocBuilder<RemoteArticleBloc,RemoteArticleState> (
      builder: (_,state){
        if (state is RemoteArticlesLoading){
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is RemoteArticlesError){
          return const Center(child: Icon(Icons.refresh));
        }
        if (state is RemoteArticlesDone){
          return ListView.builder(
            itemCount: state.articles!.length,
            itemBuilder: (context,index){
              return ListTile(
                title: Text('$index'),
              );
            }
            );
        }

        return const SizedBox();
      },
    );
  }
}