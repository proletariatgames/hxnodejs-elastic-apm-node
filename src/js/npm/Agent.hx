package js.npm;
import js.node.http.*;
import js.Error;

@:jsRequire("elastic-apm-node")
extern class Agent {
  static var currentTransaction(default,null):Transaction;
  static var middleware(default,null):Middleware;

  static function start(?options:StartOptions):Agent;
  static function isStarted():Bool;
  static function addFilter(fn:Dynamic->Dynamic):Void;
  static function setUserContext(context:Dynamic):Bool;
  static function setCustomContext(context:Dynamic):Bool;
  // Deprecated in 2.10.0.
  // Replaced by apm.setLabel(name, value)
  static function setTag(name:String, value:String):Bool;
  static function setLabel(name:String, value:String):Bool;
  // Deprecated in 2.10.0.
  // Replaced by apm.addLabels({ [name]: value })
  static function addTags(tags:Dynamic):Bool;
  static function addLabels(tags:Dynamic):Bool;
  static function captureError(error:Dynamic, ?options:CaptureErrorOptions, ?callback:Dynamic->Void):Void;
  static function startTransaction(?name:String, ?type:String):Transaction;
  static function endTransaction(?result:Int):Void;
  static function setTransactionName(name:String):Void;
  static function startSpan(?name:String, ?type:String):Span;
  static function handleUncaughtExceptions(cb:Error->Void):Void;
  static function flush(?cb:Error->Void):Void;
  static function lambda(?type:String, handler:Dynamic->Dynamic->(Dynamic->Void)->Void):Void;
}

extern class Middleware {
  static function connect():Dynamic;
}

typedef CaptureErrorOptions = {
  ?request:IncomingMessage,
  ?response:ServerResponse,
  ?handled:Bool,
  ?user:Dynamic,
  ?tags:Dynamic,
  ?custom:Dynamic
}

typedef Context = {
  ?id:String,
  ?username:String,
  ?email:String
}

typedef StartOptions = {
  ?serviceName:String,
  ?secretToken:String,
  ?serverUrl:String,
  ?verifyServerCert:Bool,
  ?serviceVersion:String,
  ?active:Bool,
  ?instrument:Bool,
  ?asyncHooks:Bool,
  ?ignoreUrls:Array<String>,
  ?ignoreUserAgents:Array<String>,
  ?captureBody:CaptureBody,
  ?errorOnAbortedRequests:Bool,
  ?abortedErrorThreshold:Int,
  ?transactionSampleRate:Float,
  ?hostname:String,
  ?frameworkName:String,
  ?frameworkVersion:String,
  ?logLevel:LogLevel,
  ?logger:Dynamic,
  ?captureExceptions:Bool,
  ?captureErrorLogStackTraces:LogStackTraces,
  ?captureSpanStackTraces:Bool,
  ?sourceLinesErrorAppFrames:Int,
  ?sourceLinesErrorLibraryFrames:Int,
  ?errorMessageMaxLength:Int,
  ?stackTraceLimit:Int,
  ?transactionMaxSpans:Int,
  ?flushInterval:Int,
  ?serverTimeout:Int,
  ?maxQueueSize:Int,
  ?filterHttpHeaders:Bool,
  ?disableInstrumentations:Array<String>
}

@:enum abstract CaptureBody(String) from String {
  /**
    off - request bodies will never be reported
  **/
  var Off = "off";

  /**
    errors - request bodies will only be reported with errors
  **/
  var Errors = "errors";

  /**
    transactions - request bodies will only be reported with request transactions
  **/
  var Transactions = "transactions";

  /**
    all - request bodies will be reported with both errors and request transactions
  **/
  var All = "all";
}

@:enum abstract LogLevel(String) from String {
  var Trace = "trace";
  var Debug = "Debug";
  var Info = "Info";
  var Warn = "warn";
  var Error = "error";
  var Fatal = "fatal";
}

@:enum abstract LogStackTraces(String) from String {
  /**
    Capture a stack trace at the location where captureError was called
  **/
  var Always = "always";

  /**
    Capture location will be recorded only when captureError is called with either a string or the special parameterized message object
  **/
  var Messages = "messages";

  /**
    Never record a capture location stack trace.
  **/
  var Never = "never";
}

