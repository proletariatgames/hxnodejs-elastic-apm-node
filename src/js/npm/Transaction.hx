package js.npm;

extern class Transaction {
  var name:String;
  var type:String;
  var result:Int;

  function end(?result:Int):Void;
}
