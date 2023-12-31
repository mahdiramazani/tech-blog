import 'package:flutter/material.dart';
import 'package:flutter_application_2/constant/api_constant.dart';
import 'package:flutter_application_2/controller/home_controller.dart';
import 'package:flutter_application_2/gen/assets.gen.dart';
import 'package:flutter_application_2/models/data.dart';
import 'package:flutter_application_2/component/my_colors.dart';
import 'package:flutter_application_2/services/services.dart';
import 'package:get/get.dart';


class HomeBody extends StatelessWidget {
   HomeBody({
    super.key,
    required this.size,
  });

  final Size size;

  HomeScreanController homeScreanController=Get.put(HomeScreanController());

  @override
  Widget build(BuildContext context) {
    
    homeScreanController.getHomeItems();

    return SingleChildScrollView(
        child: Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
    
        //image poster
        Stack(
          children: [
            //Cintainer for image in header
            Padding(
              padding: const EdgeInsets.fromLTRB(0,8,0,0),
              child: Container(
                height: size.height/4.2,
                width: size.width/1.19,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  
                  image: DecorationImage(image: AssetImage(Assets.images.programming.path),
                  fit: BoxFit.cover),
              
                ),
                foregroundDecoration:const  BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(16)),
                        gradient: LinearGradient(colors: GradinatCollors.homeCoverImage,
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter
                        ),
                        
                ),
              ),
            ),
            //Text in Image 
            Positioned(
              left: 5,
              bottom: 5,
              right: 5,
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("ملیکا عزیزی",style: Theme.of(context).textTheme.headline1,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("250 ",style: Theme.of(context).textTheme.headline1,),
                        Icon(Icons.remove_red_eye,color: Colors.white,)
                      ],
                    ),
                    
                  ],
                ),
                Text("دوازده قدم برنامه نویسی یک دوره ی...س",style:Theme.of(context).textTheme.headline2)
              ],),
            )
          ],
        ),
        //Hashatg List
        SizedBox(height: size.height/13,),
        SizedBox(
          height: size.height/18,
        
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: category_item.length,
            itemBuilder: (BuildContext context , int index){
        
            return Padding(
              padding: EdgeInsets.fromLTRB(0,0,index==0?size.width/12:20,0),
              child: Container(
                height: size.height/18,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: const Color.fromARGB(255, 18, 14, 14)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    ImageIcon(AssetImage(Assets.icons.hashtag.path),color: Colors.white,size: 10,),
                    Text("  ${category_item[index].name!} ",style: Theme.of(context).textTheme.headline1),
                    
                  ]),
                ),
              ),
            );
          }),
        ),
        //body
        Column(
          
          children: [
            //View Hot Text
            Padding(
              padding: EdgeInsets.only(right: size.width/12),
              child: SizedBox(
                height: size.height/8,
                width: size.width,
                child: Row(
                  children: [
                  ImageIcon(AssetImage(Assets.icons.pen.path),color: Colors.blue,),
                  Text(" مشاهده داغترین نوشته ها",style: Theme.of(context).textTheme.headline3,),
                ],),
              ),
            ),
            //List View Slider Hot Text
            Obx(
              ()=> SizedBox(
                height:size.height/3.2,
                
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: homeScreanController.articleList.length,
                  itemBuilder: (BuildContext context,int index){
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          children:[ 
                          Padding(
                            padding: EdgeInsets.fromLTRB(size.width/18,0,index==0?size.width/12:0,0),
                            child: Container(
                              height:size.height/4.6,
                              width: size.width/2.50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                image: DecorationImage(
                                image:AssetImage(homeScreanController.articleList[index].image!),
                                fit: BoxFit.cover )
                              ),
                              foregroundDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                gradient: const LinearGradient(colors: GradinatCollors.listViewHotText,
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter
                                )
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 5,
                            left: 30,
                            right: 10,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              Text(homeScreanController.articleList[index].author!,style: Theme.of(context).textTheme.headline1,),
                              Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(homeScreanController.articleList[index].view!,style: Theme.of(context).textTheme.headline1,),
                          Icon(Icons.remove_red_eye,color: Colors.white,)
                        ],
                      ),
                            ],),
                          ),
                      ]),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20,0,0,0),
                        child: SizedBox(
                         width: size.width/2.50,
                          child:const Text("به مام حدا مهدی رمضانی هستم برنامه نویس اندروید و ios",
                          overflow: TextOverflow.ellipsis,
                          style:TextStyle(
                            fontFamily: "dana",
                            fontSize: 16,
                            color: Colors.black
                          ),
                          maxLines: 2,
                          ),
                        ),
                      ),
                      ],
                    );
                  }),
              ),
            ),
            
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Padding(
              padding: EdgeInsets.only(right: size.width/15),
              child: Row(
                        
              children: [
              Icon(Icons.mic_external_on_rounded,color: Colors.blue,),
              Text(" مشاهده داغترین پادکست ها",style: 
              Theme.of(context).textTheme.headline3,),
              ],),
            ),
        
            SizedBox(
            
              height:size.height/2,
            
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                
                itemBuilder: (BuildContext context,int index){
            
                return Padding(
                  padding:  EdgeInsets.fromLTRB(size.width/18,10,index==0?size.width/12:0,0),
                  child: Column(children: [
            
                  Container(
                  width: size.width/2.50,
                  height:size.height/4.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(image: AssetImage(Assets.images.slider.path))
                  ),
                                ),
    
                  Text("رادیو گیگ"),              
                  ],)
                );
              }),
            )
          ],),
        ),
        //
        ],
        ),
      );
  }
}