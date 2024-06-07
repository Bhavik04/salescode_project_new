// ignore_for_file: public_member_api_docs, sort_constructors_first
enum StorageKey {
  token,
  authToken,
  missedDeepLink,
  loginId,
  bgNotification,
  deviceInfoTime,
  lastSyncedTime,
  readNotifications,
  none,
  sessionId,
  requestId,
  deviceRestricted,
  attemptsLeft,
  timeLeft,
  latestPrivacyTimestamp,
  notificationNavigationParam,
  lastRecordedVersion,
  appVersion,
  phoneNumber,
  deviceId,
  cordovaMigration,
  isLogoutLocked,
  locationPermissionDenied,
  syncReloadTime,
  logout,
  sellerCode,
  storeCodeONDC,
  sellerNameONDC,
  authTokenONDC,
  loginIdONDC,
  isRecommendedOrderFirstTimeInitialised,
  lastModifiedOrderTime,
  immediateParentName,
  marketOperationalId,
  accountLocked,
  UUID,
  latitude,
  longitude,
  accuracy,
  userName,
  mobileNumber,
  oldSelectedLocale,
  lastOrderPlace,
  oldLoginId,
  orderResponseData,
  orderPlacerTime,
  orderResponseExpireData,
  devicePause,
  retrieveLostData,
  locationStored,
  locateMePath,
  orderSupplier,
  orderCancellationRemainingTime,
  tabFilters,
  sellerLoginId,
  sellerMobile,
  isStoreCreated,
  tokenONDC,
  sessionIdONDC,
  emailONDC,
  storeNameONDC,
  kycTransactionId,
  kycStatus,
  kycDetails,
  bankErrorMessage,
  gstErrorMessage,
  lastNotificationCheck,
  outletMappingImage,
  useMobileNumber,
  editAccess,
  orderSeqNo,
  uniqueOrderNumbers,
  userType,
  ondcTabFilters,
  consumerId,
  consumerAddress,
  appType,
  consumerName
}

class StorageItem {
  StorageKey key;
  String value;
  StorageItem({
    required this.key,
    required this.value,
  });
}

StorageKey getStorageKeyFromString(String value) {
  for (StorageKey enumValue in StorageKey.values) {
    if (enumToString(enumValue) == value) {
      return enumValue;
    }
  }
  // Handle the case when the string does not correspond to any enum value
  return StorageKey.none;
}

String enumToString(StorageKey enumValue) {
  return enumValue.toString().split('.').last;
}
