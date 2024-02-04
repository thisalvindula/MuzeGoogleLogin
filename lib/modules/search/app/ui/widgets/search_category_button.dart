import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:muze/core/locator/locator.dart';
import 'package:muze/modules/search/app/cubits/search_cubit.dart';
import 'package:muze/modules/search/app/cubits/search_state.dart';
import 'package:muze/modules/search/app/ui/utils/search_category_type.dart';
import 'package:muze/utils/app_size.dart';
import 'package:muze/utils/constants/colors.dart';

class SearchCategoryButton extends StatefulWidget {
  final SearchCategoryType type;
  const SearchCategoryButton({super.key, required this.type});

  @override
  State<SearchCategoryButton> createState() => _SearchCategoryButtonState();
}

class _SearchCategoryButtonState extends State<SearchCategoryButton> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      bloc: locator<SearchCubit>(),
      builder: (context, state) {
        return Bounceable(
          onTap: () {
            if (state.searchCategoryType != widget.type) {
              locator<SearchCubit>().changeSearchCategoryType(widget.type);
              locator<SearchCubit>().clearResult();
              locator<SearchCubit>().getResult(page: "1", search: state.search);
            }
          },
          child: Container(
            decoration: BoxDecoration(color: state.searchCategoryType == widget.type ? AppColors.primary : AppColors.lightGrey, borderRadius: BorderRadius.circular(48)),
            padding: EdgeInsets.symmetric(horizontal: AppSize.getWidth(context) / 22, vertical: AppSize.getHeight(context) / 100),
            child: Center(
              child: Text(
                widget.type.name,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 13),
              ),
            ),
          ),
        );
      },
    );
  }
}
