import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muze/modules/news/app/cubits/news_state.dart';
import 'package:muze/modules/news/repositories/news_domain_repository.dart';

class NewsCubit extends Cubit<NewsState> {
  final NewsDomainRepository newsDomainRepository;
  NewsCubit({required this.newsDomainRepository}) : super(const NewsState());
}
