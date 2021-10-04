import 'package:flutter/cupertino.dart';

class InfiniteProvider extends ChangeNotifier {
  List<int> cache = [];

  // 로딩
  bool loading = false;

  // 아이템이 더 있는지
  bool hasMore = true;

  _makeRequest({
    @required int nextId
}) async{
    assert(nextId != null);

    await Future.delayed(Duration(seconds: 1));

    //Item은 99까지 있다.
    if(nextId == 100){
      return [];
    }

    return List.generate(20, (index) {

      return nextId + index;});
  }

  fetchItems({
    int nextId
  }) async{
    loading = true;
    notifyListeners();

    final items = await _makeRequest(nextId: nextId ?? 0);

    this.cache = [
      ...this.cache,
      ...items
    ];

    if(items.length == 0){
      hasMore = false;
    }

    loading = false;

    notifyListeners();
  }

}