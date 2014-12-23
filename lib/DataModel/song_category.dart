part of songslist;

// Enumeration of the song category
class SongCategory {
  final _value;
  const SongCategory._internal(this._value);
  toString() => 'Enum.$_value';

  static const ROCK = const SongCategory._internal('ROCK');
  static const CLASSIC = const SongCategory._internal('CLASSIC');
}