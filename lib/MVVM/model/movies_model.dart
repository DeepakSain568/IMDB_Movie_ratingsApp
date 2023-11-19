class MoviesList {
  int? rank;
  String? title;
  String? thumbnail;
  String? rating;
  String? id;
  int? year;
  String? image;
  String? description;
  String? trailer;
  List<String>? genre;
  List<String>? director;
  List<String>? writers;
  String? imdbid;

  MoviesList(
      {this.rank,
      this.title,
      this.thumbnail,
      this.rating,
      this.id,
      this.year,
      this.image,
      this.description,
      this.trailer,
      this.genre,
      this.director,
      this.writers,
      this.imdbid});

  MoviesList.fromJson(Map<String, dynamic> json) {
    rank = json['rank'];
    title = json['title'];
    thumbnail = json['thumbnail'];
    rating = json['rating'];
    id = json['id'];
    year = json['year'];
    image = json['image'];
    description = json['description'];
    trailer = json['trailer'];
    genre = json['genre'].cast<String>();
    director = json['director'].cast<String>();
    writers = json['writers'].cast<String>();
    imdbid = json['imdbid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rank'] = this.rank;
    data['title'] = this.title;
    data['thumbnail'] = this.thumbnail;
    data['rating'] = this.rating;
    data['id'] = this.id;
    data['year'] = this.year;
    data['image'] = this.image;
    data['description'] = this.description;
    data['trailer'] = this.trailer;
    data['genre'] = this.genre;
    data['director'] = this.director;
    data['writers'] = this.writers;
    data['imdbid'] = this.imdbid;
    return data;
  }

  // List<MoviesList> list = [];
  // List DATA() {
  //   return list;
  // }
}
