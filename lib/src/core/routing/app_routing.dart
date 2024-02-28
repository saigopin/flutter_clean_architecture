import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/core/routing/app_routing_abstract/app_routing_abstract.dart';
import 'package:flutter_clean_architecture/src/core/utils/typedef/typedef.dart';
import 'package:go_router/go_router.dart';

class AppRouting implements AppRoutingAbstract {
  /// Method to navigate with/without params
  @override
  void navigate(BuildContext context, String path) => context.go(path);

  /// Method to navigate to with query parameters
  @override
  void navigateWithQueryParams(
    BuildContext context,
    String path,
    DataMap queryParameters,
  ) {
    context.go(Uri(path: path, queryParameters: queryParameters).toString());
  }

  /// Method to navigate using named route
  @override
  void namedNavigation(
    BuildContext context, {
    required String screenName,
    Map<String, String> pathParameters = const <String, String>{},
    DataMap queryParameters = const <String, dynamic>{},
    Object? extra,
  }) {
    context.goNamed(
      screenName,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      extra: extra,
    );
  }
}
