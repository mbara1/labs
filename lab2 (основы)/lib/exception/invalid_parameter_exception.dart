class InvalidParameterException implements Exception {
  String cause;
  InvalidParameterException(this.cause);

  @override
  String toString() {
    return 'InvalidParameterException: $cause';
  }
}
