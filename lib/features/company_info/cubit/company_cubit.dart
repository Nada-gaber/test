import 'package:bloc/bloc.dart';
import 'package:test/features/company_info/cubit/states.dart';
import 'package:test/features/company_info/repo/repo.dart';

class CompanyCubit extends Cubit<CompanyInfoState> {
  final CompanyRepository _companyRepository;

  CompanyCubit(this._companyRepository): super(CompanyInitial());

  Future<void> fetchCompanyInfo() async {
    emit( CompanyLoading());
    try {
      final companyInfo = await _companyRepository.getCompanyInfo();
      emit(CompanyLoaded(companyInfo ));
    } on Exception catch (error) {
      emit(CompanyError(error.toString()));
    }
  }
}

// class CompanyCubit extends Cubit<ApiState<CompanyInfo>> {
//   final CompanyRepository companyRepository;

//   CompanyCubit({required this.companyRepository})
//       : super(const Initial<CompanyInfo>());

//   Future<void> fetchCompanyInfo() async {
//     emit(const Loading<CompanyInfo>());
//     try {
//       final companyInfo = await companyRepository.getCompanyInfo();
//       emit(Success<CompanyInfo>(companyInfo));
//     } on Exception catch (error) {
//       emit(Error<CompanyInfo>(error.toString()));
//     }
//   }
// }
