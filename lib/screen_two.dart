import 'package:flutter/material.dart';
import 'package:login/screen_one.dart';
import 'package:login/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => CustomListTile(
                index: index,
                movieName: movieNames[index],
                movieImage: 'images/movie${index + 1}.jpg',
                movieDetails: movieDetails[index],
                fontoftext: 'font$index',
                imageRadius: 20 * index.toDouble(),
              ),
          separatorBuilder: (context, index) => const Divider(
                color: Colors.black,
              ),
          itemCount: movieNames.length),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: SizedBox(
          height: 55,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                iconSize: 30.0,
                icon: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                onPressed: () {
                  showDialog(context: context, builder: (context)=>AlertDialog(
                              title: Text('Warning'),
                              content: Text('Are you sure, you want to logout'),
                              actions: [
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('NO')),
                                ElevatedButton(
                                    onPressed: () async {
                                      final _sharedprefs =
                                          await SharedPreferences.getInstance();
                                      await _sharedprefs.clear();
                                      Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ScreenOne()),
                                          (route) => false);
                                    },
                                    child: Text('YES')),
                              ],
                            ));
                  
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<String> movieNames = [
  'Bheeshma Parvam',
  'BroDaddy',
  'Kammattippadam',
  'Premam',
  'Jai Bhim'
];

List<String> movieDetails = [
  '"Bheeshma Parvam" tells the story of Bheeshmavardhan, a former gangster turned marine exporter from Fort Kochi. Ensuing a series of unfortunate events and death threats to his family, he is ... Read all. Ensuing a series of unfortunate events and death threats to his family, he is forced to revisit his past.',
  'Bro Daddy is a 2022 Indian Malayalam-language comedy-drama film directed by Prithviraj Sukumaran and produced by Antony Perumbavoor through Aashirvad Cinemas, with a screenplay by Sreejith N. and Bibin Maliekal. The film stars Mohanlal and Prithviraj Sukumaran with Lalu Alex, Meena, Kalyani Priyadarshan, Kaniha, Unni Mukundan, Jagadish, Mallika Sukumaran and Soubin Shahir in supporting roles. The songs and background score for the film was composed by Deepak Dev.',
  'Kammatipaadam, alternatively spelled as Kammatti Paadam, is a 2016 Indian Malayalam-language action drama film[2][3] directed by Rajeev Ravi and written by P. Balachandran.[4] The film stars Dulquer Salmaan, Vinayakan, Shaun Romy, Manikandan R. Achari, Vinay Forrt, Shine Tom Chacko, and Suraj Venjaramoodu.[5] The songs were composed by K, John P. Varkey and Vinayakan[6] while the background score was composed by K.',
  "Premam (transl. Love) is a 2015 Indian Malayalam coming of age romance film written, directed and edited by Alphonse Puthren. Produced by Anwar Rasheed for Anwar Rasheed Entertainment, the film stars Nivin Pauly and Sai Pallavi as George and Malar. Along with Madonna Sebastian, Anupama Parameswaran, Shabareesh Varma, Krishna Sankar, Ananth Nag, Siju Wilson and others in the supporting roles and it featured 18 debutant actors. Rajesh Murugesan composed the music and Anend C. Chandran handled the film's cinematography. The plot follows George and his friends from their teenage to adulthood. While George's first love turns out to be a disappointment, Malar, a college lecturer, rekindles his love interest. His romantic journey takes him through several stages, helping him find his purpose.",
  'Jai Bhim (transl. Victory to Bhim) is a 2021 Indian Tamil-language legal drama film directed by T. J. Gnanavel and produced by Jyothika and Suriya under 2D Entertainment. The film stars Suriya and Lijomol Jose with Manikandan, Rajisha Vijayan, Prakash Raj, Rao Ramesh and others in supporting roles. The film deals with the subject of police bias and state violence against a marginalised community.[2] Based on a true incident in 1995, which involves a case fought by Justice K. Chandru,[3] it revolves around the lives of Sengeni and Rajakannu, a couple from the Irular tribe.[4] Rajakannu was arrested by the police, and was later missing from the police station. Sengeni seeks the help of an advocate Chandru to seek justice for her husband.'
];
