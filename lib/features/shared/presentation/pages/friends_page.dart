import 'package:booknoke/core/assets/assets.dart';
import 'package:booknoke/features/shared/presentation/widgets/friends_widget.dart';
import 'package:booknoke/features/shared/presentation/widgets/request_friends.dart';
import 'package:flutter/material.dart';

class FriendsPage extends StatelessWidget {
  const FriendsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Friends"),
        centerTitle: true,
        forceMaterialTransparency: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.group_add_outlined),
            onPressed: () {
              // Action for adding a friend
            },
          ),
        ],
      ),
      body: const Center(
        child: Column(
          children: [
            RequestFriendsWidget(
              title: "Friends Requests",
              
              requests: "2 Pending Requests",
            ),
            // const SizedBox(height: 8,),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Text("Your Friends"),
                ),
              ],
            ),
            // const SizedBox(height: 8),
           Column(
            children: [
              FriendsWidget(
                friend: "Alice Johnson",
                image: Assets.avatar,
                reading: "2 Mutual Friends",
              ),
              FriendsWidget(
                friend: "Bob Smith",
                image: Assets.avatar,
                reading: "5 Mutual Friends",
              ),
              FriendsWidget(
                friend: "Charlie Davis",
                image: Assets.avatar,
                reading: "1 Mutual Friend",
              ),
            ],
          ),
        ],
      ),
    ),
    );
  }
}
                