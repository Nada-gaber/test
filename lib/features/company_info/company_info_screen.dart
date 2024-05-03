import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test/core/states/api_states.dart';
import 'package:test/features/company_info/cubit/company_cubit.dart';
import 'package:test/features/company_info/cubit/states.dart';
import 'package:test/features/company_info/repo/repo.dart';
import 'package:test/features/company_info/widgets/appbar.dart';
import 'package:test/features/company_info/widgets/buildin.dart';
import 'package:test/features/company_info/widgets/icon.dart';
import '../../core/web services/web_services.dart';
import 'model/companyinfo_model.dart';


Dio dio = Dio();
WebServices webServices = WebServices(dio);
CompanyRepository companyRepository = CompanyRepository(webServices);
final cubit = CompanyCubit(companyRepository);
class CompanyInfoScreen extends StatefulWidget {
  const CompanyInfoScreen({super.key});

  @override
  State<CompanyInfoScreen> createState() => _CompanyInfoScreenState();
}

class _CompanyInfoScreenState extends State<CompanyInfoScreen> {
  @override
  void initState() {
    super.initState();
    cubit.fetchCompanyInfo();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CompanyCubit>(
      create: (context) => cubit,
      child: BlocConsumer<CompanyCubit, CompanyInfoState>(
        listener: (context, state) {
          if (state is Error<CompanyInfo>) {
            final errorState = state; 
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Error: $errorState'),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is CompanyInitial) {
            return const Center(
                child: CircularProgressIndicator(
                    backgroundColor: Color.fromARGB(255, 63, 132, 230),
                    color: Colors.red));
          } else if (state is CompanyLoading) {
            return const Center(
                child: CircularProgressIndicator(
                    backgroundColor: Color.fromARGB(255, 118, 158, 214),
                    color: Colors.amber));
          } else if (state is CompanyLoaded) {
            final companyInfo = state.companyInfo;
            return Scaffold(
              backgroundColor: const Color(0xff061428),
              appBar: companyInfoAppBar(context),
              body: SingleChildScrollView(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      textStyle('${companyInfo.ceo}', 25),
                      textStyle('ceo of spaceX', 15,
                          fontWeight: FontWeight.w400),
                      const SizedBox(height: 35),
                      Row(
                        children: [
                          buildInfoColumn(
                              '${companyInfo.employees}', 'employees'),
                          buildInfoColumn('${companyInfo.vehicles}', 'launch'),
                          buildInfoColumn('${companyInfo.founded}', 'founded'),
                        ],
                      ),
                      const SizedBox(height: 30),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomIconButton(
                            icon: FontAwesomeIcons.twitter,
                            color: Colors.white,
                            size: 30,
                            isFontAwesomeIcons: true,
                            backgroundColor: Colors.transparent,
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                    ],
                  ),
                ),
              ),
            );
          } else if (state is Error<CompanyInfo>) {
            return const Text('Error fetching company info.');
          } else {
            return Text('Unexpected state: $state');
          }
        },
      ),
    );
  }
}
