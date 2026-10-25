import 'package:flutter/material.dart';
import 'other_profile.dart';

import '../app_colors.dart';



class FollowingPage extends StatelessWidget {

  const FollowingPage({super.key});


  @override
  Widget build(BuildContext context) {


    return Scaffold(



      backgroundColor:
      tautikaBackground,




      appBar: AppBar(


        backgroundColor:
        Colors.white,


        foregroundColor:
        const Color(0xff1F2937),


        elevation:0,



        title:

        const Text(

          "Following",

          style:

          TextStyle(

            fontWeight:
            FontWeight.bold,

          ),

        ),



      ),





      body:


      Padding(


        padding:

        const EdgeInsets.all(16),



        child:


        Column(



          children:[




            followingCard(

              context,

              "Nadrina",

              "@nadrinaa",

              "Informatika - 5D",

            ),




            followingCard(

              context,

              "Althaf",

              "@althaf",

              "Informatika - 5D",

            ),




            followingCard(

              context,

              "Akmal",

              "@akmal",

              "Informatika - 5D",

            ),

            followingCard(

              context,

              "Stevani",

              "@tepani",

              "Informatika - 5D",

            ),



          ],



        ),



      ),



    );


  }








  Widget followingCard(


      BuildContext context,


      String nama,


      String username,


      String jurusan,


      ){



    return GestureDetector(



      onTap:(){



        Navigator.push(



          context,



          MaterialPageRoute(



            builder:(context)



            => OtherProfilePage(



              nama:
              nama,



              username:
              username,



              jurusan:
              jurusan,



            ),



          ),



        );



      },




      child:



      Container(



        margin:


        const EdgeInsets.only(


          bottom:12,


        ),





        padding:


        const EdgeInsets.all(15),





        decoration:


        BoxDecoration(



          color:

          Colors.white,



          borderRadius:


          BorderRadius.circular(15),



        ),





        child:


        Row(



          children:[




            Container(



              width:
              55,



              height:
              55,




              decoration:


              BoxDecoration(



                shape:

                BoxShape.circle,



                color:

                Colors.white,



                border:


                Border.all(



                  color:

                  tautikaBlue,



                  width:2,



                ),



              ),





              child:


              const Icon(



                Icons.person_rounded,



                color:

                tautikaBlue,



              ),



            ),





            const SizedBox(


              width:15,


            ),






            Column(



              crossAxisAlignment:


              CrossAxisAlignment.start,




              children:[




                Text(



                  nama,



                  style:


                  const TextStyle(



                    fontWeight:

                    FontWeight.bold,



                    fontSize:17,



                  ),



                ),






                Text(



                  username,



                  style:


                  const TextStyle(



                    color:

                    tautikaMuted,



                  ),



                ),





                Text(



                  jurusan,



                  style:


                  const TextStyle(



                    color:

                    tautikaMuted,



                  ),



                ),





              ],



            ),




          ],



        ),



      ),



    );



  }



}