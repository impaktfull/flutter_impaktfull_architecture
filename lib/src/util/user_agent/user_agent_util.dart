import 'user_agent_util_io.dart'
    if (dart.library.html) 'user_agent_util_web.dart';

String? getUserAgent() {
  return getPlatformUserAgent();
}
