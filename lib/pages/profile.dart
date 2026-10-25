import 'package:flutter/material.dart';
import '../app_colors.dart';

import 'edit_profile.dart';
import 'followers.dart';
import 'following.dart';
import 'user_list.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});


  @override
  Widget build(BuildContext context) {

    return Scaffold(


      backgroundColor:
      tautikaPaleBlue,



      appBar: AppBar(


        backgroundColor:
        Colors.white,


        foregroundColor:
        const Color(0xff1F2937),


        elevation:0,


        title:

        const Text(

          "Profile",

          style:

          TextStyle(

            color: tautikaInk,

            fontWeight:
            FontWeight.bold,

          ),

        ),




        actions:[



          IconButton(

            icon:

            const Icon(

              Icons.search_rounded,

            ),


            onPressed:(){


              Navigator.push(

                context,

                MaterialPageRoute(

                  builder:(context)

                  => const UserListPage(),

                ),

              );


            },


          ),

          const SizedBox(

            width:15,

          )



        ],



      ),




      body:

      SingleChildScrollView(


        child:

        Padding(

          padding:

          const EdgeInsets.all(16),



          child:

          Column(

            children:[



              // PROFILE CARD


              Container(


                width:

                double.infinity,


                padding:

                const EdgeInsets.all(20),




                decoration:

                BoxDecoration(


                  color:
                  Colors.white,


                  borderRadius:

                  BorderRadius.circular(20),


                ),




                child:

                Column(


                  children:[



                    Container(


                      width:90,


                      height:90,



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

                      Icon(


                        Icons.person_rounded,


                        size:55,


                        color:

                        tautikaBlue,


                      ),



                    ),





                    const SizedBox(

                      height:15,

                    ),





                    const Text(


                      "Kelompok 4",



                      style:

                      TextStyle(


                        fontSize:20,


                        fontWeight:

                        FontWeight.bold,


                      ),


                    ),





                    const SizedBox(

                      height:5,

                    ),




                    const Text(


                      "@kelompok4jaya",



                      style:

                      TextStyle(

                        color:
                        tautikaMuted,

                      ),


                    ),




                    const Text(


                      "Informatika - 5D",



                      style:

                      TextStyle(

                        color:
                        tautikaMuted,

                      ),


                    ),





                    const SizedBox(

                      height:20,

                    ),





                    Row(


                      mainAxisAlignment:

                      MainAxisAlignment.spaceAround,



                      children:[



                        statistic(

                          "6",

                          "Tugas",

                        ),





                        GestureDetector(


                          onTap:(){


                            Navigator.push(

                              context,

                              MaterialPageRoute(

                                builder:(context)

                                => const FollowersPage(),

                              ),

                            );


                          },


                          child:

                          statistic(

                            "4",

                            "Followers",

                          ),


                        ),





                        GestureDetector(


                          onTap:(){


                            Navigator.push(

                              context,

                              MaterialPageRoute(

                                builder:(context)

                                => const FollowingPage(),

                              ),

                            );


                          },


                          child:

                          statistic(

                            "4",

                            "Following",

                          ),


                        ),




                      ],



                    ),





                    const SizedBox(

                      height:20,

                    ),





                    SizedBox(


                      width:

                      double.infinity,



                      child:

                      ElevatedButton(


                        style:

                        ElevatedButton.styleFrom(


                          backgroundColor:

                          tautikaBlue,


                          foregroundColor:

                          Colors.white,



                          shape:

                          RoundedRectangleBorder(


                            borderRadius:

                            BorderRadius.circular(12),


                          ),


                        ),




                        onPressed:(){



                          Navigator.push(

                            context,

                            MaterialPageRoute(

                              builder:(context)

                              => const EditProfilePage(),

                            ),

                          );


                        },



                        child:

                        const Text(

                          "Edit Profil",

                        ),



                      ),



                    )



                  ],



                ),


              ),






              const SizedBox(

                height:15,

              ),





              // POSTINGAN


              Container(


                padding:

                const EdgeInsets.all(15),




                decoration:

                BoxDecoration(


                  color:

                  Colors.white,



                  borderRadius:

                  BorderRadius.circular(20),


                ),




                child:

                Column(



                  children:[



                    const Text(


                      "Postingan",



                      style:

                      TextStyle(


                        fontWeight:

                        FontWeight.bold,


                        fontSize:18,


                      ),



                    ),




                    const Divider(),





                    GridView.count(


                      shrinkWrap:true,


                      physics:

                      const NeverScrollableScrollPhysics(),




                      crossAxisCount:3,



                      crossAxisSpacing:10,



                      mainAxisSpacing:10,



                      children:[



                        postItem(

                          Icons.description_outlined,

                          "UI",

                        ),




                        postItem(

                          Icons.quiz_outlined,

                          "Quiz",

                        ),





                        postItem(

                          Icons.description_outlined,

                          "PBM",

                        ),





                        postItem(

                          Icons.menu_book_outlined,

                          "Catatan",

                        ),





                        postItem(

                          Icons.picture_as_pdf_outlined,

                          "Tugas",

                        ),





                        postItem(

                          Icons.quiz_outlined,

                          "Quiz",

                        ),



                      ],



                    )



                  ],



                ),



              )





            ],



          ),



        ),



      ),



    );


  }







  Widget statistic(

      String angka,

      String text,

      ){


    return Column(


      children:[



        Text(


          angka,


          style:

          const TextStyle(


            color:

            tautikaBlue,


            fontWeight:

            FontWeight.bold,


            fontSize:18,


          ),



        ),




        Text(


          text,


          style:

          const TextStyle(

            color:
            tautikaMuted,

          ),


        )



      ],



    );


  }








  Widget postItem(


      IconData icon,


      String text,

      ){



    return Container(



      decoration:

      BoxDecoration(


        color:

        Colors.white,



        border:

        Border.all(

          color:

          tautikaMuted,

        ),



        borderRadius:

        BorderRadius.circular(15),


      ),




      child:

      Column(



        mainAxisAlignment:

        MainAxisAlignment.center,



        children:[



          Icon(


            icon,


            size:35,


            color:

            tautikaBlue,


          ),




          const SizedBox(

            height:5,

          ),




          Text(


            text,


            style:

            const TextStyle(


              color:

              tautikaMuted,


            ),


          )



        ],



      ),



    );


  }



}