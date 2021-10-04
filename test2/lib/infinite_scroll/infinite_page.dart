import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test2/provider/Infinite_provider.dart';
import 'package:provider/provider.dart';

class InfinitePage extends StatefulWidget {

  @override
  _InfinitePageState createState() => _InfinitePageState();
}

class _InfinitePageState extends State<InfinitePage> {

  @override
  initState() {
    super.initState();
    Future.microtask(() =>Provider.of<InfiniteProvider>(context, listen: false).fetchItems());
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: _renderListView()
        ),
      ),
    );
  }

  _renderListView() {
    final provider = Provider.of<InfiniteProvider>(context);

    final cache = provider.cache;

    final loading = provider.loading;

    //로딩중이면서 캐시에 아무것도 없음
    if(loading && cache.length == 0){
      return Center(
        child: CircularProgressIndicator()
      );
    }

    //로딩중이 아닌데 캐시에 아무것도 없음
    //아무것도 가져올 아이템이 없을때
    if(!loading && cache.length == 0){
      return Center(
        child: Text('아이템이 없습니다.')
      );
    }

    return ListView.builder(
        itemCount: cache.length + 1,
        itemBuilder: (context, index){
          print('넘어온 인덱스');
          print(index);
          print(cache);
          if (index < cache.length){
            return ListTile(
              title: Text(
                cache[index].toString()
              )
            );
          }

          if(!provider.loading && provider.hasMore){
            Future.microtask(() => provider.fetchItems(nextId: index));
          }

          if(provider.hasMore) {
            return Center(
              child: CircularProgressIndicator()
            );
          }else{
            return Center(
              child: Text('더 이상 아이템이 없습니다.')
            );
          }
        }
    );

  }
}
