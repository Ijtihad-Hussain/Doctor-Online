import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../models/doctor.dart';
import '../../../widgets/customTextFormField.dart';
import '../../../widgets/doctorCard.dart';
import '../../../widgets/pageDecoration.dart';

class Gastroenterologists extends StatefulWidget {
  const Gastroenterologists({Key? key}) : super(key: key);

  @override
  State<Gastroenterologists> createState() => _GastroenterologistsState();
}

class _GastroenterologistsState extends State<Gastroenterologists> {
  final TextEditingController _searchController = TextEditingController();

  List<Doctor> _doctors = [];

  List<Doctor> _searchDoctors(String query) {
    return _doctors.where((doctor) {
      final nameLower = doctor.name.toLowerCase();
      final queryLower = query.toLowerCase();
      return nameLower.contains(queryLower);
    }).toList();
  }

  Stream<List<Doctor>> _fetchDoctors() {
    return FirebaseFirestore.instance
        .collection('doctors')
        .where('speciality', isEqualTo: 'Gastroenterologist')
        .snapshots()
        .map((QuerySnapshot querySnapshot) {
      return querySnapshot.docs.map((DocumentSnapshot documentSnapshot) {
        return Doctor(
          name: documentSnapshot.get('name'),
          email: documentSnapshot.get('email'),
          speciality: documentSnapshot.get('speciality'),
          experience: '7 years',
          about: documentSnapshot.get('about'),
          availability: 'availaibity',
          imageUrl: documentSnapshot.get('imageUrl'), // Retrieve the image URL from Firestore
        );
      }).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    // _doctors = _fetchDoctors();
  }


  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Doctor>>(
        stream: _fetchDoctors(),
        builder: (BuildContext context, AsyncSnapshot<List<Doctor>> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          List<Doctor> doctors = snapshot.data ?? [];
          return Scaffold(
            extendBodyBehindAppBar: true,
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: PageDecoration.pageDecoration,
              padding: const EdgeInsets.only(top: 40),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomTextFormField(
                      hintText: 'Search Doctor',
                      height: 44,
                      keyBoardType: TextInputType.text,
                      controller: _searchController,
                      onChanged: (value) {
                        setState(() {
                          _doctors = _searchDoctors(value);
                        });
                      },
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    StreamBuilder<List<Doctor>>(
                      stream: _fetchDoctors(),
                      builder: (BuildContext context, AsyncSnapshot<List<Doctor>> snapshot) {
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }

                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        }

                        List<Doctor> doctors = snapshot.data ?? [];

                        return Column(
                          children: doctors.map((doctor) => DoctorCard(
                            name: doctor.name,
                            specialization: doctor.speciality,
                            experience: doctor.experience!,
                            about: doctor.about!,
                            email: doctor.email!,
                            image: NetworkImage(doctor.imageUrl!), // Use NetworkImage to load the image from the URL
                          )).toList(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        }
    );
  }
}

