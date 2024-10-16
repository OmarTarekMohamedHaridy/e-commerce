

import 'package:bloc/bloc.dart';

import '../../../../../core/utils/enums.dart';
import '../../data/models/category_model.dart';
import '../../domain/usecases/get_category_usecases.dart';
part  'category_event.dart';
part 'category_state.dart';


class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  GetCategoryUseCase getCategoryUseCase;

  CategoryBloc(this.getCategoryUseCase) : super((CategoryInitial())) {
    on<GetCategoryEvent>((event, emit) async {
      var result = await getCategoryUseCase();
      print(result);
      result.fold(
            (l) {
          emit(state.copyWith(
              requestState: RequestState.error, errorMessage: l.message));
        },
            (r) {
          emit(state.copyWith(
            requestState: RequestState.success,
            categoryModel: r,
          ));
        },
      );
    });
  }
}