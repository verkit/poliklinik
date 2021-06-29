class Validation {
  static required(val) {
    if (val.isEmpty) return 'Harus diisi';
  }
}
