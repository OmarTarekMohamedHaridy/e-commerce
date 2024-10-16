
import '../../../../../core/api/api_manager.dart';
import '../../../../../core/api/end_points.dart';
import '../../../../../core/exceptions/exceptions.dart';
import '../../../../../di.dart';
import '../models/category_model.dart';
import 'category_ds.dart';
class CategoryDSImpl implements CategoryDS {
ApiManager apiManager ;
CategoryDSImpl(this.apiManager);
  @override
  Future<CategoryModel> getCategories() async {
    try {
      var response = await apiManager.getData(endPoint: EndPoints.category);
print(response);
      CategoryModel categoryModel = CategoryModel.fromJson(response.data);
      return categoryModel;
    } catch (e) {
      throw RouteRemoteException(e.toString());
    }
  }
}