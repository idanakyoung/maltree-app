import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class TemplateDetailScreen extends StatelessWidget {
  final String partName;
  final String templateTitle;
  final String templateKey;

  const TemplateDetailScreen({
    super.key,
    required this.partName,
    required this.templateTitle,
    required this.templateKey,
  });

  _TemplateContent _getContent() {
    switch (templateKey) {
      case 'part2_master':
        return const _TemplateContent(
          englishTemplate: '''
I think this picture was taken (장소).
[예: indoors / outdoors / at a café / at a supermarket]

There are (인원 수) people in this picture.
[예: two / some / many / three]

In the middle of the picture, (인물1 설명).
[예: a man wearing a red shirt is picking up a box.]

On the (left/right) side, (인물2 설명).
[예: a woman with long hair is looking at him.]

In the background, I can see (배경 묘사).
[예: some buildings and a tree / a menu board and a window]

In the foreground, there is/are (전경 묘사).
[예: a table and a cup / a few bags]

They seem (느낌).
[예: busy / peaceful / excited / relaxed]

This picture reminds me of (개인 의견).
[예: my trip to Busan / my local coffee shop / my summer vacation]

That’s all I can say about this picture.
''',
          koreanNote: '사진 묘사 답변 구조를 장소 → 인원 → 중심 인물 → 옆 인물 → 배경 → 전경 → 분위기 → 개인 의견 순서로 정리한 만능 템플릿',
          tip: '실전에서는 문장을 전부 다 말하려고 하기보다, 사진에 맞는 문장만 골라 5~7문장 정도로 안정적으로 말하는 게 좋아요.',
        );

      case 'part2_vocab':
        return const _TemplateContent(
          englishTemplate: '''
[동작]
making a copy / sitting at a desk / giving a presentation / using a laptop
having a discussion / taking notes / preparing a meal / chopping vegetables
placing an order / taking an order / shopping for groceries
waiting for a bus / walking on a crosswalk / taking a break
taking a picture / loading some boxes / packing some items

[상태]
is standing / is sitting / is leaning against / is smiling
looks serious / looks tired / is holding something / is pointing at
is using a smartphone / is talking on the phone / People are gathered

[일반 명사]
a fridge / a tray / a hallway / a microwave oven / a menu board
a platform / a boarding gate / a suitcase / a parking lot
a warehouse / a construction site / a microscope / crowded with people

[분위기]
peaceful / quiet / calm / relaxed / lively / energetic / exciting
busy / hectic / crowded / cozy / warm / friendly
''',
          koreanNote: '사진 묘사에서 자주 쓰는 동작, 상태, 일반 명사, 분위기 표현 모음',
          tip: '단어를 통째로 외우기보다 “사람 동작”, “배경 사물”, “분위기 형용사”처럼 묶어서 정리하면 훨씬 빨리 떠올릴 수 있어요.',
        );

      case 'part4_event':
        return const _TemplateContent(
          englishTemplate: '''
[행사 일정표 템플릿]

The event starts at ~.
It will be held at ~.
The first session is about ~.
According to the schedule, ~ is at ~.
The guest speaker will talk about ~.
The event ends at ~.
''',
          koreanNote: '행사 일정표에서 시간, 장소, 세션, 발표자 관련 질문에 답할 때 쓰는 기본 템플릿',
          tip: 'Part 4는 질문에서 묻는 정보 종류를 먼저 잡고, 표에서 시간/장소/이름을 빠르게 찾는 연습이 중요해요.',
        );

      case 'part4_resume':
        return const _TemplateContent(
          englishTemplate: '''
[이력서 템플릿]

He/She graduated from ~.
He/She has experience in ~.
He/She worked for ~ for ~ years.
His/Her current position is ~.
According to the resume, he/she is skilled in ~.
''',
          koreanNote: '이력서에서 학력, 경력, 현재 직무, 기술을 답할 때 쓰는 템플릿',
          tip: 'resume, position, experience, graduated from 같은 단어는 따로 묶어두는 게 좋아요.',
        );

      case 'part4_work':
        return const _TemplateContent(
          englishTemplate: '''
[업무 스케줄 템플릿]

He/She is scheduled to ~ at ~.
The meeting/task is on ~.
According to the work schedule, ~ comes first.
He/She will be working in/at ~.
The shift starts at ~ and ends at ~.
''',
          koreanNote: '업무 스케줄표에서 근무 시간, 할 일, 순서를 답할 때 쓰는 템플릿',
          tip: 'scheduled to, shift, task, comes first 표현을 템플릿화하면 좋아요.',
        );

      case 'part4_interview':
        return const _TemplateContent(
          englishTemplate: '''
[인터뷰 템플릿]

The interview is scheduled for ~.
It will take place at ~.
The applicant will meet ~.
According to the schedule, the interview lasts for ~.
He/She needs to arrive by ~.
''',
          koreanNote: '면접 시간, 장소, 면접관, 소요 시간 질문에 쓰는 템플릿',
          tip: 'scheduled for, take place, arrive by 같은 표현을 반복해서 익혀두세요.',
        );

      case 'part4_meeting':
        return const _TemplateContent(
          englishTemplate: '''
[미팅 템플릿]

The meeting starts at ~.
It will be held in ~.
The participants include ~.
The topic of the meeting is ~.
According to the schedule, it will last until ~.
''',
          koreanNote: '회의 시간, 장소, 참석자, 주제 관련 응답용 템플릿',
          tip: 'participants, topic, held in 같은 표현이 자주 나와요.',
        );

      case 'part4_trip':
        return const _TemplateContent(
          englishTemplate: '''
[출장 일정표 템플릿]

The flight/train leaves at ~.
It arrives at ~.
He/She will depart from ~.
The ticket is for ~.
According to the itinerary, he/she will stay in ~ for ~ days.
''',
          koreanNote: '비행기·기차 출장 일정에서 출발, 도착, 탑승, 체류 정보를 답할 때 쓰는 템플릿',
          tip: 'leave, arrive, depart from, itinerary 표현을 세트로 정리하면 편해요.',
        );

      case 'part4_travel':
        return const _TemplateContent(
          englishTemplate: '''
[여행 일정표 템플릿]

The tour starts on ~.
They will visit ~ first.
According to the itinerary, lunch is at ~.
They will stay at ~.
The trip ends on ~.
''',
          koreanNote: '여행 일정표에서 방문 순서, 식사 시간, 숙소, 종료일을 답할 때 쓰는 템플릿',
          tip: 'visit, stay at, itinerary, ends on 표현을 묶어두세요.',
        );

      case 'part4_program':
        return const _TemplateContent(
          englishTemplate: '''
[프로그램 소개 템플릿]

The program is for ~.
It begins at ~.
Participants will learn about ~.
According to the information, ~ is included.
The program fee is ~.
''',
          koreanNote: '프로그램 대상, 시작 시간, 포함 내용, 비용 질문에 쓰는 템플릿',
          tip: 'for~, begins at, included, fee 표현이 자주 활용돼요.',
        );

      case 'part5_master':
        return const _TemplateContent(
          englishTemplate: '''
I think / agree / disagree with the statement that ~
I have some reasons to support my opinion.
Most of all / First, ~
Nowadays, ~
It will improve ~
It is useful and helpful because ~
By -ing, ~
For example, in my case, ~
For this reason, I ~
''',
          koreanNote: 'Part 5에서 입장 → 이유 → 예시 → 결론 흐름으로 말할 수 있는 만능 템플릿',
          tip: '문장 전체를 외우기보다 “시작 문장”, “이유 문장”, “예시 문장”, “결론 문장” 블록으로 끊어 외우면 좋아요.',
        );

      case 'part5_topics':
        return const _TemplateContent(
          englishTemplate: '''
[생활 / 교육]
They can learn new things.
They can meet new people and expand their network.
They can broaden their mind.
Creativity is crucial in today’s education.

[경쟁사회 / 팀워크]
Nowadays, the business environment is very tough.
Competition is really high in our society.
They can communicate with others better.
They can make a friendly atmosphere.

[노인 / 생활비 / 일]
They have a lot of experience, so they can give a lot of advice.
The cost of living is too high.
I can get a higher salary.
It’s a waste of money.

[환경 / 정부]
We should care about the environment.
Climate change is a serious problem.
It can improve the quality of life.
Walking or biking is better for the environment.

[인터넷 / 정보]
Thanks to technology, we can save time and energy.
It’s so convenient.
There’s a lot of information on the internet and social media.
There’s a lot of wrong information on the internet, so I cannot trust it.

[혼자 / 같이]
They can focus better.
They can have more freedom.
It’s fun and entertaining.
It’s hard to arrange the schedule.
''',
          koreanNote: 'Part 5에서 생활·교육, 팀워크, 환경, 인터넷, 혼자/같이 같은 주제에 바로 붙일 수 있는 참고 문장 모음',
          tip: '주제별로 3~4개만 먼저 외우고, 만능 템플릿의 이유/예시 자리에 끼워 넣는 식으로 연습하면 효율적이에요.',
        );

      default:
        return const _TemplateContent(
          englishTemplate: '준비 중인 템플릿입니다.',
          koreanNote: '다음 단계에서 내용을 추가할 수 있어요.',
          tip: '필요한 파트부터 하나씩 확장하면 됩니다.',
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final content = _getContent();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          templateTitle,
          style: textTheme.titleLarge,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(partName, style: textTheme.bodySmall),
              const SizedBox(height: 6),
              Text(templateTitle, style: textTheme.headlineMedium),
              const SizedBox(height: 20),
              _SectionCard(
                title: '영어 템플릿',
                child: SelectableText(
                  content.englishTemplate,
                  style: textTheme.bodyLarge?.copyWith(height: 1.7),
                ),
              ),
              const SizedBox(height: 16),
              _SectionCard(
                title: '한글 설명',
                child: Text(
                  content.koreanNote,
                  style: textTheme.bodyLarge,
                ),
              ),
              const SizedBox(height: 16),
              _SectionCard(
                title: '정리 팁',
                child: Text(
                  content.tip,
                  style: textTheme.bodyLarge?.copyWith(
                    color: AppColors.textSecondary,
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

class _SectionCard extends StatelessWidget {
  final String title;
  final Widget child;

  const _SectionCard({
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
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
          Text(title, style: textTheme.titleLarge),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }
}

class _TemplateContent {
  final String englishTemplate;
  final String koreanNote;
  final String tip;

  const _TemplateContent({
    required this.englishTemplate,
    required this.koreanNote,
    required this.tip,
  });
}