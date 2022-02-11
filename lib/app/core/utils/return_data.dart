class ReturnData<T> {
  ReturnData(this.success, {this.data, this.message});
  bool success = false;
  String? message = "";
  T? data;
}