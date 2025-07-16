import 'package:symptom_checker_study_helper/core/imports.dart';

class AdUseCase{
  final AdRepository adRepository;
  AdUseCase(this.adRepository);

  void loadBanner(Function(dynamic ad) onLoaded, Function onFail) => adRepository.loadBannerAd(onLoaded, onFail);

  void showInterstitial() => adRepository.showInterstitialAd();

  void showRewarded(Function(bool) earned)=> adRepository.showRewardedAd(earned);
}