// RequestFriendsWidget (Professional look)
import 'package:booknoke/core/theme/color_manager.dart';
import 'package:flutter/material.dart';

class RequestFriendsWidget extends StatelessWidget {
  final String title;
  final String requests;

  const RequestFriendsWidget({
    super.key,
    required this.title,
    required this.requests,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: ColorsManager.darkSecondary,
        borderRadius: BorderRadius.circular(16),
        border: const Border(
          left: BorderSide(color: ColorsManager.darkAccent, width: 4),
        ),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: ColorsManager.darkAccent.withOpacity(0.1),
          child: const Icon(Icons.person_add, color: ColorsManager.darkAccent),
        ),
        title: Text(title, style: const TextStyle(color: ColorsManager.white, fontWeight: FontWeight.bold)),
        subtitle: Text(requests, style: const TextStyle(color: ColorsManager.grey)),
        trailing: const Icon(Icons.arrow_forward_ios, color: ColorsManager.grey, size: 14),
      ),
    );
  }
}