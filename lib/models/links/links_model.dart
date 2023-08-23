class Links{

  String? link;
  String? phrase;
  String? urlImage;
  Links({
    this.link,
    this.phrase,
    this.urlImage,
  });
  Links.fromJson(Map<String,dynamic>?json){
    link=json!['link'];
    phrase=json['phrase'];
    urlImage=json['urlImage'];

  }
  Map<String,dynamic>toMap(){
    return {
      'link':link,
      'phrase':phrase,
      'urlImage':urlImage

    };
  }

}