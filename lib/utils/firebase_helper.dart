import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/model/productModel.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseHelper
{
  static FirebaseHelper firebaseHelper = FirebaseHelper._();
  FirebaseHelper._();

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

//==========================================================================
// =====================   Login  =========================================

  Future<String> emailSignUp({email,password})
  async {

    try{
      await auth.createUserWithEmailAndPassword(email: email, password: password);
      return "Success";
    }catch(e)
    {
      return "$e";
    }

  }

  Future<String> emailSignIn({email,password})
  async {
    try{
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return "Success";
    }catch(e)
    {
      return "$e";
    }
  }

//==========================================================================
// ========================= FireStore ===================================

  void addProductInFireStore(ProductModel model)
  {
    String tempCategory = model.category!;
    firestore.collection("ProductList").doc("Categories").collection(tempCategory).add(
        {
          "pname": model.name,
          "pprice": model.price,
          "pdesc":model.desc,
          "pimg":model.img,
          "pcategory":model.category,
          "pfav":model.fav,
    }
    );

  }

  void readProductsFromFireStore()
  {
    
  }



}