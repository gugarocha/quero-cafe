extension FormatterExtensions on double {
  String get currencyPTBR => _getCurrency(this);
}

String _getCurrency(double value) {
  final fixed = value.toStringAsFixed(2);
  final separeted = fixed.split('.');

  return 'R\$ ${separeted[0]},${separeted[1]}';
}
