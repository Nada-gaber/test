import 'package:meta/meta.dart';
import '../model/companyinfo_model.dart';

@immutable
abstract class CompanyInfoState {}

class CompanyInitial extends CompanyInfoState {}

class CompanyLoading extends CompanyInfoState {}

class CompanyLoaded extends CompanyInfoState {
    final CompanyInfo companyInfo;

  CompanyLoaded(this.companyInfo);
}

class CompanyError extends CompanyInfoState {
  final String error;

  CompanyError(this.error);
}
