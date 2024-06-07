library service_registry;

import 'package:salescode_sdk/salescode_sdk.dart';

class ServiceRegistry {
  /// The map containing all registered services
  static final Map<String, dynamic> _services = {};

  /// An unmodifiable map with all registered services
  static Map<String, dynamic> get services => Map.unmodifiable(_services);

  /// Register a service.
  ///
  /// Registers the given [service] for the given [type], overwriting any previously registered service for the type
  ///
  static T registerService<T extends Loader>(T service) {
    //TODO somehow check that service *is* an instance of type
    _services[service.name] = service;
    return service;
  }

  /// Get a previously registered service.
  ///
  /// Throws an [AssertError] if there is no registered service for the given [serviceType]
  static T getService<T>(String serviceName) {
    dynamic service = _services[serviceName];
    assert(service != null, "Service of type $T was not previously registered");
    return _services[serviceName];
  }

  /// Whether a service of the given [serviceType] was previously registered
  ///
  /// This is an utility method as calling [getService] could throw an exception.
  static bool hasService(String serviceName) {
    return _services.isNotEmpty && _services[serviceName] != null;
  }

  /// Clear all the registered services
  static void clear() {
    _services.clear();
  }
}
