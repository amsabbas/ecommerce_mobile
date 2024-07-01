extension DoubleExtension on double {
  String roundDouble() {
    RegExp regex = RegExp(r'([.]*0)(?!.*\d)');
    return toString().replaceAll(regex, '');
  }
}
