import 'package:flutter/material.dart';
import 'package:netflix_ui/widgets/content_scroll.dart';
import '../models/movie_model.dart';
import '../widgets/circular_clipper.dart';

class MovieScreen extends StatefulWidget {
  final Movie movie;
  MovieScreen({this.movie});

  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                transform: Matrix4.translationValues(0.0, -50.0, 0.0),
                child: Hero(
                  tag: widget.movie.imageUrl,
                  child: ClipShadowPath(
                    clipper: CircularClipper(),
                    shadow: Shadow(
                      blurRadius: 20,
                    ),
                    child: Image(
                      height: 400.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      image: AssetImage(widget.movie.imageUrl),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    padding: EdgeInsets.only(left: 30),
                    icon: Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                    iconSize: 30,
                    color: Colors.black,
                  ),
                  Image(
                    image: AssetImage('assets/images/netflix.png'),
                    height: 60,
                    width: 150,
                  ),
                  IconButton(
                    padding: EdgeInsets.only(left: 30),
                    icon: Icon(Icons.favorite_border),
                    onPressed: () => print('Add to Favorites'),
                    iconSize: 30,
                    color: Colors.black,
                  ),
                ],
              ),
              Positioned.fill(
                bottom: 10,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: RawMaterialButton(
                    padding: EdgeInsets.all(10),
                    elevation: 10,
                    onPressed: () => print('Play Video'),
                    shape: CircleBorder(),
                    fillColor: Colors.white,
                    child: Icon(
                      Icons.play_arrow,
                      size: 60,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0.0,
                left: 20.0,
                child: IconButton(
                  icon: Icon(Icons.add),
                  iconSize: 40,
                  color: Colors.black,
                  onPressed: () => print('Add to my list'),
                ),
              ),
              Positioned(
                bottom: 0.0,
                right: 25.0,
                child: IconButton(
                  icon: Icon(Icons.share),
                  iconSize: 40,
                  color: Colors.black,
                  onPressed: () => print('Share'),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  widget.movie.title.toUpperCase(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  widget.movie.categories,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '*****',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          'Year',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          widget.movie.year.toString(),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          'Length',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          '${widget.movie.length} min',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          'Country',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          widget.movie.country.toUpperCase(),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Container(
                  height: 120,
                  child: SingleChildScrollView(
                    child: Text(
                      widget.movie.description,
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ContentScroll(
                  images: widget.movie.screenshots,
                  title: 'Screenshots',
                   imageHeight: 200,
                   imageWidth: 250,
                ),
        ],
      ),
    );
  }
}
