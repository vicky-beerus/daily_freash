import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dailyfreash/HOME_SCREEN/model/home_model.dart';
import 'package:equatable/equatable.dart';

import '../repo/home_repo.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeRepository homeRepository;
  HomeBloc({required this.homeRepository}) : super(HomeInitial()) {

    on(_onGetData);


  }




  _onGetData(HomeLoadedEvent event , Emitter<HomeState> emit)async{

    try{
      final homeModel = await  homeRepository.getData();
      emit(HomeLoadedState(homeModel: homeModel));
    }catch(e){
      emit(HomeErrorState(erMsg: e.toString()));
    }

  }





}
