import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import 'template_detail_screen.dart';

class TemplatesScreen extends StatelessWidget {
  final String partName;
  final String typeTitle;

  const TemplatesScreen({
    super.key,
    required this.partName,
    required this.typeTitle,
  });

  List<_TemplateItem> _getTemplates() {
    if (partName == 'Part 2') {
      return const [
        _TemplateItem(
          title: '사진 묘사 만능 템플릿',
          subtitle: '도입 / 사람 / 배경 / 전경 / 분위기 / 마무리',
          description: '사진 묘사 답변 구조를 한 번에 볼 수 있는 핵심 템플릿',
          accentColor: Color(0xFFC69363),
          icon: Icons.auto_awesome_rounded,
          templateKey: 'part2_master',
        ),
        _TemplateItem(
          title: '단어 및 표현 참고 모음',
          subtitle: '동작 / 상태 / 일반 명사 / 분위기',
          description: '사진 묘사할 때 바로 가져다 쓸 수 있는 표현 정리',
          accentColor: Color(0xFFA06A43),
          icon: Icons.menu_book_rounded,
          templateKey: 'part2_vocab',
        ),
      ];
    }

    if (partName == 'Part 4') {
      return const [
        _TemplateItem(
          title: '행사 일정표',
          subtitle: 'event schedule',
          description: '행사 시간표, 세션, 장소 질문에 쓰기 좋은 템플릿',
          accentColor: Color(0xFFD4A373),
          icon: Icons.event_note_rounded,
          templateKey: 'part4_event',
        ),
        _TemplateItem(
          title: '이력서',
          subtitle: 'resume / work history',
          description: '지원자 경력, 학력, 이전 직장 정보 답변용 템플릿',
          accentColor: Color(0xFFC69363),
          icon: Icons.badge_rounded,
          templateKey: 'part4_resume',
        ),
        _TemplateItem(
          title: '업무 스케줄',
          subtitle: 'work schedule',
          description: '근무 시간, 담당 업무, 배정 일정 질문용 템플릿',
          accentColor: Color(0xFFB7835A),
          icon: Icons.work_history_rounded,
          templateKey: 'part4_work',
        ),
        _TemplateItem(
          title: '인터뷰',
          subtitle: 'interview schedule',
          description: '면접 시간, 장소, 지원자 관련 정보 확인용 템플릿',
          accentColor: Color(0xFFE0A458),
          icon: Icons.record_voice_over_rounded,
          templateKey: 'part4_interview',
        ),
        _TemplateItem(
          title: '미팅',
          subtitle: 'meeting schedule',
          description: '회의 시간, 참석자, 회의실 정보 응답용 템플릿',
          accentColor: Color(0xFFA06A43),
          icon: Icons.groups_rounded,
          templateKey: 'part4_meeting',
        ),
        _TemplateItem(
          title: '출장 일정표',
          subtitle: 'flight / train',
          description: '비행기, 기차 출발/도착/탑승 정보 정리용 템플릿',
          accentColor: Color(0xFF8B5E3C),
          icon: Icons.flight_takeoff_rounded,
          templateKey: 'part4_trip',
        ),
        _TemplateItem(
          title: '여행 일정표',
          subtitle: 'travel itinerary',
          description: '투어, 숙소, 방문 일정 관련 질문 대비 템플릿',
          accentColor: Color(0xFFD4A373),
          icon: Icons.luggage_rounded,
          templateKey: 'part4_travel',
        ),
        _TemplateItem(
          title: '프로그램 소개',
          subtitle: 'program information',
          description: '프로그램 시간, 내용, 참가 대상 응답용 템플릿',
          accentColor: Color(0xFFE6A23C),
          icon: Icons.info_outline_rounded,
          templateKey: 'part4_program',
        ),
      ];
    }

    if (partName == 'Part 5') {
      return const [
        _TemplateItem(
          title: 'Part 5 만능 템플릿',
          subtitle: '의견 / 이유 / 예시 / 결론',
          description: '어떤 찬반·의견 문제에도 적용 가능한 기본 구조',
          accentColor: Color(0xFFE6A23C),
          icon: Icons.lightbulb_circle_rounded,
          templateKey: 'part5_master',
        ),
        _TemplateItem(
          title: '주제별 참고 문장 모음',
          subtitle: '생활·교육 / 혼자·같이 / 환경 / 인터넷 등',
          description: 'Part 5에서 근거와 예시로 바로 붙일 수 있는 참고 문장',
          accentColor: Color(0xFFD4A373),
          icon: Icons.library_books_rounded,
          templateKey: 'part5_topics',
        ),
      ];
    }

    return const [
      _TemplateItem(
        title: '기본 템플릿',
        subtitle: '준비 중',
        description: '이 파트 템플릿은 다음 단계에서 추가할 수 있어요.',
        accentColor: Color(0xFFA06A43),
        icon: Icons.description_rounded,
        templateKey: 'default',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final templates = _getTemplates();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          '$partName 템플릿',
          style: textTheme.titleLarge,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(typeTitle, style: textTheme.headlineMedium),
              const SizedBox(height: 10),
              Text(
                '유형 안에서 정리할 템플릿을 선택해보세요.',
                style: textTheme.bodyLarge?.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 24),
              ...templates.map(
                (item) => Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: _TemplateCard(
                    partName: partName,
                    item: item,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TemplateCard extends StatelessWidget {
  final String partName;
  final _TemplateItem item;

  const _TemplateCard({
    required this.partName,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      borderRadius: BorderRadius.circular(28),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TemplateDetailScreen(
              partName: partName,
              templateTitle: item.title,
              templateKey: item.templateKey,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: AppColors.cardBorder),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 58,
              height: 58,
              decoration: BoxDecoration(
                color: item.accentColor.withValues(alpha: 0.14),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Icon(
                item.icon,
                color: item.accentColor,
                size: 28,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.title, style: textTheme.titleLarge),
                  const SizedBox(height: 4),
                  Text(
                    item.subtitle,
                    style: textTheme.bodySmall?.copyWith(
                      color: AppColors.primarySoft,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    item.description,
                    style: textTheme.bodyMedium?.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            const Icon(
              Icons.chevron_right_rounded,
              color: AppColors.textLight,
              size: 28,
            ),
          ],
        ),
      ),
    );
  }
}

class _TemplateItem {
  final String title;
  final String subtitle;
  final String description;
  final Color accentColor;
  final IconData icon;
  final String templateKey;

  const _TemplateItem({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.accentColor,
    required this.icon,
    required this.templateKey,
  });
}