import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/modules/social_app/social_login/cubit/states.dart';

class SocialLoginCubit extends Cubit<SocialLoginStates>
{
  SocialLoginCubit():super(SocialLoginInitialState());

  static SocialLoginCubit get(context)=> BlocProvider.of(context);

bool isPassword=true;
  IconData suffix=Icons.visibility_off_outlined;
  void changePassword(){
    isPassword= !isPassword;
    suffix=isPassword?Icons.visibility_off_outlined:Icons.visibility_outlined;
    emit(SocialChangePasswordVisibilityState());
  }
  void userLogin({
    required String email,
    required String password,
  })
  {
    emit(SocialLoginLoadingState());
    FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value)
    {
      print(value.user?.email);
      print(value.user?.uid);
      emit(SocialLoginSuccessState(value.user!.uid));
    }
    ).catchError((error)
    {
      emit(SocialLoginErrorState(error.toString()));
    });
  }

}