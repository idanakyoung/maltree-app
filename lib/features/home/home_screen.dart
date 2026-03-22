import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../core/theme/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime _focusedDay = DateTime(2026, 3, 22);
  DateTime _selectedDay = DateTime(2026, 3, 22);

  final Map<DateTime, List<String>> _events = {
    DateTime(2026, 3, 22): ['Part 2 표현 정리'],
    DateTime(2026, 3, 23): ['Part 3 템플릿 복습'],
    DateTime(2026, 3, 24): ['Part 4 문장 정리'],
  };

  DateTime _normalize(DateTime day) {
    return DateTime(day.year, day.month, day.day);
  }

  List<String> _getEventsForDay(DateTime day) {
    return _events[_normalize(day)] ?? [];
  }

  void _showAddScheduleDialog() {
    final controller = TextEditingController();
    final textTheme = Theme.of(context).textTheme;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          '일정 추가',
          style: textTheme.titleLarge,
        ),
        content: TextField(
          controller: controller,
          style: textTheme.bodyMedium,
          decoration: const InputDecoration(
            hintText: '예: Part 3 템플릿 복습',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              '취소',
              style: textTheme.labelLarge,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final text = controller.text.trim();
              if (text.isEmpty) return;

              final key = _normalize(_selectedDay);

              setState(() {
                _events.putIfAbsent(key, () => []);
                _events[key]!.add(text);
              });

              Navigator.pop(context);
            },
            child: Text(
              '추가',
              style: textTheme.labelLarge?.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void _removeSchedule(int index) {
    final key = _normalize(_selectedDay);

    setState(() {
      _events[key]!.removeAt(index);
      if (_events[key]!.isEmpty) {
        _events.remove(key);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final selectedSchedules = _getEventsForDay(_selectedDay);
    final titleDate =
        '${_selectedDay.year}.${_selectedDay.month}.${_selectedDay.day}';

    return Scaffold(
      backgroundColor: AppColors.background,
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddScheduleDialog,
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 110),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '말트리',
              style: textTheme.headlineMedium,
            ),
            const SizedBox(height: 28),
            Text(
              '오늘의 학습 관리',
              style: textTheme.headlineLarge,
            ),
            const SizedBox(height: 10),
            Text(
              '캘린더에서 날짜를 선택하고 일정을 관리해보세요.',
              style: textTheme.bodyLarge?.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 24),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(28),
                border: Border.all(color: AppColors.cardBorder),
              ),
              child: TableCalendar<String>(
                firstDay: DateTime(2024, 1, 1),
                lastDay: DateTime(2030, 12, 31),
                focusedDay: _focusedDay,
                selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                eventLoader: _getEventsForDay,
                startingDayOfWeek: StartingDayOfWeek.sunday,
                headerStyle: HeaderStyle(
                  titleCentered: false,
                  formatButtonVisible: false,
                  titleTextStyle: textTheme.headlineMedium!,
                  leftChevronIcon: const Icon(
                    Icons.chevron_left_rounded,
                    color: AppColors.primarySoft,
                  ),
                  rightChevronIcon: const Icon(
                    Icons.chevron_right_rounded,
                    color: AppColors.primarySoft,
                  ),
                ),
                daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: textTheme.bodySmall!,
                  weekendStyle: textTheme.bodySmall!,
                ),
                calendarStyle: CalendarStyle(
                  outsideTextStyle: textTheme.bodySmall!.copyWith(
                    color: AppColors.textLight,
                  ),
                  defaultTextStyle: textTheme.bodyLarge!,
                  weekendTextStyle: textTheme.bodyLarge!,
                  todayTextStyle: textTheme.bodyLarge!.copyWith(
                    color: Colors.white,
                  ),
                  selectedTextStyle: textTheme.bodyLarge!.copyWith(
                    color: Colors.white,
                  ),
                  todayDecoration: const BoxDecoration(
                    color: AppColors.primarySoft,
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  markerDecoration: const BoxDecoration(
                    color: AppColors.accent,
                    shape: BoxShape.circle,
                  ),
                  markersMaxCount: 1,
                ),
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                },
                onPageChanged: (focusedDay) {
                  _focusedDay = focusedDay;
                },
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(28),
                border: Border.all(color: AppColors.cardBorder),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$titleDate 일정',
                    style: textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 18),
                  if (selectedSchedules.isEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        '등록된 일정이 없습니다.',
                        style: textTheme.bodyLarge?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    )
                  else
                    ...List.generate(selectedSchedules.length, (index) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.card,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.check_circle,
                              color: AppColors.primarySoft,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                selectedSchedules[index],
                                style: textTheme.bodyLarge,
                              ),
                            ),
                            IconButton(
                              onPressed: () => _removeSchedule(index),
                              icon: const Icon(Icons.delete_outline_rounded),
                            ),
                          ],
                        ),
                      );
                    }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}