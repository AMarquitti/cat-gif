import 'package:app/features/home/domain/entities/cat_entity.dart';
import 'package:app/features/home/domain/failures/home_failure.dart';
import 'package:app/features/home/domain/use_cases/get_cat_gif_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cat_state.dart';
part 'cat_cubit.freezed.dart';

class CatCubit extends Cubit<CatState> {
  CatCubit(this._catGifUseCase) : super(const CatState.initial());

  final GetCatGifUseCase _catGifUseCase;

  Future<void> fetchCatData() async {
    emit(const CatState.loading());

    //I dont like generics try and catch blocks :) demo only
    try {
      final Either<HomeFailure, CatEntity> result =
          await _catGifUseCase.execute();
      result.fold(
        (HomeFailure failure) => failure.maybeWhen(
          unauthorized: () => emit(const CatState.unauthorized()),
          serverError: (_) => emit(const CatState.serverError()),
          orElse: () => emit(const CatState.unexpectedError()),
        ),
        (CatEntity catEntity) => emit(CatState.dataLoaded(catEntity)),
      );
    } catch (_) {
      emit(const CatState.unexpectedError());
    }
  }
}
