String formatBalance(double? balance) {
  if (balance == null) {
    return "0.00";
  }

  // Divide the balance by 100 to get the correct value
  double formattedBalance = balance / 100.0;

  // Convert the balance to a string with 2 decimal places
  String balanceString = formattedBalance.toStringAsFixed(2);

  List<String> parts = balanceString.split('.');
  String integerPart = parts[0];
  String decimalPart = parts.length > 1 ? "." + parts[1] : "";

  String formattedIntegerPart = '';
  int count = 0;
  for (int i = integerPart.length - 1; i >= 0; i--) {
    count++;
    formattedIntegerPart = integerPart[i] + formattedIntegerPart;
    if (count == 3 && i > 0) {
      formattedIntegerPart = ',' + formattedIntegerPart;
      count = 0;
    }
  }

  return formattedIntegerPart + decimalPart;
}