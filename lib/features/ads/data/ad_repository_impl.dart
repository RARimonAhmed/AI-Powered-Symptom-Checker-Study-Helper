import 'package:symptom_checker_study_helper/core/imports.dart';

class AdRepositoryImpl implements AdRepository {
  InterstitialAd? _interstitialAd;
  RewardedAd? _rewardedAd;

  @override
  void loadBannerAd(Function(BannerAd) onLoaded, Function onFailed) {
    final banner = BannerAd(
      adUnitId: "BannerAd.testAdUnitId",
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) => onLoaded(ad as BannerAd),
        onAdFailedToLoad: (ad, error) {
          logError("Banner Failed: ${error.message}");
          ad.dispose();
          onFailed();
        },
      ),
    )..load();
  }

  @override
  void showInterstitialAd() {
    InterstitialAd.load(
      adUnitId: "InterstitialAd.testAdUnitId",
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialAd = ad;
          ad.show();
        },
        onAdFailedToLoad: (error) => logError("Interstitial Failed: ${error.message}"),
      ),
    );
  }

  @override
  void showRewardedAd(Function(bool rewardEarned) onRewardEarned) {
    RewardedAd.load(
      adUnitId: "RewardedAd.testAdUnitId",
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          _rewardedAd = ad;
          ad.show(onUserEarnedReward: (_, reward) {
            logInfo("User earned reward: ${reward.amount}");
            onRewardEarned(true);
          });
        },
        onAdFailedToLoad: (error) {
          logError("Rewarded Failed: ${error.message}");
          onRewardEarned(false);
        },
      ),
    );
  }
}
