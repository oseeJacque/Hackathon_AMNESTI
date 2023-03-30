import 'package:flutter/material.dart';
import 'package:hackathonmobile/core/constants/assert.dart';
import 'package:hackathonmobile/core/constants/colors.dart';
import 'package:hackathonmobile/core/utils/app_input.dart';
import 'package:hackathonmobile/core/utils/app_text.dart';
import 'package:hackathonmobile/core/widgets/app_bar.dart';

import 'detail_actualite.dart';

class ActualitePage extends StatefulWidget {
  const ActualitePage({super.key});

  @override
  State<ActualitePage> createState() => _ActualitePageState();
}

class _ActualitePageState extends State<ActualitePage> {
  TextEditingController _searchController = TextEditingController();
List actualist=[
{
  "title":"L’UE doit reconnaître la réalité \ndu crime d’apartheid en Israël",
  "date":"Mardi 20, 2023", 
  "descrition":"Début mars, une délégation de diplomates européens s’est rendue à Huwara et Zatara, deux villes palestiniennes du gouvernorat de Naplouse, où des colons israéliens se sont livrés à de violentes attaques.Les violences à Huwara et alentour ont choqué par leur ampleur et leur intensité, des centaines de colons israéliens y prenant part.", 
  "image":AssetData.image1P
}, 
{
  "title":"L’UE doit reconnaître la réalité \n du crime d’apartheid en Israël",
  "date":"Mardi 20, 2023", 
  "descrition":"Début mars, une délégation de diplomates européens s’est rendue à Huwara et Zatara, deux villes palestiniennes du gouvernorat de Naplouse, où des colons israéliens se sont livrés à de violentes attaques.Les violences à Huwara et alentour ont choqué par leur ampleur et leur intensité, des centaines de colons israéliens y prenant part.",
  "image":AssetData.image2P
}, 
{
  "title":"L’UE doit reconnaître la réalité \ndu crime d’apartheid en Israël",
  "date":"Mardi 20, 2023", 
  "descrition":"Début mars, une délégation de diplomates européens s’est rendue à Huwara et Zatara, deux villes palestiniennes du gouvernorat de Naplouse, où des colons israéliens se sont livrés à de violentes attaques.Les violences à Huwara et alentour ont choqué par leur ampleur et leur intensité, des centaines de colons israéliens y prenant part.", 
  "image":AssetData.image1P
}
];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: width * .05, vertical: height * .05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
      
              //SearchBar
              Container(
                padding: const EdgeInsets.only(left: 10.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: AppColor.blueBgColor,width: 1.0,),
                  color: AppColor.greySkyColor
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: AppColor.blueBgColor,
                    ),
                    Expanded(
                        child: AppFieldInput(
                            textEditingController: _searchController,
                            hintText: 'chercher...',
                            textInputType: TextInputType.text))
                  ],
                ),
              ), 
              const SizedBox(height: 25.0,),
      
              //Actualités             
              Align(
                alignment: Alignment.centerLeft,
                child: AppText("Actualités",color: AppColor.blueBgColor,size:22.0,weight: FontWeight.w500 ,)), 
                const SizedBox(height: 10.0,),
      
                ListView.builder(                 
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount:actualist.length ,
                  itemBuilder: (context,index){
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 15.0),
                  width: double.infinity,
                  height: height*.65,
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: AppColor.backgroundColor,
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 1.0,
                        blurRadius:10.0, 
                        offset: const Offset(0, 0), 
                        color: AppColor.blueBgColor
                      )
                    ]
                  ),
                  child: Column(
                    children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ActuailiteDetail(data:actualist[index] ,)));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0), 
                              color: AppColor.greyColor
                            ),
                            width: double.infinity,
                            height: height*.3,
                            child: Image.asset(actualist[index]["image"],fit:BoxFit.fill,),
                          ),
                        ), 
                      const SizedBox(height: 10.0,),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: AppText(actualist[index]["date"],color: AppColor.blackColor,)),
                              const SizedBox(height: 25.0,), 
                              Align(
                                alignment: Alignment.centerLeft,
                                child: AppText(actualist[index]["title"],color: AppColor.blackColor,weight: FontWeight.w700,size:20 ,)),
                              
      
                          ],
                        ),
                      )
      
                    ],
                  ), 

                );
                }) 
                
            ],
          ),
        ),
      ),
    );
  }
}
