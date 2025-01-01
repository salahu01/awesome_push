import 'package:awesome_push/imports.dart';

part 'home_cubit_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends HydratedCubit<HomeState> {
  HomeCubit() : super(const HomeState());

  void addProject(ProjetModel project) {
    emit(state.copyWith(projects: [...state.projects, project]));
  }

  void removeProject(ProjetModel project) {
    emit(state.copyWith(projects: [...state.projects.where((p) => p.projectId != project.projectId)]));
  }

  void updateProject(ProjetModel project) {
    emit(
      state.copyWith(
        projects: [
          for (final p in state.projects)
            if (p.projectId == project.projectId) project else p
        ],
      ),
    );
  }

  @override
  HomeState? fromJson(Map<String, dynamic> json) {
    return HomeState(
      projects: (json['projects'] as List).map((e) => ProjetModel.fromMap(e as Map<String, dynamic>)).toList(),
    );
  }

  @override
  Map<String, dynamic>? toJson(HomeState state) {
    return {
      'projects': state.projects.map((e) => e.toMap()).toList(),
    };
  }
}
