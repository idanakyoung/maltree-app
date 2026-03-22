import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../template/templates_screen.dart';

class TypesScreen extends StatelessWidget {
  final String partName;

  const TypesScreen({
    super.key,
    required this.partName,
  });

  List<_TypeItem> _getTypesByPart(String partName) {
    switch (partName) {
      case 'Part 1':
        return const [
          _TypeItem(
            title: '지문 읽기 기본',
            subtitle: '발음 / 억양 / 끊어읽기',
            description: '문장을 자연스럽게 끊고, 강세와 억양을 안정적으로 연습하는 유형이에요.',
            tip: '쉼표, 마침표에서 호흡 끊기 기준을 같이 적어두면 좋아요.',
            icon: Icons.graphic_eq_rounded,
            accentColor: Color(0xFF8B5E3C),
          ),
          _TypeItem(
            title: '숫자·고유명사 읽기',
            subtitle: '날짜 / 시간 / 이름 / 금액',
            description: '실수하기 쉬운 숫자와 고유명사를 따로 정리해두면 Part 1 정확도가 올라가요.',
            tip: '자주 틀리는 숫자 표현을 개인 메모로 모아두세요.',
            icon: Icons.pin_outlined,
            accentColor: Color(0xFFA06A43),
          ),
        ];

      case 'Part 2':
        return const [
          _TypeItem(
            title: '사진 묘사 만능 템플릿',
            subtitle: '도입 / 사람 / 배경 / 분위기 / 마무리',
            description: '사진 묘사에 자주 쓰는 문장 구조와 표현을 한 번에 정리하는 유형이에요.',
            tip: '만능 템플릿 1개 + 단어/표현 모음 1개로 정리하면 복습이 편해요.',
            icon: Icons.auto_awesome_rounded,
            accentColor: Color(0xFFC69363),
          ),
        ];

      case 'Part 3':
        return const [
          _TypeItem(
            title: '개인 경험 질문',
            subtitle: '평소 습관 / 선호 / 경험',
            description: '자신의 일상이나 경험을 짧고 자연스럽게 답하는 유형이에요.',
            tip: 'I usually ~ / I prefer ~ / One time, I ~ 패턴을 정리하세요.',
            icon: Icons.person_rounded,
            accentColor: Color(0xFFB7835A),
          ),
          _TypeItem(
            title: '이유 설명 질문',
            subtitle: '왜 그런지 말하기',
            description: '짧은 답변 뒤에 이유를 덧붙여 설득력 있게 말하는 유형이에요.',
            tip: 'because / since / so that 으로 이유 확장 템플릿을 만들면 좋아요.',
            icon: Icons.help_center_rounded,
            accentColor: Color(0xFFC69363),
          ),
        ];

      case 'Part 4':
        return const [
          _TypeItem(
            title: '정보 활용 템플릿',
            subtitle: '행사 / 일정표 / 인터뷰 / 이력서',
            description: '표와 일정 정보를 빠르게 읽고 답하는 파트를 템플릿별로 정리하는 유형이에요.',
            tip: '자료 종류별로 템플릿을 따로 나누면 훨씬 보기 편해요.',
            icon: Icons.table_chart_rounded,
            accentColor: Color(0xFFD4A373),
          ),
        ];

      case 'Part 5':
        return const [
          _TypeItem(
            title: '의견 제시 만능 템플릿',
            subtitle: '입장 / 이유 / 예시 / 마무리',
            description: 'Part 5 답변 구조와 주제별 참고 문장을 함께 정리하는 유형이에요.',
            tip: '만능 템플릿 1개 + 주제별 문장 묶음으로 구성하면 좋아요.',
            icon: Icons.lightbulb_circle_rounded,
            accentColor: Color(0xFFE6A23C),
          ),
        ];

      default:
        return const [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final typeItems = _getTypesByPart(partName);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          '$partName 유형',
          style: textTheme.titleLarge,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(partName, style: textTheme.headlineMedium),
              const SizedBox(height: 10),
              Text(
                '자주 쓰는 유형과 정리 포인트를 보고, 원하는 유형부터 템플릿을 정리해보세요.',
                style: textTheme.bodyLarge?.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 24),
              ...typeItems.map(
                (item) => Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: _TypeCard(
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

class _TypeCard extends StatelessWidget {
  final String partName;
  final _TypeItem item;

  const _TypeCard({
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
            builder: (context) => TemplatesScreen(
              partName: partName,
              typeTitle: item.title,
            ),
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
            const SizedBox(height: 16),
            Text(
              item.description,
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
                      '템플릿 목록 보러 가기',
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

class _TypeItem {
  final String title;
  final String subtitle;
  final String description;
  final String tip;
  final IconData icon;
  final Color accentColor;

  const _TypeItem({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.tip,
    required this.icon,
    required this.accentColor,
  });
}