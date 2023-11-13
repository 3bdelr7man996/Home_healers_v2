import 'package:dr/core/utils/shimmer_helper.dart';
import 'package:flutter/material.dart';

import 'active_users_avatar.dart';

class ActiveUsersShimmer extends StatelessWidget {
  const ActiveUsersShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return shimmerHelper(
      child: SizedBox(
        height: 135,
        child: ListView.builder(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          itemCount: 8,
          itemBuilder: (context, index) {
            return ActiveUsersAvatar(
              userId: 0,
              imagePath: '',
              userName: '',
              isOnline: true,
            );
          },
        ),
      ),
    );
  }
}
