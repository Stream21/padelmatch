import 'package:flutter_riverpod/flutter_riverpod.dart';

class PersonalData {
  final String name;
  final String age;
  final String location;
  final String avatar; // base64 o URL
  const PersonalData({
    this.name = '',
    this.age = '',
    this.location = '',
    this.avatar = '',
  });

  PersonalData copyWith({
    String? name,
    String? age,
    String? location,
    String? avatar,
  }) => PersonalData(
    name: name ?? this.name,
    age: age ?? this.age,
    location: location ?? this.location,
    avatar: avatar ?? this.avatar,
  );
}

class OnboardingState {
  final int index;
  final List<String> clubs; // máx. 3
  final String level; // id de nivel
  final PersonalData personal;
  const OnboardingState({
    this.index = 0,
    this.clubs = const [],
    this.level = '',
    this.personal = const PersonalData(),
  });

  // Helpers
  bool get canProceed {
    switch (index) {
      case 0:
        return clubs.isNotEmpty;
      case 1:
        return level.isNotEmpty;
      case 2:
        return true;
      default:
        return false;
    }
  }

  OnboardingState copyWith({
    int? index,
    List<String>? clubs,
    String? level,
    PersonalData? personal,
  }) => OnboardingState(
    index: index ?? this.index,
    clubs: clubs ?? this.clubs,
    level: level ?? this.level,
    personal: personal ?? this.personal,
  );
}

class OnboardingController extends StateNotifier<OnboardingState> {
  OnboardingController() : super(OnboardingState());

  void back() {
    if (state.index > 0) {
      state = state.copyWith(index: state.index - 1);
    }
  }

  void next(int totalSteps) {
    if (state.index < totalSteps - 1) {
      state = state.copyWith(index: state.index + 1);
    }
  }

  // Mutators
  void toggleClub(String club) {
    final list = [...state.clubs];
    if (list.contains(club)) {
      list.remove(club);
    } else if (list.length < 3) {
      list.add(club);
    }
    state = state.copyWith(clubs: list);
  }

  void selectLevel(String levelId) => state = state.copyWith(level: levelId);

  void setPersonal(PersonalData data) => state = state.copyWith(personal: data);

  /// Llamar cuando termines el wizard
  Map<String, dynamic> buildPayload() => {
    'clubs': state.clubs,
    'level': state.level,
    'personal': {
      'name': state.personal.name,
      'age': state.personal.age,
      'location': state.personal.location,
      'avatar': state.personal.avatar,
    },
  };
}

final onboardingProvider =
    StateNotifierProvider<OnboardingController, OnboardingState>(
      (_) => OnboardingController(),
    );
