import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

    Map<DateTime, int>  fetchHeatMapDateSet(List<Map<String, dynamic>> tasks) {

    final map = <DateTime, int>{};

    //スタートの日付を設定
    final startDate = DateTime(DateTime.now().year, 4);

    //日数
    const int maxDaysInMonth = 365;

    //タスクが完了した日を１日づつ確認
    for (var i = 0; i < maxDaysInMonth; i++) {
      final date = startDate.add(Duration(days: i));

      final taskCounts = tasks
          .where((element) =>
              DateUtils.isSameDay(
                      (element['createdAt'] as Timestamp).toDate(), date) ==
                  true &&
              element['isDone'] == true)
          .length;

      if (taskCounts != 0) {
        map[date] = taskCounts;
      }
    }
    return map;
  }
