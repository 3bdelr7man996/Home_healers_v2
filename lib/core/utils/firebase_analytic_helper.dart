import 'package:dr/core/utils/app_strings.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

FirebaseAnalytics analytics = FirebaseAnalytics.instance;
FirebaseAnalyticsObserver getAnalyticObsever() =>
    FirebaseAnalyticsObserver(analytics: analytics);

class FirebaseAnalyticUtil {
  static void logAppOpen() async {
    if(AppStrings.TRACK_AUTH)
    await analytics.logAppOpen();
  }

  static void logLogin({Map<String, Object>? param}) {
    if(AppStrings.TRACK_AUTH)
    analytics.logLogin(
      loginMethod: "email",
    );
  }

  static void logSignUpEvent({Map<String, Object>? param}) {
    if(AppStrings.TRACK_AUTH)
    analytics.logSignUp(signUpMethod: "sign_up", parameters: param);
  }

  static void logLoginFacebookEvent({Map<String, Object>? param}) {
    if(AppStrings.TRACK_AUTH)
    analytics.logEvent(name: "Login_Facebook", parameters: param);
  }

  static void logLoginGmailEvent({Map<String, Object>? param}) {
    if(AppStrings.TRACK_AUTH)
    analytics.logEvent(name: "Login_Gmail", parameters: param);
  }

  static void logLoginInstaEvent({Map<String, Object>? param}) {
    if(AppStrings.TRACK_AUTH)
    analytics.logEvent(name: "Login_Inastgram", parameters: param);
  }

  static void logLoginAppleEvent({Map<String, Object>? param}) {
    if(AppStrings.TRACK_AUTH)
    analytics.logEvent(name: "Login_Apple", parameters: param);
  }

  static void logSearchEvent(
      {required String term, Map<String, Object>? param}) {
        if(AppStrings.TRACK_AUTH)
    analytics.logSearch(searchTerm: term, parameters: param);
  }

  static void logAddToCartButtonEvent(
      {List<AnalyticsEventItem>? items, Map<String, Object>? param}) {
        if(AppStrings.TRACK_AUTH)
    analytics.logAddToCart(items: items, parameters: param);
  }

  static void logAddReservationEvent(
      {List<AnalyticsEventItem>? items, Map<String, Object>? param}) {
        if(AppStrings.TRACK_AUTH)
    analytics.logEvent(name: "add_reservation", parameters: param);
  }

  static void logGoTOCartEvent({Map<String, Object>? param}) {
    if(AppStrings.TRACK_AUTH)
    analytics.logEvent(name: "go_to_cart", parameters: param);
  }

  static void logGoToCheckoutEvent(
      {String? currency, Map<String, Object>? param}) {
        if(AppStrings.TRACK_AUTH)
    analytics.logBeginCheckout(currency: currency, parameters: param);
  }

  static void logGoToCheckoutSuccessEvent({Map<String, Object>? param}) {
    if(AppStrings.TRACK_AUTH)
    analytics.logEvent(name: "checkout_success", parameters: param);
  }

  static void logGoToCheckoutFailedEvent({Map<String, Object>? param}) {
    if(AppStrings.TRACK_AUTH)
    analytics.logEvent(name: "checkout_failed", parameters: param);
  }

  static void logGoOrdersEvent({Map<String, Object>? param}) {
    if(AppStrings.TRACK_AUTH)
    analytics.logEvent(name: "go_to_orders", parameters: param);
  }

  static void logLogoutEvent({Map<String, Object>? param}) {
    if(AppStrings.TRACK_AUTH)
    analytics.logEvent(name: "Logout", parameters: param);
  }

  static void logAPIErrorEvent({Map<String, Object>? param}) {
    if(AppStrings.TRACK_AUTH)
    analytics.logEvent(name: "api_error", parameters: param);
  }
}
