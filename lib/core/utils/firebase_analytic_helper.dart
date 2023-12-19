import 'package:firebase_analytics/firebase_analytics.dart';

FirebaseAnalytics analytics = FirebaseAnalytics.instance;

class FirebaseAnalyticUtil {
  static void logAppOpen() async {
    await analytics.logAppOpen();
  }

  static void logLogin({Map<String, Object>? param}) {
    analytics.logLogin(
      loginMethod: "manual",
    );
  }

  static void logSignUpEvent({Map<String, Object>? param}) {
    analytics.logEvent(name: "sign_up", parameters: param);
  }

  static void logLoginFacebookEvent({Map<String, Object>? param}) {
    analytics.logEvent(name: "Login_Facebook", parameters: param);
  }

  static void logLoginGmailEvent({Map<String, Object>? param}) {
    analytics.logEvent(name: "Login_Gmail", parameters: param);
  }

  static void logLoginInstaEvent({Map<String, Object>? param}) {
    analytics.logEvent(name: "Login_Inastgram", parameters: param);
  }

  static void logLoginAppleEvent({Map<String, Object>? param}) {
    analytics.logEvent(name: "Login_Apple", parameters: param);
  }

  static void logSearchEvent({Map<String, Object>? param}) {
    analytics.logEvent(name: "make_search", parameters: param);
  }

  static void logAddToCartButtonEvent({Map<String, Object>? param}) {
    analytics.logEvent(name: "add_to_cart", parameters: param);
  }

  static void logAddReservationEvent({Map<String, Object>? param}) {
    analytics.logEvent(name: "make_reservation", parameters: param);
  }

  static void logGoTOCartEvent({Map<String, Object>? param}) {
    analytics.logEvent(name: "go_to_cart", parameters: param);
  }

  static void logGoToCheckoutEvent({Map<String, Object>? param}) {
    analytics.logEvent(name: "go_to_checkout", parameters: param);
  }

  static void logGoToCheckoutSuccessEvent({Map<String, Object>? param}) {
    analytics.logEvent(name: "checkout_success", parameters: param);
  }

  static void logGoToCheckoutFailedEvent({Map<String, Object>? param}) {
    analytics.logEvent(name: "checkout_failed", parameters: param);
  }

  static void logGoOrdersEvent({Map<String, Object>? param}) {
    analytics.logEvent(name: "go_to_orders", parameters: param);
  }

  static void logLogoutEvent({Map<String, Object>? param}) {
    analytics.logEvent(name: "Logout", parameters: param);
  }

  static void logAPIErrorEvent({Map<String, Object>? param}) {
    analytics.logEvent(name: "api_error", parameters: param);
  }
}
