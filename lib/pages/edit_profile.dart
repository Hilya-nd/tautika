import 'package:flutter/material.dart';
import '../app_colors.dart';


class EditProfilePage extends StatelessWidget {


  const EditProfilePage({super.key});


  @override
  Widget build(BuildContext context) {


    return Scaffold(



      backgroundColor:
      tautikaBackground,



      appBar:

      AppBar(


        backgroundColor:
        Colors.white,


        foregroundColor:
        tautikaInk,


        elevation:0,


        title:

        const Text(

          "Edit Profile",

          style:

          TextStyle(

            fontWeight:
            FontWeight.bold,

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




              // FOTO PROFILE



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
                    tautikaBorder,

                    width:2,

                  ),


                ),




                child:

                const Icon(


                  Icons.person_rounded,


                  size:50,


                  color:
                  tautikaBlue,


                ),



              ),






              TextButton(



                onPressed:(){},



                child:


                const Text(



                  "Ganti Foto",



                  style:

                  TextStyle(

                    color:
                    tautikaBlue,


                    fontWeight:
                    FontWeight.bold,

                  ),


                ),



              ),






              const SizedBox(

                height:20,

              ),






              inputField(

                "Nama",

                "Kelompok 4",

              ),




              inputField(

                "Username",

                "@kelompok4jaya",

              ),




              inputField(

                "Jurusan",

                "Informatika - 5D",

              ),




              inputField(

                "Bio",

                "Mahasiswa Informatika",

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



                    Navigator.pop(context);



                  },



                  child:


                  const Text(


                    "Simpan Profil",



                  ),




                ),



              )





            ],



          ),



        ),



      ),



    );



  }








  Widget inputField(



      String label,


      String value,



      ){





    return Container(



      margin:


      const EdgeInsets.only(

        bottom:15,

      ),




      child:


      Column(



        crossAxisAlignment:

        CrossAxisAlignment.start,




        children:[





          Text(



            label,



            style:


            TextStyle(


              fontWeight:
              FontWeight.w600,


              color:
              tautikaInk,


            ),



          ),





          const SizedBox(

            height:6,

          ),





          Container(



            width:
            double.infinity,



            padding:

            const EdgeInsets.all(15),




            decoration:


            BoxDecoration(



              color:

              Colors.white,



              borderRadius:

              BorderRadius.circular(12),




              border:


              Border.all(


                color:

                tautikaBorder,


              ),



            ),





            child:


            Text(



              value,



              style:


              TextStyle(


                color:

                tautikaInk,


              ),



            ),




          ),





        ],



      ),



    );




  }




}