import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import 'types_screen.dart';

class PartsScreen extends StatelessWidget {
  const PartsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final parts = [
      const _PartItem(
        partName: 'Part 1',
        questionRange: '문항 1–2',
        englishTitle: 'Read a text aloud',
        koreanTitle: '지문 읽기',
        description: '발음, 억양, 강세를 안정적으로 보여주는 파트예요.',
        icon: Icons.record_voice_over_rounded,
        accentColor: Color(0xFF8B5E3C),
      ),
      const _PartItem(
        partName: 'Part 2',
        questionRange: '문항 3–4',
        englishTitle: 'Describe a picture',
        koreanTitle: '사진 묘사',
        description: '인물, 동작, 배경을 자연스럽게 연결해 설명하는 파트예요.',
        icon: Icons.image_outlined,
        accentColor: Color(0xFFA06A43),
      ),
      const _PartItem(
        partName: 'Part 3',
        questionRange: '문항 5–7',
        englishTitle: 'Respond to questions',
        koreanTitle: '질문 응답',
        description: '짧은 질문에 빠르고 정확하게 답하는 순발력이 중요해요.',
        icon: Icons.question_answer_rounded,
        accentColor: Color(0xFFB7835A),
      ),
      const _PartItem(
        partName: 'Part 4',
        questionRange: '문항 8–10',
        englishTitle: 'Respond using information',
        koreanTitle: '표/일정 정보 활용 응답',
        description: '제공된 일정표나 안내문 정보를 읽고 정확히 답하는 파트예요.',
        icon: Icons.table_chart_rounded,
        accentColor: Color(0xFFC69363),
      ),
      const _PartItem(
        partName: 'Part 5',
        questionRange: '문항 11',
        englishTitle: 'Express an opinion',
        koreanTitle: '의견 제시',
        description: '이유와 예시를 넣어 논리적으로 의견을 말하는 파트예요.',
        icon: Icons.lightbulb_outline_rounded,
        accentColor: Color(0xFFD4A373),
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 120),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '파트 학습',
                style: textTheme.headlineMedium,
              ),
              const SizedBox(height: 10),
              Text(
                '토익스피킹 파트별 특징을 보고 원하는 파트를 선택해보세요.',
                style: textTheme.bodyLarge?.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 24),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: AppColors.cardBorder),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        color: AppColors.accentSoft.withValues(alpha: 0.35),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Icon(
                        Icons.tips_and_updates_rounded,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Text(
                        'Part 1~5는 문항 유형이 완전히 달라서, 파트별 템플릿을 따로 정리하는 방식이 복습에 가장 효율적이에요.',
                        style: textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ...parts.map(
                (part) => Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: _PartCard(part: part),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PartCard extends StatelessWidget {
  final _PartItem part;

  const _PartCard({required this.part});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      borderRadius: BorderRadius.circular(28),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TypesScreen(partName: part.partName),
          ),
        );
      },
      child: Container(
        width: double.infinity,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 58,
                  height: 58,
                  decoration: BoxDecoration(
                    color: part.accentColor.withValues(alpha: 0.14),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Icon(
                    part.icon,
                    color: part.accentColor,
                    size: 28,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(part.partName, style: textTheme.headlineMedium),
                      const SizedBox(height: 4),
                      Text(
                        part.questionRange,
                        style: textTheme.bodySmall?.copyWith(
                          color: AppColors.primarySoft,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.chevron_right_rounded,
                  color: AppColors.textLight,
                  size: 28,
                ),
              ],
            ),
            const SizedBox(height: 18),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _InfoChip(
                  text: part.koreanTitle,
                  color: part.accentColor,
                ),
                _InfoChip(
                  text: part.englishTitle,
                  color: AppColors.primary,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              part.description,
              style: textTheme.bodyLarge?.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 14,
              ),
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.folder_open_rounded,
                    size: 20,
                    color: AppColors.primary,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      '${part.partName} 템플릿 정리하러 가기',
                      style: textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final String text;
  final Color color;

  const _InfoChip({
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(
          color: color.withValues(alpha: 0.22),
        ),
      ),
      child: Text(
        text,
        style: textTheme.bodySmall?.copyWith(
          color: color,
        ),
      ),
    );
  }
}

class _PartItem {
  final String partName;
  final String questionRange;
  final String englishTitle;
  final String koreanTitle;
  final String description;
  final IconData icon;
  final Color accentColor;

  const _PartItem({
    required this.partName,
    required this.questionRange,
    required this.englishTitle,
    required this.koreanTitle,
    required this.description,
    required this.icon,
    required this.accentColor,
  });
}