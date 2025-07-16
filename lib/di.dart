import 'package:symptom_checker_study_helper/core/imports.dart';

final adRepoProvider = Provider<AdRepository>((ref) => AdRepositoryImpl());

final adUseCaseProvider = Provider<AdUseCase>(
      (ref) => AdUseCase(ref.watch(adRepoProvider)),
);


final homeRepoProvider = Provider<HomeRepository>((ref) => HomeRepositoryImpl());

final homeUseCaseProvider = Provider<HomeUseCase>(
      (ref) => HomeUseCase(ref.watch(homeRepoProvider)),
);