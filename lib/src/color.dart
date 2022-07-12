///  The names of the colors of the cube facelets.
enum Color {
  /// Up face color.
  up,

  /// Right face color.
  right,

  /// Front face color.
  front,

  /// Down face color.
  down,

  /// Left face color.
  left,

  /// Back face color.
  back,
}

const _colorByLetter = {
  'U': Color.up,
  'R': Color.right,
  'F': Color.front,
  'D': Color.down,
  'L': Color.left,
  'B': Color.back,
};

const _letterByColor = {
  Color.front: 'F',
  Color.right: 'R',
  Color.back: 'B',
  Color.left: 'L',
  Color.up: 'U',
  Color.down: 'D',
};

/// Gets the [Color] from a representation [letter].
Color colorFromString(String letter) {
  if (_colorByLetter.containsKey(letter)) {
    return _colorByLetter[letter]!;
  } else {
    throw ArgumentError('Invalid color letter: $letter');
  }
}

/// Gets the representation letter from a [color].
String stringFromColor(Color color) => _letterByColor[color]!;
