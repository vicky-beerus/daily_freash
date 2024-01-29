import 'package:dailyfreash/CART/view/cart_batch.dart';

import 'package:dailyfreash/CUSTOM_WIDGETS/custom_text.dart';
import 'package:dailyfreash/CUSTOM_WIDGETS/gradient_appbar.dart';
import 'package:dailyfreash/HOME_SCREEN/BLoC/home_bloc.dart';
import 'package:dailyfreash/HOME_SCREEN/repo/home_repo.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../CART/PROVIDER/cart_provider.dart';
import '../../PRODUCT_DETAILS/view/product_details_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {




  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.sizeOf(context).height;
    var w = MediaQuery.sizeOf(context).width;
    return BlocProvider(
      create: (context) => HomeBloc(
          homeRepository: RepositoryProvider.of<HomeRepository>(context))
        ..add(HomeLoadedEvent()),
      child: Scaffold(
        appBar: GradientAppBar(
          title: "daily fresh",
          lead: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          act: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: CartBadge()
            )
          ],
        ),
        body: Container(
          alignment: Alignment.center,
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeInitial) {
                return CircularProgressIndicator();
              } else if (state is HomeLoadedState) {
                return GridView.builder(
                  padding: EdgeInsets.all(10),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                    childAspectRatio: 0.8
                  ),
                  itemCount: state.homeModel!.data!.length,
                  // Set the number of items in the grid
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProdcutcDetailScreen(data: state.homeModel!.data![index])));
                      },
                      child: Card(
                        color: Colors.white,
                        surfaceTintColor: Colors.white,
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: h*0.14,
                                  width: w,
                                  child: Image.network(
                                      "${state.homeModel!.data![index].productSmallImg}",)),
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(left: 7),
                                child: CustomText(txt: "${state.homeModel!.data![index].productName}"),
                              ),
                              InkWell(
                                onTap: (){
                                  print(state.homeModel!.data![index].qty);
                                },

                                child: Chip(padding: EdgeInsets.only(left: 2,right: 2),

                                label: CustomText(txt: "${state.homeModel!.data![index].priceList![0].productWeightType}")),
                              ),
                              Container(
                                padding: EdgeInsets.all(3),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(txt: "\$${state.homeModel!.data![index].priceList![0].productMRP}"),

                                    state.homeModel!.data![index].qty == 0?InkWell(
                                      onTap: () {
                                        Provider.of<CartProivder>(context,listen: false).addCart(val:state.homeModel!.data![index] );
                                        state.homeModel!.data![index].qty = 1;
                                        setState(() {});

                                      },
                                      child: Container(


                                        alignment: Alignment.center,
                                        padding: EdgeInsets.only(left: 10, right: 10),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(color: Colors.black.withOpacity(0.7)),

                                        ),
                                        child: CustomText(txt: "Add"),
                                      ),
                                    ):
                                    Container(

                                      alignment: Alignment.center,
                                      padding: EdgeInsets.only(left: 10, right: 10),
                                      decoration: BoxDecoration(

                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: Colors.black.withOpacity(0.7)),

                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                              onTap: () {


                                               int temp =  state.homeModel!.data![index].qty!.toInt()+1;
                                               state.homeModel!.data![index].qty = temp;
                                               setState(() {});

                                              },
                                              child: Icon(Icons.add_circle)),
                                          SizedBox(width: w*0.01,),

                                          CustomText(txt: state.homeModel!.data![index].qty.toString()),
                                          SizedBox(width: w*0.01,),
                                          InkWell(
                                              onTap: () {


                                                int temp =  state.homeModel!.data![index].qty!.toInt()-1;
                                                state.homeModel!.data![index].qty = temp;
                                                setState(() {});
                                                if(state.homeModel!.data![index].qty == 0){
                                                  Provider.of<CartProivder>(context,listen: false).removeCart(val:state.homeModel!.data![index] );
                                                }

                                              },
                                              child: Icon(Icons.remove_circle_outlined)),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else if (state is HomeErrorState) {
                return CustomText(txt: state.erMsg.toString());
              }
              return SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
