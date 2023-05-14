import 'package:icheckit_final/services/app_services.dart';

import '../model/calendar_image_model.dart';

class CalendarRepository {
  const CalendarRepository._();

  static const _service = FirestoreService.instance;

  static Future<CalendarImage?> getCalendarImageUrl() async =>
      await _service.documentFuture<CalendarImage?>(
        path: 'calendar/image',
        builder: (data, documentID) {
          if (data == null) return null;
          return CalendarImage.fromJson(data);
        },
      );
}
