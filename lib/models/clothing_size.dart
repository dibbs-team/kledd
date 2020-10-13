class ClothingSize {
  final _size;

  ClothingSize.fromString(String size) : this._size = size;

  ClothingSize.fromInt(int size) : this._size = size;

  String getSizeAsString() {
    return _size.toString();
  }

  int getSizeAsInt() {
    if (_size is int) {
      return _size;
    } else {
      try {
        return int.parse(_size);
      } catch (error) {
        return null;
      }
    }
  }
}
