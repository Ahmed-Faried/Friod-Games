import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Components/components.dart';
import '../Screens/BottomBar/GamesScreen/GamesScreen.dart';
import '../Screens/BottomBar/ProfileScreen/ProfileScreen.dart';
import '../Screens/ChooseAvatar/ChooseAvatar.dart';
import 'HomePageStates.dart';

class HomePageCubit extends Cubit<HomePageStates>{
  HomePageCubit() : super(initialStateHomeDoctorApp());


  static HomePageCubit get(context){
    return BlocProvider.of(context);
  }



  // Home page Doctor Screen
  var searchController = TextEditingController();
  var enterCodeController = TextEditingController();


  //
  // addNIDPatient({
  //  required DoctorID ,
  //   required NID_PAtient,
  //
  // }) {
  //   emit(addNID_Patient_LoadingState());
  //
  //   DioHelper.update(
  //       path: "$UpdateDoctorAddNIDPatient$DoctorID",
  //       data: {
  //         'pId': [NID_PAtient],
  //       }
  //   ).then((value) async {
  //
  //
  //     doctorDataModel = DoctorDataModel.fromJson(value.data);
  //     print("add NID tamam");
  //
  //     emit(addNID_Patient_SuccessState());
  //   }).catchError((onError) {
  //     if (onError is DioError) {
  //       if (onError.response != null) {
  //         // يمكن الوصول إلى البياناتالتي تم إرجاعها من الخادم باستخدام onError.response.data
  //         print(onError.response?.data);
  //         print(onError.toString());
  //         print(onError.type.name);
  //
  //       } else {
  //         print(onError.message);
  //       }
  //     } else {
  //       print(onError.toString());
  //     }
  //     toastShow(msg: "error add NID  ", state: toastStates.ERROR);
  //     emit(addNID_Patient_ErrorState());
  //   });
  // }
  //



  //index of NavigationBar
  int x = 0 ;



  List<Widget> BottomBarScreens =
  [
    GamesScreen(),

    ProfileScreen(),

  ];




  //function of ChangedBottomNavigationBar
  void changedBottomBar(int index){
    x = index ;
    emit(changebottomNavbar());
  }


  //valuable of ChangedDarkMode
   bool? isDark = false  ;     //isdark ;

  //function of ChangedDarkMode
   void changedMode()  {
    print(isDark);
    if( isDark == true) {
      isDark = false;
      emit(NotDarkMode());
    }else{
      isDark = true;
       emit(DarkMode());
    }

    print(isDark);
    emit(changedDarkMode());
  }


  nana(context ,Widget){

    navigateTo(context, Widget) ;
    emit(EditState());
 }

}