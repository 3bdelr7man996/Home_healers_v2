import 'dart:developer';

import 'package:dr/core/utils/app_strings.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

class PusherConfiguration {
  final PusherChannelsFlutter pusher;
  // static PusherChannel? chatChannel;

  PusherConfiguration({required this.pusher}) {
    initPusher();
  }

  Future<void> initPusher() async {
    log("====INIT PUSHER ====");
    try {
      await pusher.init(
        apiKey: AppStrings.PUSHER_APP_KEY,
        cluster: AppStrings.PUSHER_APP_CLUSTER,
        onConnectionStateChange: onConnectionStateChange,
        onError: onError,
        onSubscriptionSucceeded: onSubscriptionSucceeded,
        onEvent: onEvent,
        onSubscriptionError: onSubscriptionError,
        onDecryptionFailure: onDecryptionFailure,
        onMemberAdded: onMemberAdded,
        onMemberRemoved: onMemberRemoved,
        onSubscriptionCount: onSubscriptionCount,
        // authEndpoint: "${AppStrings.divUrl}/chat/auth",
        // authParams: {
        //   "headers": {
        //     'Authorization': 'Bearer ${CacheHelper.getData(
        //       key: AppStrings.userToken,
        //     )}'
        //   }
        // },
      );
    } catch (e) {
      log("PUSHER Exception $e");
    }
  }

  // static Future<void> triggerEvent(
  //     {required String userId, required String msg}) async {
  //   await chatChannel?.trigger(PusherEvent(
  //       userId: userId,
  //       channelName: "chat.",
  //       eventName: "ChatMessageSent",
  //       data: {
  //         "id": userId,
  //         "msg": msg,
  //       }));
  // }

  void onConnectionStateChange(dynamic currentState, dynamic previousState) {
    log("Connection: $currentState");
  }

  void onError(String message, int? code, dynamic e) {
    log("onError: $message code: $code exception: $e");
  }

  void onEvent(PusherEvent event) {
    log("onEvent: $event");
    log("channel name ${event.channelName}");
    log("event name ${event.eventName}");
  }

  void onSubscriptionSucceeded(String channelName, dynamic data) {
    log("onSubscriptionSucceeded: $channelName data: $data");
    final me = pusher.getChannel(channelName)?.members;
    log("Me: $me");
  }

  void onSubscriptionError(String message, dynamic e) {
    log("onSubscriptionError: $message Exception: $e");
  }

  void onDecryptionFailure(String event, String reason) {
    log("onDecryptionFailure: $event reason: $reason");
  }

  void onMemberAdded(String channelName, PusherMember member) {
    log("onMemberAdded: $channelName user: $member");
  }

  void onMemberRemoved(String channelName, PusherMember member) {
    log("onMemberRemoved: $channelName user: $member");
  }

  void onSubscriptionCount(String channelName, int subscriptionCount) {
    log("onSubscriptionCount: $channelName subscriptionCount: $subscriptionCount");
  }
}
