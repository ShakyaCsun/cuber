/// The names of the edge positions of the cube.
enum Edge {
  /// Up-Right edge.
  upRight,

  /// Up-Front edge.
  upFront,

  /// Up-Left edge.
  upLeft,

  /// Up-Down edge.
  upBack,

  /// Down-Right edge.
  downRight,

  /// Down-Front edge.
  downFront,

  /// Down-Left edge.
  downLeft,

  /// Down-Back edge.
  downBack,

  /// Front-Right edge.
  frontRight,

  /// Front-Left edge.
  frontLeft,

  /// Back-Left edge.
  backLeft,

  /// Back-Right edge.
  backRight;

  /// Number of edges of the cube.
  static const count = 12;
}
