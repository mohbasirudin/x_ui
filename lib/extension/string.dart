extension ExtString on String{
  String lower(){
    try {
        return toLowerCase();
    } catch(e){
        return this;
    }
  }

  String upper(){
    try {
        return toUpperCase();
    } catch(e){
        return this;
    }
  }
}