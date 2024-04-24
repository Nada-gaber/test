import 'package:freezed_annotation/freezed_annotation.dart';

import 'companyinfo_model.dart';

part 'states.freezed.dart';

@freezed
abstract class CompanyInfoState with _$CompanyInfoState {
  const factory CompanyInfoState.initial() = Initial;
  const factory CompanyInfoState.loading() = Loading;
  const factory CompanyInfoState.success(CompanyInfo companyInfo) = Success;
  const factory CompanyInfoState.error(String error) = Error;
}