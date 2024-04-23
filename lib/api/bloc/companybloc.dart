

// import 'package:bloc/bloc.dart';
// import 'package:test/api/model/company.dart';

// import '../repo/repocompany.dart';


// class CompanyInfoEvent extends Event {}

// class FetchCompanyInfo extends CompanyInfoEvent {}

// class CompanyInfoState extends BlocState {
//   final bool isLoading;
//   final CompanyInfo? companyInfo;
//   final String? error;

//   const CompanyInfoState({
//     this.isLoading = false,
//     this.companyInfo,
//     this.error,
//   });

//   @override
//   List<Object> get props => [isLoading, companyInfo, error ?? ''];
// }

// class CompanyInfoBloc extends Bloc<CompanyInfoEvent, CompanyInfoState> {
//   final CompanyRepository _companyRepository;

//   CompanyInfoBloc(this._companyRepository) : super(const CompanyInfoState()) {
//     on<FetchCompanyInfo>((event, emit) async {
//       emit(const CompanyInfoState(isLoading: true));
//       try {
//         final companyInfo = await _companyRepository.getCompanyInfo();
//         emit(CompanyInfoState(companyInfo: companyInfo));
//       } catch (error) {
//         emit(CompanyInfoState(isLoading: false, error: error.toString()));
//       }
//     });
//   }
// }
