include "interface.iol"
include "console.iol"

execution { concurrent }

inputPort CalcInput {
Location: "socket://localhost:8001/"
Protocol: sodep
Interfaces: CalculatorIface
}

/* Defines type returned by javaService StringParsing */
type Term: void{
	.success: bool
	.result: double
}

/* Defines interface to javaService StringParsing */
interface StringParsingInterface {
	RequestResponse: test( int )( int ),
									 getTerm( string )( Term )
}
/* Defines output port to call to in Jolie code */
outputPort StringParsing {
	Interfaces: StringParsingInterface
}

/* Embedded javaServices */
embedded {
	Java: "example.StringParsing" in StringParsing
}

define printServed {
  println@Console( "Requests served so far " + ++global.served )()
}

main {

  [
    calculate( request )( total ) {
      getTerm@StringParsing(request)(term);

      if (!term.success) {
        throw( ParsingError )
      };

      total = term.result
    }
  ] { printServed }

}
