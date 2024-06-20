/// The names of the corner positions of the cube.
enum Corner {
  /// Up-Right-Front corner.
  upRightFront,

  /// Up-Left-Front corner.
  upFrontLeft,

  /// Up-Left-Back corner.
  upLeftBack,

  /// Up-Right-Back corner.
  upBackRight,

  /// Down-Right-Front corner.
  downFrontRight,

  /// Down-Left-Front corner.
  downLeftFront,

  /// Down-Left-Back corner.
  downBackLeft,

  /// Down-Right-Back corner.
  downRightBack;

  /// Number of corners of the cube.
  static const count = 8;
}
