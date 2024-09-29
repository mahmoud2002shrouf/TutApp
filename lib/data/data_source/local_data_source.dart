import 'package:advanced_flutter_arabic/data/network/error_handel.dart';
import 'package:advanced_flutter_arabic/data/response/response.dart';

const CACHE_HOME_KEY = "CACHE_HOME_KEY";
const CACHE_HOME_interval = 60 * 1000;
const CACHE_STORE_KEY = "CACHE_STORE_KEY";
const CACHE_STORE_interval = 60 * 1000;

abstract class LocalDataSource {
  Future<HomeResponse> home();
  Future<StoreDetailsResponse> getStoreDetails();
  Future<void> saveHomeToCache(HomeResponse homeResponse);
  Future<void> saveStoreDetailsToCache(
      StoreDetailsResponse storeDetailsResponse);
  void clearCache();
  void removeFromCache(String key);
}

class LocalDataSourceImpl extends LocalDataSource {
  Map<String, CacheItem> cacheMap = Map();
  @override
  Future<HomeResponse> home() async {
    CacheItem? cacheItem = cacheMap[CACHE_HOME_KEY];
    if (cacheItem != null && cacheItem.isVaild(CACHE_HOME_interval)) {
      return await cacheItem.data;
    } else {
      throw ErrorHandler.handle(DataSource.CACHE_ERROR);
    }
  }

  @override
  Future<void> saveHomeToCache(HomeResponse homeResponse) async {
    cacheMap[CACHE_HOME_KEY] = CacheItem(homeResponse);
  }

  @override
  void clearCache() {
    cacheMap.clear();
  }

  @override
  void removeFromCache(String key) {
    cacheMap.remove(key);
  }

  @override
  Future<StoreDetailsResponse> getStoreDetails() async {
    CacheItem? cacheItem = cacheMap[CACHE_STORE_KEY];
    if (cacheItem != null && cacheItem.isVaild(CACHE_STORE_interval)) {
      return await cacheItem.data;
    } else {
      throw ErrorHandler.handle(DataSource.CACHE_ERROR);
    }
  }

  @override
  Future<void> saveStoreDetailsToCache(
      StoreDetailsResponse storeDetailsResponse) async {
    cacheMap[CACHE_STORE_KEY] = CacheItem(storeDetailsResponse);
  }
}

class CacheItem {
  dynamic data;
  int cacheTime = DateTime.now().millisecondsSinceEpoch;
  CacheItem(this.data);
}

extension CacheItemExtention on CacheItem {
  bool isVaild(int timeSave) {
    int currantTineInMillis = DateTime.now().millisecondsSinceEpoch;
    bool isVaild = currantTineInMillis - cacheTime < timeSave;
    print(isVaild);
    return isVaild;
  }
}
