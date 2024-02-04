enum SearchCategoryType {
  artist,
  user,
  music,
}

extension SearchCategoryTypeName on SearchCategoryType {
  String get name {
    switch (this) {
      case SearchCategoryType.artist:
        return "Artiste";
      case SearchCategoryType.user:
        return "Utilisateurs";
      case SearchCategoryType.music:
        return "Morceaux";
    }
  }
}
