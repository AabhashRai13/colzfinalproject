import 'package:flutter/material.dart';
import 'package:rentmandu/model/category.dart';
class CategorySearch extends StatefulWidget {
  @override
  _CategorySearchState createState() => _CategorySearchState();
}

class _CategorySearchState extends State<CategorySearch> {
  
  // ignore: always_specify_types
  final List<Category> _categoryList=[
    Category(
        imgUrl: 'assets/single/single1.jpg',
        name: 'Single Room'),
    Category(imgUrl: 'assets/bhk/bhk1.jpg', name: 'BHK room'),
    Category(imgUrl: 'assets/flat/flat1.jpg', name: 'Flat'),
    Category(imgUrl: 'assets/house/house1.jpg', name: 'House'),
  
  ];
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 20.0, horizontal: 4.0
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Room Types',
            style: TextStyle(
              fontSize: 19.0,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const Text(
            'For Renting',
            style: TextStyle(
              fontSize: 13.0,
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            height: 100.0,
            child: _categoryList != null ?
            ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _categoryList.length,
                itemBuilder: (BuildContext context, int index){
                  return GestureDetector(
                    onTap: (){
                    
                    },child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0
                    ),
                    child: Column(
                      // ignore: always_specify_types
                      children: [
                        Container(
                          height: 50.0,
                          width: 50.0,
                          child: Image.asset(_categoryList[index].imgUrl),
                        ),
                        const SizedBox(height: 10.0,),
                        Text(_categoryList[index].name)
                      ],
                    ),
                  ),
                  );
                }): const Center(child: CircularProgressIndicator(),),
          )
        ],
      ),
    );
  }
}
