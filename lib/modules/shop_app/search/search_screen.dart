import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/modules/shop_app/search/cubit/cubit.dart';
import 'package:untitled/modules/shop_app/search/cubit/states.dart';
import 'package:untitled/shared/components/components.dart';

class Search_Screen extends StatelessWidget {
  var formKey=GlobalKey<FormState>();
  var searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>SearchCubit(),
      child: BlocConsumer<SearchCubit,SearchStates>(
        listener: (context,state){},
        builder:(context,state){

          return Scaffold(
            appBar: AppBar(),
            body:Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children:
                  [
                   defaultFormFiled(
                     controller: searchController,
                       type: TextInputType.text,
                       validate: (String? value)
                       {
                         if(value!.isEmpty)
                           {
                             return 'enter text to search';
                           }
                         return null;
                       },
                     OnSubmit: (String text)
                     {
                       SearchCubit.get(context).search(text);
                     },
                       label: 'Search',
                       prefix: Icons.search,
                   ),
                    SizedBox(
                      height: 10.0,
                    ),
                    if(state is SearchLoadingState)
                      LinearProgressIndicator(),
                   if(state is SearchSuccessState)
                     Expanded(
                     child: ListView.separated(
                                   itemBuilder: (context,index)=>buildListProduct(SearchCubit.get(context).model!.data!.data?[index],context,isOldPrice: false),
                                   separatorBuilder:(context,index)=>myDivider() ,
                                   itemCount: SearchCubit.get(context).model!.data!.data!.length,
                                 ),
                   ),
                  ],
                ),
              ),
            ),

          );
        } ,

      ),
    );
  }
}
