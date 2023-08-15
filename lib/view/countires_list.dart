import 'package:covid_19_app/Services/utilities/statuses_services.dart';
import 'package:covid_19_app/view/details_screen.dart';
import 'package:flutter/material.dart';

class CountriesList extends StatefulWidget {
  const CountriesList({super.key});

  @override
  State<CountriesList> createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  StatusServices statusServices = StatusServices();
  // ignore: non_constant_identifier_names
  TextEditingController SearchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: SearchController,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  hintText: 'Search with country name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50))),
            ),
          ),
          Expanded(
              child: FutureBuilder(
                  future: statusServices.getCountriesListAPI(),
                  builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                    if (!snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                ListTile(
                                  subtitle: Text(snapshot.data![index]['cases']
                                      .toString()),
                                  title: Text(snapshot.data![index]['country']),
                                  leading: Image(
                                      image: NetworkImage(snapshot.data![index]
                                          ['countryInfo']['flag'])),
                                )
                              ],
                            );
                          });
                      ;
                    } else {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DetailScreen(
                                                  name: snapshot.data![index]
                                                      ['Country'],
                                                  image: snapshot.data![index]
                                                      ['countryInfo']['flag'],
                                                  tests: snapshot.data![index]
                                                      ['tests'],
                                                  critical: snapshot
                                                      .data![index]['critical'],
                                                  cases: snapshot.data![index]
                                                      ['cases'],
                                                  deaths: snapshot.data![index]
                                                      ['deaths'],
                                                  recovered:
                                                      snapshot.data![index]
                                                          ['recovered'],
                                                  active: snapshot.data![index]
                                                      ['active'],
                                                )));
                                  },
                                  child: ListTile(
                                    subtitle: Text(snapshot.data![index]
                                            ['cases']
                                        .toString()),
                                    title:
                                        Text(snapshot.data![index]['country']),
                                    leading: Image(
                                        image: NetworkImage(
                                            snapshot.data![index]['countryInfo']
                                                ['flag'])),
                                  ),
                                )
                              ],
                            );
                          });
                    }
                  }))
        ],
      )),
    );
  }
}
