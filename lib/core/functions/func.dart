import '../utils/app_routers.dart';
import 'package:go_router/go_router.dart';

Future<Null> navigateToHomeView(bool mounted, context) {
  return Future.delayed(const Duration(seconds: 3), () {
    if (!mounted) return;
    GoRouter.of(context).go(AppRouters.kHomeView);
  });
}
