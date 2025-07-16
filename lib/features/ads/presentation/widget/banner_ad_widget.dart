import 'package:symptom_checker_study_helper/core/imports.dart';

class BannerAdWidget extends ConsumerStatefulWidget {
  const BannerAdWidget({super.key});

  @override
  ConsumerState<BannerAdWidget> createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends ConsumerState<BannerAdWidget> {
  BannerAd? banner;

  @override
  void initState() {
    super.initState();
    ref.read(adUseCaseProvider).loadBanner((ad) {
      setState(() => banner = ad);
    }, () => setState(() => banner = null));
  }

  @override
  Widget build(BuildContext context) {
    return banner == null
        ? const SizedBox()
        : SizedBox(
      height: banner!.size.height.toDouble(),
      width: banner!.size.width.toDouble(),
      child: AdWidget(ad: banner!),
    );
  }
}