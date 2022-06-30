import 'package:magdsoft_flutter_structure/data/local/cache_helper.dart';
import 'package:magdsoft_flutter_structure/data/network/requests/home_request.dart';

class HomeMockRepo extends HomeRepository{
  @override
   clearData()  {
    CacheHelper.clearData();
  }
}