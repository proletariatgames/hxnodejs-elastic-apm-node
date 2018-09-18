package js.npm;

extern class Span {
  var transaction:Transaction;
  var name:String;
  var type:String;

  function end():Void;
  function truncate():Void;
}
