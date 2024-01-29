part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}


class HomeLoadedState extends HomeState{
  HomeModel? homeModel;

  HomeLoadedState({this.homeModel});

  @override

  List<Object?> get props => [homeModel];

}

class HomeErrorState extends HomeState{
  String? erMsg;

  HomeErrorState({this.erMsg});

  @override

  List<Object?> get props => [erMsg];


}


