class ConfigModel{
  final String searchUrl;
  ConfigModel({this.searchUrl});
  factory ConfigModel.formJson(Map<String,dynamic> config){
     return ConfigModel(
       searchUrl: config['searchUrl']
     );
  }
}