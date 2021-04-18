String getInitials(String string) => string.isNotEmpty
    ? string.trim().split(' ').map((l) => l[0]).take(2).join()
    : '';
