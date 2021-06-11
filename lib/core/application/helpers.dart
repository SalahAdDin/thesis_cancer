String getInitials(String string) => string.isNotEmpty
    ? string.trim().split(' ').map((String l) => l[0]).take(2).join()
    : '';
