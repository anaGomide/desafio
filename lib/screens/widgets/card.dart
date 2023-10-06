import 'package:flutter/material.dart';

class ActivityCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String data;
  final String content;
  final String messageCount;

  ActivityCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.data,
    required this.content,
    required this.messageCount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 44,
                  height: 44,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(43),
                    child: Image.asset(
                      'assets/images/profile.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 16.37),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              color: Color(0xFF1A1C1E),
                              fontSize: 16,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(width: 4.68),
                          const Icon(
                            Icons.verified,
                            color: Colors.orange,
                            size: 15,
                          ),
                          const SizedBox(width: 4.68),
                          Text(
                            subtitle,
                            style: const TextStyle(
                              color: Color(0xFF848484),
                              fontSize: 12,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            data,
                            style: const TextStyle(
                              color: Color(0xFF848484),
                              fontSize: 12,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(width: 20),
                          const Icon(
                            Icons.expand_more,
                            size: 24,
                            color: Color(0xFF848484),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        content,
                        style: const TextStyle(
                          color: Color(0xFF2E2E2E),
                          fontSize: 16,
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.chat_bubble_outline,
                      size: 21,
                      color: Color(0xFF868686),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      messageCount, // Substitua pelo número desejado
                      style: const TextStyle(
                        color: Color(0xFF868686),
                        fontSize: 16,
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
