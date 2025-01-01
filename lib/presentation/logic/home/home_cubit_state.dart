part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default([]) List<ProjetModel> projects,
  }) = _HomeState;
}
