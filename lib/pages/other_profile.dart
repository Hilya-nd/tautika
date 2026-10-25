import 'package:flutter/material.dart';
import '../app_colors.dart';


class OtherProfilePage extends StatefulWidget {

  final String nama;
  final String username;
  final String jurusan;

  const OtherProfilePage({

    super.key,

    required this.nama,

    required this.username,

    required this.jurusan,

  });

  @override
  State<OtherProfilePage> createState()
  => _OtherProfilePageState();

}




class _OtherProfilePageState
extends State<OtherProfilePage>{


  bool follow = false;



  @override
  Widget build(BuildContext context){


    return Scaffold(


      backgroundColor:
      tautikaPaleBlue,



      appBar:

      AppBar(

        backgroundColor:
        Colors.white,

        foregroundColor:
        tautikaInk,

        elevation:0,


        title:

        Text(

          widget.nama,

          style:

          const TextStyle(

            fontWeight:
            FontWeight.w600,

          ),

        ),

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



                    const Icon(

                      Icons.person,

                      size:60,

                      color:
                      tautikaBlue,

                    ),




                    const SizedBox(
                      height:15,
                    ),




                    Text(

                      widget.nama,

                      style:

                      const TextStyle(

                        fontSize:20,

                        fontWeight:
                        FontWeight.bold,

                      ),

                    ),




                    Text(
                      widget.username,
                    ),




                    Text(
                      widget.jurusan,
                    ),




                    const SizedBox(
                      height:20,
                    ),





                    SizedBox(

                      width:
                      double.infinity,


                      child:

                      OutlinedButton(

                        style:

                        OutlinedButton.styleFrom(

                          shape:

                          RoundedRectangleBorder(

                            borderRadius:
                            BorderRadius.circular(20),

                          ),

                        ),


                        onPressed:(){


                          setState((){

                            follow =
                            !follow;

                          });


                        },


                        child:

                        Text(

                          follow

                          ?

                          "Following"

                          :

                          "+ Follow",

                          style:

                          const TextStyle(

                            color:
                            tautikaBlue,

                          ),

                        ),

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
                          "20",
                          "Tugas",
                        ),



                        statistic(
                          "30",
                          "Followers",
                        ),



                        statistic(
                          "5",
                          "Mengikuti",
                        ),



                      ],


                    ),




                  ],

                ),


              ),





              const SizedBox(
                height:15,
              ),





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

                        fontSize:18,

                        fontWeight:
                        FontWeight.bold,

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
                          Icons.picture_as_pdf,
                          "PBM",
                        ),



                        postItem(
                          Icons.quiz,
                          "Quiz",
                        ),



                        postItem(
                          Icons.book,
                          "Catatan",
                        ),



                        postItem(
                          Icons.description,
                          "Tugas",
                        ),



                        postItem(
                          Icons.quiz,
                          "Quiz",
                        ),



                        postItem(
                          Icons.picture_as_pdf,
                          "PDF",
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
      String label,
      ){

    return Column(

      children:[


        Text(

          angka,

          style:

          const TextStyle(

            fontSize:18,

            fontWeight:
            FontWeight.bold,

          ),

        ),



        Text(label),



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

        border:

        Border.all(

          color:
          tautikaMuted,

        ),


        borderRadius:

        BorderRadius.circular(12),

      ),



      child:

      Column(

        mainAxisAlignment:

        MainAxisAlignment.center,


        children:[



          Icon(

            icon,

            size:35,

          ),



          Text(text),



        ],


      ),


    );


  }


}