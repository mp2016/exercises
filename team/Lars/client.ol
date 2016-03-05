include "console.iol"
include "interface.iol"
include "ui/swing_ui.iol"

outputPort Calculator {
Location: "socket://localhost:8001/"
Protocol: sodep
Interfaces: CalculatorIface
}

main
{
  while (true) {
    /* Swing UI pop-up to let user type in math problem */
    msg = "Type in equation:\n (Bugs will be present)";
    SwingDialog;

    install( ParsingError =>
      println@Console( "Incorrect input (did it contain letters?).." )()
    );
		calculate@Calculator(math)(term);
		println@Console(term)()
	}
}

/*
  Given a string as 'msg', this will request the user a question,
  which will be returned as 'math'.
*/
define SwingDialog {
  /* Will catch if cancel is pressed on the UI. */
  install( TypeMismatch =>
    println@Console( "Cancel was pressed, exiting.." )()
  );

  /* Swing UI pop-up to let user type in math problem */
  showInputDialog@SwingUI( msg )( math )
}
