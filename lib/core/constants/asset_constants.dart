class AssetContants {
  static AssetContants? _instace;
  static AssetContants get instance {
    _instace ??= AssetContants._init();
    return _instace!;
  }

  AssetContants._init();

  final imagePath = 'assets/images/';
  final iconPath = 'assets/icons/';
  final textPath = 'assets/texts/';
}
