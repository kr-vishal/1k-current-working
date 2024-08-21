import 'package:goscore/models/stadium.dart';
import 'package:goscore/models/team.dart';

class Match {
  final int id;
  final String matchDate;
  final Team homeTeam;
  final Team awayTeam;
  final Map<dynamic, dynamic> referee;
  final Map<dynamic, dynamic> league;
  final Stadium stadium;
  final int homeTeamScore;
  final int awayTeamScore;
  final String matchStatus;
  final DateTime createdAt;
  final DateTime updatedAt;

  Match(
      this.id,
      this.matchDate,
      this.homeTeam,
      this.awayTeam,
      this.referee,
      this.league,
      this.stadium,
      this.homeTeamScore,
      this.awayTeamScore,
      this.matchStatus,
      this.createdAt,
      this.updatedAt);

  factory Match.fromJson(Map<dynamic, dynamic> json) => Match(
      json['id'],
      json['match_date'],
      Team.fromJson(json['home_team']),
      Team.fromJson(json['away_team']),
      json['referee'],
      json['league'],
      Stadium.fromJson(json['stadium']),
      json['home_team_score'],
      json['away_team_score'],
      json['match_status'],
      DateTime.parse(json['created_at']),
      DateTime.parse(json['updated_at']));

  bool isLive() {
    return matchStatus == "in_progress";
  }
}
