import 'package:bloc/bloc.dart';
import 'package:test/repo.dart';
import 'package:test/states.dart';

class CompanyCubit extends Cubit<CompanyInfoState> {
  final CompanyRepository companyRepository;

  CompanyCubit({required this.companyRepository})
      : super(const CompanyInfoState.initial());

  Future<void> fetchCompanyInfo() async {
    emit(const CompanyInfoState.loading());
    try {
      final companyInfo = await companyRepository.getCompanyInfo();
      emit(CompanyInfoState.success(companyInfo));
    } on Exception catch (e) {
      emit(CompanyInfoState.error(
          e.toString())); // Improve error handling if needed
    }
  }
}


// abstract class CompanyInfoUseCases {
//   Future<CompanyInfo> fetchCompanyInfo();
// }

// class CompanyCubit extends Cubit<CompanyInfoState> {
//   final CompanyInfoUseCases companyInfoUseCases; // Inject use case dependency

//   CompanyCubit({required this.companyInfoUseCases}) : super(CompanyInfoState.initial());

//   // Method to fetch company info and update state
//   Future<void> fetchCompanyInfo() async {
//     emit(const CompanyInfoState.loading());
//     try {
//       final companyInfo = await companyInfoUseCases.fetchCompanyInfo();
//       emit(CompanyInfoState.success(companyInfo));
//     } on Exception catch (e) {
//       emit(CompanyInfoState.error(e.toString()));
//     }
//   }
// }
