const String imagePath = "assets/images";
const String jsonPath = "assets/json";
const String iconsPath = "assets/icons";
const String svgPath = "assets/svg_images";

class ImageAssets {
  static const String routeLogo = "$imagePath/splash_logo.png";
  static const String categoryCardImage = "$imagePath/category_card_image.png";
  static const String subcategoryCardImage = "$imagePath/sub_category_card_image.png";
}

class SvgAssets{
  static const String routeLogo = "$svgPath/route.svg";
  static const String eye = "$svgPath/Eye.svg";
  static const String edit = "$svgPath/edit (1) 5.svg";
}

class IconsAssets{
  static const String _icCategory = "$iconsPath/ic_category.png";
  static const String _icHome = "$iconsPath/ic_home.png";
  static const String _icProfile = "$iconsPath/ic_profile.png";
  static const String _icWithList = "$iconsPath/ic_wish_list.png";
  static const String _icCart = "$iconsPath/ic_cart.png";
  static const String _icSearch = "$iconsPath/ic_search.png";

  static String get icCategory => _icCategory;
  static String get icHome => _icHome;
  static String get icProfile => _icProfile;
  static String get icWithList => _icWithList;
  static String get icCart => _icCart;
  static String get icSearch => _icSearch;
}



class JsonAssets {
  static const String loading = "$jsonPath/loading.json";
  static const String error = "$jsonPath/error.json";
  static const String empty = "$jsonPath/empty.json";
  static const String success = "$jsonPath/success.json";
}
