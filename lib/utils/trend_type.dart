enum TrendType {
  popular,
  topRated,
  upcoming,
  nowPlaying,
}

extension TrendTypeExtension on TrendType {
  String get value =>
      {
        TrendType.popular: 'popular',
        TrendType.topRated: 'top_rated',
        TrendType.upcoming: 'upcoming',
        TrendType.nowPlaying: 'now_playing',
      }[this] ??
      'popular';
}
