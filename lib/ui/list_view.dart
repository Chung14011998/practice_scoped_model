import 'package:design_ui_simple/enums/view_state.dart';
import 'package:design_ui_simple/scoped_model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'base_view.dart';

class BuildListView extends StatefulWidget{
  BuildListViewState createState() => BuildListViewState();
}

class BuildListViewState extends State<BuildListView>{
  var rating = 0.0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
      return BaseView<ProductModel>(
        onModelReady: (models) {
          models.fetchProductData();
        },
        builder: (context, child, model) {
          if (model.state == ViewState.Busy) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          else {
            return Scaffold(
                body: ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: _buildItemList(model),
                )
            );
          }
        },
      );
  }

  List<Widget> _buildItemList(ProductModel model) {
    List<Widget> _list=[];
    var quantityCategory=model.getData.categories.length;
    for(int k=0; k< quantityCategory; k++ ){
      var quantityLevel3=model.getData.categories[k].level3.length;//3
      for(int count=0; count< quantityLevel3;count++){
        var quantityProductLevel3 = model.getData.categories[k].level3[count].products.length;//15
        for(int i=0; i<quantityProductLevel3; i++){
          _list.add(
              Card(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Image.network('https://m23sa1.izysync.com/pub/media/catalog/product'
                          +'${model.getData.categories[k].level3[count].products[i].imgUrl}',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(''),
                            ListTile(
                              trailing: Column(
                                children: <Widget>[
                                  SmoothStarRating(
                                      allowHalfRating: false,
                                      onRatingChanged: (v) {
                                        rating = v;
                                        setState(() {});
                                      },
                                      starCount: 5,
                                      rating: rating,
                                      size: 15.0,
                                      color: Colors.yellow,
                                      borderColor: Colors.green,
                                      spacing: 0.0
                                  ),
                                  Text("Free shipping", style: TextStyle(fontSize: 12.0),),
                                ],
                              ),
                            ),
                            Text('${model.getData.categories[k].level3[count].products[i].name}'),
                            Text('${model.getData.categories[k].level3[count].name}'),
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(vertical: 10.0),
                              child: Row(
                                children: <Widget>[
                                  Text('USD   ', style: TextStyle(color: Colors.blue),),
                                  Text('\$'+'${model.getData.categories[k].level3[count].products[i].price}', style: TextStyle(color: Colors.blue, fontSize: 20.0)),
                                ],
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              )
          );
        }
      }
    };

    for(int i=0 ; i<10;i++){
      _list.add(
        Container(
          child: Text(i.toString()),
        )
      );
    }
    return _list;
  }

}