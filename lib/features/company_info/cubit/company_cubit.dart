import 'package:bloc/bloc.dart';
import 'package:test/core/states/api_states.dart';
import 'package:test/features/company_info/model/companyinfo_model.dart';
import 'package:test/features/company_info/repo/repo.dart';

class CompanyCubit extends Cubit<ApiState<CompanyInfo>> {
  final CompanyRepository companyRepository;

  CompanyCubit({required this.companyRepository})
      : super(const Initial<CompanyInfo>());

  Future<void> fetchCompanyInfo() async {
    emit(const Loading<CompanyInfo>());
    try {
      final companyInfo = await companyRepository.getCompanyInfo();
      emit(Success<CompanyInfo>(companyInfo));
    } on Exception catch (error) {
      emit(Error<CompanyInfo>(error.toString()));
    }
  }
}
