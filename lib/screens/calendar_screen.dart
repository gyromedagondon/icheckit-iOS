import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icheckit_final/core/auth/auth.dart';
import 'package:icheckit_final/model/calendar_image_model.dart';
import 'package:icheckit_final/repositories/calendar_repository.dart';
import 'package:icheckit_final/reusable widgets/reusable_widgets.dart';

import 'photo_viewer_screen.dart';

final calendarImageProvider = FutureProvider<CalendarImage?>((ref) async {
  final auth = ref.watch(authStateChangesProvider);

  if (auth.asData?.value != null && auth.asData?.value?.uid != null) {
    return CalendarRepository.getCalendarImageUrl();
  }
  return null;
});

class CalendarScreen extends ConsumerWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final calendarImage = ref.watch(calendarImageProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('iCheckIt'), backgroundColor: Colors.red[400]),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              buildCoverImage(),
              const Text(
                'Collegiate Calendar',
                style: TextStyle(color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          calendarImage.when(
            data: (cal) {
              if (cal == null) return const EmptyIndicator();
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PhotoViewerScreen(
                        url: cal.url,
                      ),
                    ),
                  );
                },
                child: Image.network(cal.url),
              );
            },
            error: (error, stackTrace) => const ErrorIndicator(),
            loading: () => const LoadingIndicator(),
          ),
        ],
      ),
    );
  }
}
