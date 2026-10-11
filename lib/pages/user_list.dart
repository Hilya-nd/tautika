import 'package:flutter/material.dart';
import 'other_profile.dart';



class UserListPage extends StatelessWidget {

  const UserListPage({super.key});



  static const Color primaryBlue =
  Color(0xff4F7FFF);


  static const Color background =
  Color(0xffF8FAFF);


  static const Color borderGrey =
  Color(0xffD9E0EA);


  static const Color textGrey =
  Color(0xff687280);


  static const Color darkText =
  Color(0xff1E293B);





  @override
  Widget build(BuildContext context) {


    return Scaffold(


      backgroundColor:
      background,



      appBar:

      AppBar(


        backgroundColor:
        Colors.white,


        foregroundColor:
        darkText,


        elevation:0,



        title:

        const Text(

          "Cari Mahasiswa",

          style:

          TextStyle(

            fontWeight:
            FontWeight.bold,

            color:
            darkText,

          ),

        ),



      ),





      body:


      Padding(


        padding:

        const EdgeInsets.all(16),




        child:


        Column(


          crossAxisAlignment:

          CrossAxisAlignment.start,



          children:[




            Container(



              padding:

              const EdgeInsets.symmetric(

                horizontal:15,

              ),




              decoration:


              BoxDecoration(



                color:

                Colors.white,



                borderRadius:

                BorderRadius.circular(15),



                border:

                Border.all(

                  color:
                  borderGrey,

                ),



              ),





              child:


              const TextField(



                decoration:


                InputDecoration(



                  icon:

                  Icon(

                    Icons.search_rounded,

                    color:
                    primaryBlue,

                  ),




                  hintText:

                  "Cari mahasiswa",




                  hintStyle:

                  TextStyle(

                    color:
                    textGrey,

                  ),




                  border:

                  InputBorder.none,



                ),



              ),




            ),





            const SizedBox(

              height:25,

            ),






            const Text(



              "Rekomendasi Akun",




              style:


              TextStyle(



                fontSize:18,



                fontWeight:

                FontWeight.bold,



                color:

                darkText,



              ),




            ),





            const SizedBox(

              height:15,

            ),





            accountCard(

              context,

              "Niki",

              "@lalalostyou",

              "Informatika - 5D",

            ),




            accountCard(

              context,

              "Olivia Rodrigo",

              "@oliviarodrigo",

              "Informatika - 5D",

            ),




            accountCard(

              context,

              "Ariana Grande",

              "@everythingyouare",

              "Informatika - 5D",

            ),

            accountCard(

              context,

              "Selena Gomez",

              "@damdam",

              "Informatika - 5D",

            ),




          ],



        ),



      ),



    );


  }








  Widget accountCard(


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

          BorderRadius.circular(16),



          border:

          Border.all(

            color:

            borderGrey,

          ),



        ),





        child:


        Row(



          children:[




            Container(



              width:55,


              height:55,



              decoration:


              BoxDecoration(



                shape:

                BoxShape.circle,



                color:

                const Color(0xffEBF0FF),



                border:

                Border.all(



                  color:

                  primaryBlue,



                  width:1.5,



                ),



              ),





              child:


              const Icon(



                Icons.person_outline_rounded,



                color:

                primaryBlue,



              ),




            ),






            const SizedBox(

              width:15,

            ),






            Expanded(



              child:


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



                      color:

                      darkText,



                    ),



                  ),






                  Text(



                    username,



                    style:


                    const TextStyle(



                      color:

                      textGrey,



                    ),



                  ),






                  Text(



                    jurusan,



                    style:


                    const TextStyle(



                      color:

                      textGrey,



                    ),



                  ),




                ],



              ),



            ),






            ElevatedButton(



              style:


              ElevatedButton.styleFrom(



                backgroundColor:

                primaryBlue,



                foregroundColor:

                Colors.white,



                elevation:0,



                shape:


                RoundedRectangleBorder(



                  borderRadius:

                  BorderRadius.circular(10),



                ),



              ),




              onPressed:(){



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

              const Text(

                "Lihat",

              ),



            ),





          ],



        ),



      ),



    );



  }



}