import 'package:symptom_checker_study_helper/core/imports.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("AI Med Study")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(child: Text("Study content coming soon")),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => ref.read(adUseCaseProvider).showInterstitial(),
            child: const Text("Show Interstitial"),
          ),
          ElevatedButton(
            onPressed: () => ref.read(adUseCaseProvider).showRewarded((earned) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(earned
                      ? "Reward Earned!"
                      : "Reward not completed")));
            }),
            child: const Text("Show Rewarded Ad"),
          ),
          const Spacer(),
          const BannerAdWidget(),
        ],
      ),
    );
  }
}