
import 'package:dailyfreash/CUSTOM_WIDGETS/gradient_appbar.dart';
import 'package:dailyfreash/HOME_SCREEN/model/home_model.dart';
import 'package:flutter/material.dart';

import '../../CART/PROVIDER/cart_provider.dart';
import '../../CART/view/cart_batch.dart';
import '../../CUSTOM_WIDGETS/custom_text.dart';
import 'package:provider/provider.dart';


class ProdcutcDetailScreen extends StatefulWidget {
  Data? data;





  ProdcutcDetailScreen({this.data,});

  @override
  State<ProdcutcDetailScreen> createState() => _ProdcutcDetailScreenState();
}

class _ProdcutcDetailScreenState extends State<ProdcutcDetailScreen> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.sizeOf(context).height;
    var w = MediaQuery.sizeOf(context).width;
    return Scaffold(
        appBar: GradientAppBar(
          title: "${widget.data!.productName}",


          act: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: CartBadge()
            )
          ],
        ),
      body: SingleChildScrollView(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Product Image
        Image.network(
          "${widget.data!.productSmallImg}",
          height: 200,


        ),
        // Product Name
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "${widget.data!.productName}",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // Product Price
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${widget.data!.priceList![0].productMRP}',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
             widget.data!.qty == 0?InkWell(
                onTap: () {
                  Provider.of<CartProivder>(context,listen: false).addCart(val:widget.data);
                  widget.data!.qty = 1;
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

                          int temp =  widget.data!.qty!.toInt()+1;
                          widget.data!.qty = temp;
                          setState(() {});

                        },
                        child: Icon(Icons.add_circle)),
                    SizedBox(width: w*0.01,),

                    CustomText(txt: widget.data!.qty.toString()),
                    SizedBox(width: w*0.01,),
                    InkWell(
                        onTap: () {
                          int temp =  widget.data!.qty!.toInt()-1;
                          widget.data!.qty = temp;
                          setState(() {});
                          if(widget.data!.qty == 0){
                            Provider.of<CartProivder>(context,listen: false).removeCart(val:widget.data );
                          }

                        },
                        child: Icon(Icons.remove_circle_outlined)),
                  ],
                ),
              )

            ],
          ),
        ),
        // Product Details
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "About this Product",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        // SizedBox(height: h*0.0,),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "${widget.data!.productDescription}",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        // Add to Cart Button
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: () {
              // Add to cart logic
              // You can navigate to another screen, show a dialog, etc.
            },
            child: Text('Add to Cart'),
          ),
        ),
      ],
    ),)
    );
  }
}
