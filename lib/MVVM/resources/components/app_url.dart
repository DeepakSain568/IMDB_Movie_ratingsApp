class AppUrl {
  static var baseurl = 'https://reqres.in';

  static var loginurl = baseurl + '/api/login';

  static var registerurl = baseurl + '/api/register';

  static var movieslist = 'https://imdb-top-100-movies.p.rapidapi.com/';
  static Map<String,String> headersofmovieslisturl = {
    "X-RapidAPI-Key": "0b94157effmsh0acffe44d8f7dd9p12738bjsnb313a1d8ae23",
    "X-RapidAPI-Host": "imdb-top-100-movies.p.rapidapi.com",
    "useQueryString": "true"
  };
}
