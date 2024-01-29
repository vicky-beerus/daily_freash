class HomeModel {
  List<Data>? data;
  String? responseCode;
  String? responseMessage;

  HomeModel({this.data, this.responseCode, this.responseMessage});

  HomeModel.fromJson(Map<String, dynamic> json) {
    if (json['Data'] != null) {
      data = <Data>[];
      json['Data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    responseCode = json['ResponseCode'];
    responseMessage = json['ResponseMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['ResponseCode'] = this.responseCode;
    data['ResponseMessage'] = this.responseMessage;
    return data;
  }
}

class Data {
  String? discountValue;
  String? discountFlag;
  String? offerType;
  Null? decrementFlag;
  int? productId;
  String? productName;
  String? productSmallImg;
  bool? wishlistFlag;
  bool? subscriptionFlag;
  String? productDescription;
  List<PriceList>? priceList;
  List? cartList;
  bool? availabilityFlag;
  String? productMRP;
  String? pWeight;
  String? pWeightType;
  String? pSalePrice;
  int? prodPriceId;
  int? qty;
  int? minValue;
  int? maxValue;
  String? aboutProduct;
  String? productBenefits;
  String? storageUses;
  String? otherProductInfo;
  String? variableWeight;
  String? weightDetails;
  String? wPrice;
  String? wMRP;

  Data(
      {this.discountValue,
        this.discountFlag,
        this.offerType,
        this.decrementFlag,
        this.productId,
        this.productName,
        this.productSmallImg,
        this.wishlistFlag,
        this.subscriptionFlag,
        this.productDescription,
        this.priceList,
        this.cartList,
        this.availabilityFlag,
        this.productMRP,
        this.pWeight,
        this.pWeightType,
        this.pSalePrice,
        this.prodPriceId,
        this.qty,
        this.minValue,
        this.maxValue,
        this.aboutProduct,
        this.productBenefits,
        this.storageUses,
        this.otherProductInfo,
        this.variableWeight,
        this.weightDetails,
        this.wPrice,
        this.wMRP});

  Data.fromJson(Map<String, dynamic> json) {
    discountValue = json['DiscountValue'];
    discountFlag = json['DiscountFlag'];
    offerType = json['OfferType'];
    decrementFlag = json['DecrementFlag'];
    productId = json['product_id'];
    productName = json['product_name'];
    productSmallImg = json['product_small_img'];
    wishlistFlag = json['Wishlist_Flag'];
    subscriptionFlag = json['Subscription_Flag'];
    productDescription = json['ProductDescription'];
    if (json['PriceList'] != null) {
      priceList = <PriceList>[];
      json['PriceList'].forEach((v) {
        priceList!.add(new PriceList.fromJson(v));
      });
    }
    // if (json['CartList'] != null) {
    //   cartList = [];
    //   json['CartList'].forEach((v) {
    //     cartList!.add(new .fromJson(v));
    //   });
    // }
    cartList = json["CarList"];
    availabilityFlag = json['AvailabilityFlag'];
    productMRP = json['product_MRP'];
    pWeight = json['P_Weight'];
    pWeightType = json['P_Weight_type'];
    pSalePrice = json['P_SalePrice'];
    prodPriceId = json['prod_price_id'];
    qty = json['qty'];
    minValue = json['MinValue'];
    maxValue = json['MaxValue'];
    aboutProduct = json['AboutProduct'];
    productBenefits = json['ProductBenefits'];
    storageUses = json['StorageUses'];
    otherProductInfo = json['OtherProductInfo'];
    variableWeight = json['VariableWeight'];
    weightDetails = json['WeightDetails'];
    wPrice = json['WPrice'];
    wMRP = json['WMRP'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DiscountValue'] = this.discountValue;
    data['DiscountFlag'] = this.discountFlag;
    data['OfferType'] = this.offerType;
    data['DecrementFlag'] = this.decrementFlag;
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['product_small_img'] = this.productSmallImg;
    data['Wishlist_Flag'] = this.wishlistFlag;
    data['Subscription_Flag'] = this.subscriptionFlag;
    data['ProductDescription'] = this.productDescription;
    if (this.priceList != null) {
      data['PriceList'] = this.priceList!.map((v) => v.toJson()).toList();
    }
    if (this.cartList != null) {
      data['CartList'] = this.cartList!.map((v) => v.toJson()).toList();
    }
    data['AvailabilityFlag'] = this.availabilityFlag;
    data['product_MRP'] = this.productMRP;
    data['P_Weight'] = this.pWeight;
    data['P_Weight_type'] = this.pWeightType;
    data['P_SalePrice'] = this.pSalePrice;
    data['prod_price_id'] = this.prodPriceId;
    data['qty'] = this.qty;
    data['MinValue'] = this.minValue;
    data['MaxValue'] = this.maxValue;
    data['AboutProduct'] = this.aboutProduct;
    data['ProductBenefits'] = this.productBenefits;
    data['StorageUses'] = this.storageUses;
    data['OtherProductInfo'] = this.otherProductInfo;
    data['VariableWeight'] = this.variableWeight;
    data['WeightDetails'] = this.weightDetails;
    data['WPrice'] = this.wPrice;
    data['WMRP'] = this.wMRP;
    return data;
  }
}

class PriceList {
  int? prodPriceId;
  int? proId;
  String? productMRP;
  String? mRPValue;
  String? productWeight;
  String? productWeightType;
  bool? availabilityFlag;
  int? qty;

  PriceList(
      {this.prodPriceId,
        this.proId,
        this.productMRP,
        this.mRPValue,
        this.productWeight,
        this.productWeightType,
        this.availabilityFlag,
        this.qty});

  PriceList.fromJson(Map<String, dynamic> json) {
    prodPriceId = json['prod_price_id'];
    proId = json['Pro_id'];
    productMRP = json['product_MRP'];
    mRPValue = json['MRPValue'];
    productWeight = json['product_weight'];
    productWeightType = json['product_weight_type'];
    availabilityFlag = json['AvailabilityFlag'];
    qty = json['qty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['prod_price_id'] = this.prodPriceId;
    data['Pro_id'] = this.proId;
    data['product_MRP'] = this.productMRP;
    data['MRPValue'] = this.mRPValue;
    data['product_weight'] = this.productWeight;
    data['product_weight_type'] = this.productWeightType;
    data['AvailabilityFlag'] = this.availabilityFlag;
    data['qty'] = this.qty;
    return data;
  }
}
