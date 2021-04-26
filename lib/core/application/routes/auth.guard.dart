import 'package:auto_route/auto_route.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  Future<bool> canNavigate(
      List<PageRouteInfo> pendingRoutes, StackRouter router) async {
    if (!isAuthenticated) {
      router.root.push(LoginRouter(onLoginResult: (success) {
        // after successfully logging in, we can now authenticate the user and return to our regularly scheduled program
        if (success) {
          isAuthenticated = true;
          router.replaceAll(
              pendingRoutes); // push all pending routes after authenticating
        }
      }));
      return false;
    }
    return true;
  }
}
