getFlashPercent(price, discount) {
  double percent = (price - discount) / price * 100;
  return percent.ceilToDouble();
}
