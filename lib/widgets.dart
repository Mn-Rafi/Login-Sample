import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  late String movieName;
  late String movieImage;
  late String movieDetails;
  late String fontoftext;
  late double imageRadius;
  late int index;

  CustomListTile(
      {Key? key,
      required this.movieName,
      required this.movieImage,
      required this.movieDetails,
      required this.fontoftext,
      required this.index,
      required this.imageRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Details(
                  index: index,
                  movieDetails: movieDetails,
                  movieImage: movieImage,
                  movieName: movieName,
                  fontss: fontoftext,
                  imageRadius: imageRadius,
                )));
      },
      minVerticalPadding: 30,
      leading: 
      index%2==0 ?
      CircleAvatar(
        backgroundImage: AssetImage(movieImage),
        radius: 30,
      ):Image(image: AssetImage(movieImage), width: 60, height: 60,fit: BoxFit.cover,),
      title: Text(
        movieName,
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'font4'),
      ),
    );
  }
}

class Details extends StatelessWidget {
  Details(
      {Key? key,
      required this.movieImage,
      required this.movieName,
      required this.movieDetails,
      required this.fontss,
      required this.index,
      required this.imageRadius})
      : super(key: key);

  late String movieName;
  late String movieImage;
  late String movieDetails;
  late String fontss;
  late double imageRadius;
  late int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movieName),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(imageRadius),
                child: Image(
                  image: AssetImage(movieImage),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(movieDetails, style: TextStyle(fontFamily: fontss)),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Back To Home',
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

