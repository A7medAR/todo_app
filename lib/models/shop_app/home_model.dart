class HomeModel
{
 late bool status;
 late HomeDataModel data;
  HomeModel.fromJson(Map<String, dynamic>json)
  {
    status=json['status'];
    data=HomeDataModel.fromJson(json['data']);
  }

}

class HomeDataModel
{
  List<BannerModel> banners = [];
  List<ProductModel> products = [];

  HomeDataModel.fromJson(Map<String, dynamic> json) {
    if (json['banners'] != null) {
      banners = List.from(json['banners']).map((bannerJson) => BannerModel.fromJson(bannerJson)).toList();
    }

    if (json['products'] != null) {
      products = List.from(json['products']).map((productJson) => ProductModel.fromJson(productJson)).toList();
    }
  }
}

class BannerModel
{
  int? id;
  String? image;

  BannerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }
}

class ProductModel
{
 late int id;
late  dynamic price;
late  dynamic oldPrice;
 late dynamic discount;
late  String image;
late  String name;
late bool inFavorites;
late bool inCart;

  ProductModel.fromJson(Map<String, dynamic>json)
  {
    id=json['id'];
    price=json['price'];
    oldPrice=json['old_price'];
    discount=json['discount'];
    image=json['image'];
    name=json['name'];
    inFavorites=json['in_favorites'];
    inCart=json['in_cart'];



  }
}