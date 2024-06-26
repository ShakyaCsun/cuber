import 'dart:math';

import 'package:cuber/src/color.dart';
import 'package:equatable/equatable.dart';

/// Represents a move necessary to solve the cube
/// using Herbert Kociemba's two-phase algorithm.
class Move extends Equatable {
  /// Creates a [Move] instance of a cube face [color],
  /// and if the turn is [inverted] or [double].
  const Move(
    this.color, {
    this.inverted = false,
    this.double = false,
  }) : assert(
          !inverted || !double,
          'Inverted and double both cannot be true.\n'
          '(double: true & inverted: true) == (double: true & inverted: false)'
          ' and we prefer to have (double: true and inverted: false)',
        );

  /// Parses a [move] from [String].
  factory Move.parse(String move) {
    if (move.isEmpty || move.length > 2) {
      throw ArgumentError('Invalid move: $move');
    }

    final letter = move[0].toUpperCase();
    final inverted = move.length > 1 && move[1] == "'";
    final double = move.length > 1 && move[1] == '2';
    final color = Color.of(letter);

    return Move(color, inverted: inverted, double: double);
  }

  /// Generates a random [Move].
  factory Move.random() {
    final n = _random.nextInt(18);
    final color = n ~/ 3;
    final inverted = n % 3 == 2;
    final double = n % 3 == 1;

    return Move(
      Color.values[color],
      inverted: inverted,
      double: double,
    );
  }

  /// The color of the cube face.
  final Color color;

  /// The direction of the move.
  final bool inverted;

  /// The double turn.
  final bool double;

  /// Front clockwise move.
  static const front = Move(Color.front);

  /// Up clockwise move.
  static const up = Move(Color.up);

  /// Right clockwise move.
  static const right = Move(Color.right);

  /// Left clockwise move.
  static const left = Move(Color.left);

  /// Back clockwise move.
  static const back = Move(Color.back);

  /// Down clockwise move.
  static const down = Move(Color.down);

  /// Front counterclockwise move.
  static const frontInv = Move(Color.front, inverted: true);

  /// Up counterclockwise move.
  static const upInv = Move(Color.up, inverted: true);

  /// Right counterclockwise move.
  static const rightInv = Move(Color.right, inverted: true);

  /// Left counterclockwise move.
  static const leftInv = Move(Color.left, inverted: true);

  /// Back counterclockwise move.
  static const backInv = Move(Color.back, inverted: true);

  /// Down counterclockwise move.
  static const downInv = Move(Color.down, inverted: true);

  /// Front double turn move.
  static const frontDouble = Move(Color.front, double: true);

  /// Up double turn move.
  static const upDouble = Move(Color.up, double: true);

  /// Right double turn move.
  static const rightDouble = Move(Color.right, double: true);

  /// Left double turn move.
  static const leftDouble = Move(Color.left, double: true);

  /// Back double turn move.
  static const backDouble = Move(Color.back, double: true);

  /// Double double turn move.
  static const downDouble = Move(Color.down, double: true);

  /// The available moves.
  static const values = [
    up,
    right,
    front,
    down,
    left,
    back,
    upInv,
    rightInv,
    frontInv,
    downInv,
    leftInv,
    backInv,
    upDouble,
    rightDouble,
    frontDouble,
    downDouble,
    leftDouble,
    backDouble,
  ];

  static final _random = Random();

  /// Inverts the [Move].
  Move inverse() {
    return double ? this : Move(color, inverted: !inverted);
  }

  @override
  String toString() {
    final a = color.letter;
    final b = inverted ? "'" : (double ? '2' : '');
    return '$a$b';
  }

  @override
  List<Object> get props => [color, inverted, double];
}
