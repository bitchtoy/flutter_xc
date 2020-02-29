
class CommentModel{
  final String icon;
  final String title;
  final String url;
  final String statusBarColor;
  final bool hideAppBar;

  CommentModel({this.icon, this.title, this.url, this.statusBarColor, this.hideAppBar});

  factory CommentModel.formJson(Map<String,dynamic> json){
    return CommentModel(icon: json['icon'],
      title: json['title'],
      url: json['url'],
      statusBarColor: json['statusBarColor'],
      hideAppBar: json['hideAppBar'],
    );
  }

}