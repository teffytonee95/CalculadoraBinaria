       IDENTIFICATION DIVISION.
       PROGRAM-ID. BIN-CALC.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       * --- Variables de menú ---
       01 OPCION-MENU        PIC 9.

       * --- Entradas binarios ---
       01 BIN1               PIC X(32).
       01 BIN2               PIC X(32).
       01 OP                 PIC X(1).

       * --- Variables numéricas ---
       01 DEC1               PIC 9(10) COMP.
       01 DEC2               PIC 9(10) COMP.
       01 RESULT-DEC         PIC 9(10) COMP.
       01 TEMP               PIC 9(10) COMP.

       * --- Resultado final ---
       01 RESULT-BIN         PIC X(64).

       * --- Contadores ---
       01 I                  PIC 9(4) COMP.
       01 J                  PIC 9(4) COMP.

       PROCEDURE DIVISION.
       MAIN-PROGRAM.
           PERFORM MENU-LOOP UNTIL OPCION-MENU = 5.
           STOP RUN.

       MENU-LOOP.
           DISPLAY "-------------------------------------".
           DISPLAY "   CALCULADORA BINARIA EN COBOL".
           DISPLAY "-------------------------------------".
           DISPLAY "1) Sumar".
           DISPLAY "2) Restar".
           DISPLAY "3) Multiplicar".
           DISPLAY "4) Dividir".
           DISPLAY "5) Salir".
           DISPLAY "Seleccione una opción: ".
           ACCEPT OPCION-MENU.

           EVALUATE OPCION-MENU
               WHEN 1
                   MOVE "+" TO OP
                   PERFORM OPERACION-BINARIA
               WHEN 2
                   MOVE "-" TO OP
                   PERFORM OPERACION-BINARIA
               WHEN 3
                   MOVE "*" TO OP
                   PERFORM OPERACION-BINARIA
               WHEN 4
                   MOVE "/" TO OP
                   PERFORM OPERACION-BINARIA
               WHEN 5
                   DISPLAY "Saliendo..."
               WHEN OTHER
                   DISPLAY "Opción inválida".
           END-EVALUATE.
           DISPLAY "".

       OPERACION-BINARIA.
           PERFORM PEDIR-BINARIOS.
           PERFORM CONVERT-BIN-TO-DEC1.
           PERFORM CONVERT-BIN-TO-DEC2.
           PERFORM CALCULAR.
           PERFORM CONVERT-DEC-TO-BIN.
           DISPLAY "Resultado en binario: " RESULT-BIN.

       PEDIR-BINARIOS.
           DISPLAY "Ingrese el primer número binario: ".
           ACCEPT BIN1.
           DISPLAY "Ingrese el segundo número binario: ".
           ACCEPT BIN2.

       CONVERT-BIN-TO-DEC1.
           MOVE 0 TO DEC1.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > LENGTH OF BIN1
               IF BIN1(I:1) = "1"
                   COMPUTE DEC1 = DEC1 * 2 + 1
               ELSE IF BIN1(I:1) = "0"
                   COMPUTE DEC1 = DEC1 * 2
               END-IF
           END-PERFORM.

       CONVERT-BIN-TO-DEC2.
           MOVE 0 TO DEC2.
           PERFORM VARYING J FROM 1 BY 1 UNTIL J > LENGTH OF BIN2
               IF BIN2(J:1) = "1"
                   COMPUTE DEC2 = DEC2 * 2 + 1
               ELSE IF BIN2(J:1) = "0"
                   COMPUTE DEC2 = DEC2 * 2
               END-IF
           END-PERFORM.

       CALCULAR.
           EVALUATE OP
               WHEN "+"
                   COMPUTE RESULT-DEC = DEC1 + DEC2
               WHEN "-"
                   COMPUTE RESULT-DEC = DEC1 - DEC2
               WHEN "*"
                   COMPUTE RESULT-DEC = DEC1 * DEC2
               WHEN "/"
                   IF DEC2 = 0
                       DISPLAY "ERROR: División por cero."
                       MOVE 0 TO RESULT-DEC
                   ELSE
                       COMPUTE RESULT-DEC = DEC1 / DEC2
                   END-IF
           END-EVALUATE.

       CONVERT-DEC-TO-BIN.
           MOVE SPACES TO RESULT-BIN.
           MOVE RESULT-DEC TO TEMP.

           IF TEMP = 0
               MOVE "0" TO RESULT-BIN
               EXIT PARAGRAPH
           END-IF.

           MOVE "" TO RESULT-BIN.

           PERFORM UNTIL TEMP = 0
               IF FUNCTION MOD(TEMP 2) = 1
                   STRING "1" RESULT-BIN DELIMITED BY SIZE INTO RESULT-BIN
               ELSE
                   STRING "0" RESULT-BIN DELIMITED BY SIZE INTO RESULT-BIN
               END-IF
               COMPUTE TEMP = TEMP / 2
           END-PERFORM.

           PERFORM INVERTIR-RESULTADO.

       INVERTIR-RESULTADO.
           01 R-LEN PIC 9(4) COMP.
           01 R-TEMP PIC X(64).

           MOVE LENGTH OF RESULT-BIN TO R-LEN.
           MOVE "" TO R-TEMP.

           PERFORM VARYING I FROM R-LEN BY -1 UNTIL I < 1
               STRING RESULT-BIN(I:1) DELIMITED BY SIZE INTO R-TEMP
           END-PERFORM.

           MOVE R-TEMP TO RESULT-BIN.
