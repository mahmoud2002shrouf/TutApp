import 'package:advanced_flutter_arabic/app/constance.dart';
import 'package:advanced_flutter_arabic/app/extensions.dart';
import 'package:advanced_flutter_arabic/data/response/response.dart';
import 'package:advanced_flutter_arabic/domain/model/models.dart';

extension CustamerResponseMapper on CustamerResponse {
  Custamer toDomine() {
    print(1);

    return Custamer(
        this?.id.orEmpty() ?? Constance.empty,
        this?.name.orEmpty() ?? Constance.empty,
        this?.numOfNotifaction.orZero() ?? Constance.zero);
  }
}

extension ContactsResponseMapper on ContactsResponse {
  Contacts toDomine() {
    print(1);

    return Contacts(
        this?.email.orEmpty() ?? Constance.empty,
        this?.phone.orEmpty() ?? Constance.empty,
        this?.link.orEmpty() ?? Constance.empty);
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse {
  Authentication toDomine() {
    print(1);
    return Authentication(
        this?.contacts!.toDomine(), this?.custamer!.toDomine());
  }
}

//forget
extension ForgetPasswordResponseMapper on ForgetPasswordResponse {
  FogetPassword toDomine() {
    return FogetPassword(this?.support.orEmpty() ?? Constance.empty);
  }
}

//home
extension ServicesResponseMapper on ServicesResponse {
  Services toDomine() {
    return Services(
        this?.id.orZero() ?? Constance.zero,
        this?.title.orEmpty() ?? Constance.empty,
        this?.image.orEmpty() ?? Constance.empty);
  }
}

extension BannersResponseMapper on BannersResponse {
  Banners toDomine() {
    return Banners(
        this?.id.orZero() ?? Constance.zero,
        this?.title.orEmpty() ?? Constance.empty,
        this?.link.orEmpty() ?? Constance.empty,
        this?.image.orEmpty() ?? Constance.empty);
  }
}

extension StoresResponseMapper on StoresResponse {
  Stores toDomine() {
    return Stores(
        this?.id.orZero() ?? Constance.zero,
        this?.title.orEmpty() ?? Constance.empty,
        this?.image.orEmpty() ?? Constance.empty);
  }
}

extension HomeDataResponseMapper on HomeResponse {
  Home toDomine() {
    List<Services> services = (this?.data?.services?.map(
                  (e) => e.toDomine(),
                ) ??
            const Iterable.empty())
        .cast<Services>()
        .toList();
    List<Banners> banners = (this?.data?.banners?.map(
                  (e) => e.toDomine(),
                ) ??
            const Iterable.empty())
        .cast<Banners>()
        .toList();
    List<Stores> stores = (this?.data?.stores?.map(
                  (e) => e.toDomine(),
                ) ??
            const Iterable.empty())
        .cast<Stores>()
        .toList();
    HomeData data = HomeData(services, banners, stores);
    return Home(data);
  }
}

extension StoreDetailsMapper on StoreDetailsResponse {
  StoreDetails toDomine() {
    return StoreDetails(image.orEmpty(), id.orZero(), title.orEmpty(),
        details.orEmpty(), services.orEmpty(), about.orEmpty());
  }
}
