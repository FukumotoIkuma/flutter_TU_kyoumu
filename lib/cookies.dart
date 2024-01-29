class MyCookies{
  MyCookies();

  final Map<String, String?> cookieMap = {};

  void push(String cookieString){
    List<String> cookieParts = cookieString
        .split(RegExp('(?<=)(,)(?=[^;]+?=)'))
        .expand((item) => item.split('; '))
        .toList();


    for (String part in cookieParts) {
      List<String> keyValue = part.trim().split('=');

      if (keyValue.length == 2) {
        cookieMap[keyValue[0]] = keyValue[1];
      }else{
        cookieMap[keyValue[0]] = null;
      }
    }
    //print("received cookies:$cookieString");
    //print("updated cookies:$cookieMap");

  }
  List<String> getList(){
    List<String> parts = [];
    cookieMap.forEach((key, value) {
      if(value != null){
        parts.add('$key=$value');
      }else{
        parts.add(key);
      }
    });
    return parts;
  }

  String get(){
    return getList().join('; ');
  }
}