import 'package:app022/layout/cubit/home_states.dart';
import 'package:app022/moduls/business/business.dart';
import 'package:app022/moduls/scince/science.dart';
import 'package:app022/moduls/sport/sport.dart';
import 'package:app022/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(InitialState());
  static NewsCubit get(context) => BlocProvider.of(context);

  List<String> title = [
    'Business',
    'Sport',
    'Science',
  ];

  List<Widget> screens = [
    const BusinessScreen(),
    const SportScreen(),
    const ScienceScreen(),
  ];

  List<BottomNavigationBarItem> navBarItem = [
    const BottomNavigationBarItem(
      label: 'Business',
      icon: Icon(
        Icons.business,
      ),
    ),
    const BottomNavigationBarItem(
      label: 'Sport',
      icon: Icon(
        Icons.sports_handball_outlined,
      ),
    ),
    const BottomNavigationBarItem(
      label: 'Science',
      icon: Icon(
        Icons.science,
      ),
    ),
  ];

  int currentIndex = 0;
  void changeIndex(index) {
    currentIndex = index;
    if (index == 1) {
      getSport();
    } else if (index == 2) {
      getScience();
    } else if (index == 0) {
      getBusiness();
    }
    emit(BottomNavState());
  }

  List<dynamic> business = [];
  void getBusiness() {
    if (business.isEmpty) {
      emit(GetBusinessNewsLoading());
      DioHelper().getdata(
        path: 'v2/top-headlines',
        map: {
          'country': 'eg',
          'category': 'business',
          'apiKey': '0943403025f8450085cd31f003715127',
        },
      )?.then((value) {
        business = value.data['articles'];
        print(business[0]['title']);

        // print(value.data['articles'][0]['title']);
        emit(GetBusinessNewsSuccess());
      }).catchError((error) {
        print(error.toString());
        emit(GetBusinessNewsError(error.toString()));
      });
    } else {
      emit(GetBusinessNewsSuccess());
    }
  }

  List<dynamic> science = [];
  void getScience() {
    if (science.isEmpty) {
      emit(GetScienceNewsLoading());
      DioHelper().getdata(
        path: 'v2/top-headlines',
        map: {
          'country': 'eg',
          'category': 'science',
          'apiKey': '0943403025f8450085cd31f003715127',
        },
      )?.then((value) {
        science = value.data['articles'];
        print(science[0]['title']);

        // print(value.data['articles'][0]['title']);
        emit(GetScienceNewsSuccess());
      }).catchError((error) {
        print(error.toString());
        emit(GetScienceNewsError(error.toString()));
      });
    } else {
      emit(GetScienceNewsSuccess());
    }
  }

  List<dynamic> sport = [];
  void getSport() {
    if (sport.isEmpty) {
      emit(GetSportNewsLoading());
      DioHelper().getdata(
        path: 'v2/top-headlines',
        map: {
          'country': 'eg',
          'category': 'sport',
          'apiKey': '0943403025f8450085cd31f003715127',
        },
      )?.then((value) {
        sport = value.data['articles'];
        print(sport[0]['title']);

        // print(value.data['articles'][0]['title']);
        emit(GetSportNewsSuccess());
      }).catchError((error) {
        print(error.toString());
        emit(GetSportNewsError(error.toString()));
      });
    } else {
      emit(GetSportNewsSuccess());
    }
  }



    List<dynamic> sreach = [];
  void getSearch(String key) {
   
      emit(GetSearchNewsLoading());
      DioHelper().getdata(
        path: 'v2/everything',
        map: {
          'q': key,
          
          'apiKey': '0943403025f8450085cd31f003715127',
        },
      )?.then((value) {
        sreach = value.data['articles'];
        print(sreach[0]['title']);

        // print(value.data['articles'][0]['title']);
        emit(GetSearchNewsSuccess());
      }).catchError((error) {
        print(error.toString());
        emit(GetSearchNewsError(error.toString()));
      });
    
  }
}
 // https://newsapi.org/v2/everything?q=tesla&apiKey=0943403025f8450085cd31f003715127