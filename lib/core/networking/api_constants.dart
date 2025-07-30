class ApiConstants {
  static const String apiBaseUrl = 'http://192.168.1.160:92/api/';  /// here will add local link
  static const String loginEndpoint = 'Auth/login';
  static const String barcodeEndpoint = 'Item/api/item/by-barcode?barcode=WHP34%2F027.24.00917';
  static const String customerEndpoint = 'Customer/api/customer/list';
  static const String warehouseEndpoint = 'Warehouse/api/warehouse/list';
  static const String salesEndpoint = 'Sales/create';
}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}
