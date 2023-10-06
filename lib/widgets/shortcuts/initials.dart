String getInitials(String input) {
  List<String> parts = input.split(' ');
  String initials = '';

  for (String part in parts) {
    if (part.isNotEmpty) {
      initials += part[0];
      if (initials.length >= 2) {
        break;
      }
    }
  }

  return initials;
}
