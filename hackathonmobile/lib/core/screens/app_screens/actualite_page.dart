import 'package:flutter/material.dart';
import 'package:hackathonmobile/core/constants/assert.dart';
import 'package:hackathonmobile/core/constants/colors.dart';
import 'package:hackathonmobile/core/utils/app_input.dart';
import 'package:hackathonmobile/core/utils/app_text.dart';
import 'package:hackathonmobile/core/widgets/app_bar.dart';

import '../../widgets/floating_bouton.dart';
import 'chat.dart';
import 'detail_actualite.dart';

class ActualitePage extends StatefulWidget {
  const ActualitePage({super.key});

  @override
  State<ActualitePage> createState() => _ActualitePageState();
}

class _ActualitePageState extends State<ActualitePage> {
  TextEditingController _searchController = TextEditingController();
  List actualist = [
    {
      "title":
          "Sub-Saharan Africa: Millions denied vaccines, deepening inequality and human suffering from conflicts sum up 2021",
      "date": "March 29, 2022",
      "description":"Amnesty International Report 2021/22: The State of the World’s Human Rights finds that these states, alongside corporate titans, have in fact driven deeper global inequality, with most African countries left struggling to recover from Covid-19 due to high levels of inequality, poverty and unemployment exacerbated by unequal distribution of vaccines.“Covid-19 should have been a decisive wake-up call to deal with inequality and poverty. Instead, we have seen deeper inequality and greater instability in Africa exacerbated by global powers, especially rich countries, who failed to ensure that big pharma distributed vaccines equally between states to ensure the same level of recovery from the Covid-19 pandemic,” said Deprose Muchena, Amnesty International’s Director for East and Southern Africa.“As things stand now, most African countries will take long to recover from Covid-19 due to high levels of inequality and poverty. The after-effects of Covid-19 have been most damaging to the most marginalized communities, including those on the front lines of endemic poverty from Angola to Zambia, Ethiopia to Somalia and the Central Africa Republic to Sierra Leone.”",
      "image":
          "https://www.amnesty.org/en/wp-content/uploads/2022/03/AIR-Web-PIC-1.png", 
      "link":"https://www.amnesty.org/en/latest/news/2022/03/sub-saharan-africa-millions-denied-vaccines/"
    },
  
    {
      "title":
          "Bénin – Togo. Le combat contre les groupes armés ne peut en rien justifier les violations des droits humains",
      "date": "Juillet 27, 2022",
      "description":
          "Les forces de sécurité commettent des violations des droits humains dans le cadre de la lutte contre les groupes armés au Bénin et au Togo, en particulier contre des membres du groupe ethnique peul. Ces violations des droits humains risquent de devenir systématiques et de s’aggraver, comme c’est le cas dans des pays voisins qui combattent les mêmes groupes armés depuis plusieurs années. Les autorités béninoises et togolaises doivent maintenant mettre un terme à cette situation. ",
      "image":
          "https://www.amnesty.org/en/wp-content/uploads/2022/07/photo-Togo-scaled-e1658932551850-1444x710.jpg", 

      "link":"https://www.amnesty.org/fr/latest/news/2022/07/benin-togo-fight-against-armed-groups-must-not-justify-human-rights-violations/"
    },

    {
      "title":
          "Bénin. Des policiers accusés d’avoir violemment agressé une femme transgenre",
      "date": "Mars 7, 2022",
      "description":
          "Début mars, une délégation de diplomates européens s’est rendue à Huwara et Zatara, deux villes palestiniennes du gouvernorat de Naplouse, où des colons israéliens se sont livrés à de violentes attaques.Les violences à Huwara et alentour ont choqué par leur ampleur et leur intensité, des centaines de colons israéliens y prenant part.",
      "image":
          "https://www.amnesty.org/fr/wp-content/uploads/2022/03/Benin-Activist-810x710.jpg", 

      "link":"https://www.amnesty.org/fr/latest/news/2022/03/benin-police-accused-of-violently-attacking-transgender-woman/"
    }, 

  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: MyAppBar(),
      floatingActionButton: FloatingActionButtonWidget(
        action: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => const ChatScreenPage())));
        },
        icon: AssetData.messageQuestionP,
      ),
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
                    border: Border.all(
                      color: AppColor.blueBgColor,
                      width: 1.0,
                    ),
                    color: AppColor.greySkyColor),
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
              const SizedBox(
                height: 25.0,
              ),

              //Actualités
              Align(
                  alignment: Alignment.centerLeft,
                  child: AppText(
                    "Actualités",
                    color: AppColor.blueBgColor,
                    size: 22.0,
                    weight: FontWeight.w500,
                  )),
              const SizedBox(
                height: 10.0,
              ),

              ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: actualist.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 15.0),
                      width: double.infinity,
                      //height: height * .65,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: AppColor.backgroundColor,
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 1.0,
                                blurRadius: 10.0,
                                offset: const Offset(0, 0),
                                color: AppColor.blueBgColor)
                          ]),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActuailiteDetail(
                                            data: actualist[index],
                                          )));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: AppColor.greyColor),
                              width: double.infinity,
                              height: height * .4,
                              child: Image.network(actualist[index]["image"],
                                  fit: BoxFit.fill, loadingBuilder:
                                      (BuildContext context, Widget child,
                                          ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) {
                                  return child;
                                }
                                return Center(
                                  child: CircularProgressIndicator(
                                    color: AppColor.blueBgColor,
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null,
                                  ),
                                );
                              }),
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 20.0),
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Column(
                              children: [
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: AppText(
                                      actualist[index]["date"],
                                      color: AppColor.blackColor,
                                    )),
                                const SizedBox(
                                  height: 25.0,
                                ),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      actualist[index]["title"],
                                      style: TextStyle(color: AppColor.blackColor,fontWeight: FontWeight.w700,fontSize: 20.0),
                                      
                                    )),
                                    
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
