// ignore_for_file: unused_import
import 'package:core/common_widgets/my_smooth_page_indicator.dart';
import 'package:core/common_widgets/show_my_progress_indicator.dart';
import 'package:core/constants/collection_path.dart';
import 'package:core/extensions/cupertino_text_theme_data_extension.dart';
import 'package:core/extensions/go_router_extension.dart';
import 'package:core/features/ads/application/ads_providers.dart';
import 'package:core/features/ads/presentation/my_adaptive_banner_ad.dart';
import 'package:core/features/authentication/application/firebase_user_providers.dart';
import 'package:core/features/authentication/application/my_auth_provider.dart';
import 'package:core/features/authentication/presentation/my_auth_provider_button.dart';
import 'package:core/features/authentication/presentation/my_auth_provider_buttons.dart';
import 'package:core/features/configure/application/configure_providers.dart';
import 'package:core/features/configure/application/configure_route.dart';
import 'package:core/features/configure/application/device_info_providers.dart';
import 'package:core/features/configure/application/package_info_providers.dart';
import 'package:core/features/configure/application/remote_config_providers.dart';
import 'package:core/features/configure/application/service_status_providers.dart';
import 'package:core/features/configure/application/shared_preferences_providers.dart';
import 'package:core/features/configure/domain/configure_item.dart';
import 'package:core/features/configure/domain/service_status.dart';
import 'package:core/features/configure/presentation/about_this_app_page.dart';
import 'package:core/features/configure/presentation/configure_list_tile.dart';
import 'package:core/features/configure/presentation/configure_page.dart';
import 'package:core/features/configure/presentation/failed_run_app_page.dart';
import 'package:core/features/configure/presentation/my_license_page.dart';
import 'package:core/features/configure/presentation/service_down_page.dart';
import 'package:core/features/configure/presentation/update_app_page.dart';
import 'package:core/features/configure/presentation/user_info_page.dart';
import 'package:core/features/feedback/application/feedback_providers.dart';
import 'package:core/features/feedback/application/ja_feedback_localizations.dart';
import 'package:core/features/feedback/domain/feedback_attachment.dart';
import 'package:core/features/feedback/domain/feedback_comment.dart';
import 'package:core/features/feedback/domain/feedback_data.dart';
import 'package:core/features/feedback/domain/feedback_device_info.dart';
import 'package:core/features/feedback/domain/feedback_extras.dart';
import 'package:core/features/feedback/domain/feedback_from.dart';
import 'package:core/features/feedback/domain/feedback_status.dart';
import 'package:core/features/feedback/domain/feedback_type.dart';
import 'package:core/features/feedback/presentation/my_better_feedback.dart';
import 'package:core/features/feedback/presentation/my_feedback_attach_screenshot_field.dart';
import 'package:core/features/feedback/presentation/my_feedback_device_info_field.dart';
import 'package:core/features/feedback/presentation/my_feedback_email_field.dart';
import 'package:core/features/feedback/presentation/my_feedback_message_field.dart';
import 'package:core/features/feedback/presentation/my_feedback_sheet.dart';
import 'package:core/features/feedback/presentation/my_feedback_submit_button.dart';
import 'package:core/features/feedback/presentation/my_feedback_type_picker_field.dart';
import 'package:core/features/firebase/application/firebase_providers.dart';
import 'package:core/features/onboarding/application/sign_in_route.dart';
import 'package:core/features/onboarding/presentation/onboarding_page_base.dart';
import 'package:core/features/onboarding/presentation/sign_in_page.dart';
import 'package:core/features/onboarding/presentation/term_ack_text.dart';
import 'package:core/features/routing/domain/my_go_router_listenable.dart';
import 'package:core/features/user/application/user_providers.dart';
import 'package:core/features/user/domain/user.dart';
import 'package:core/utils/budoux.dart';
import 'package:core/utils/geo_point_converter.dart';
import 'package:core/utils/inherited_theme_detector.dart';
import 'package:core/utils/media_query_preview.dart';
import 'package:core/utils/my_logger.dart';
import 'package:core/utils/store_uri.dart';
import 'package:core/utils/timestamp_converter.dart';
import 'package:core/utils/uri_data_converter.dart';

void main() {}
