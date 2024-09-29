//onBordng
class SliderObject {
  final String title;
  final String subTitle;
  final String image;
  const SliderObject(this.title, this.subTitle, this.image);
}

class SliderViewObject {
  final SliderObject sliderObject;
  final int currantIndex;
  final int numberOfSlide;
  const SliderViewObject(
      this.sliderObject, this.currantIndex, this.numberOfSlide);
}

//authantication
class Custamer {
  String id;
  String name;
  int numOfNotifaction;
  Custamer(this.id, this.name, this.numOfNotifaction);
}

class Contacts {
  String phone;
  String link;
  String email;
  Contacts(this.phone, this.link, this.email);
}

class Authentication {
  Custamer? custamer;
  Contacts? contacts;

  Authentication(this.contacts, this.custamer);
}

//login
//forgetPassword
class FogetPassword {
  String? support;
  FogetPassword(this.support);
}

//forgetPassword

//home////////////////////

class Services {
  int id;
  String title;
  String image;
  Services(this.id, this.title, this.image);
}

class Banners {
  int id;
  String title;
  String link;
  String image;
  Banners(this.id, this.title, this.link, this.image);
}

class Stores {
  int id;
  String title;
  String image;
  Stores(this.id, this.title, this.image);
}

class HomeData {
  List<Services>? services;
  List<Banners>? banners;
  List<Stores>? stores;
  HomeData(this.services, this.banners, this.stores);
}

class Home {
  HomeData? data;
  Home(this.data);
}

//home////////////////////
class StoreDetails {
  String image;
  int id;
  String title;
  String details;
  String services;
  String about;
  StoreDetails(
      this.image, this.id, this.title, this.details, this.services, this.about);
}
