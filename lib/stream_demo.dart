import'dart:async';

class Cake{

}
class Order{
  String type;
  Order(this.type);
}
void main(){
  final controller=new StreamController();
  final order=new Order('chocolate');

  //chef
  final baker = new StreamTransformer.fromHandlers(//output
      handleData:(cakeType,sink){//this is a new sink
        if(cakeType=='chocolate'){
          sink.add(new Cake());
          sink.add(new Cake());
          sink.add(new Cake());
        }else{
          sink.addError('Invalid cake type');
        }
      });
  controller.sink.add(order);//input
  ////////////////////////////////////////////////////////////////////////
  controller.stream
      .map((order) => order.type)//order inspector =>implicit return //one to one
      .transform(baker)
  /////// here is new sink
  //does not start overall process but adds new value
      .listen(//get data and do something with it.
          (cake)=>print('Heres your cake $cake'),
      onError:(err)=>print(err)
  );

}