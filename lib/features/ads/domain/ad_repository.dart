import 'package:google_mobile_ads/google_mobile_ads.dart';

abstract class AdRepository{
  void loadBannerAd(Function(BannerAd) onLoaded, Function onFailed);
  void showInterstitialAd();
  void showRewardedAd(Function(bool rewardEarned) onRewardEarned);
}