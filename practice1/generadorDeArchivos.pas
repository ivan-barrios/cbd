
Program generadorDeArchivos;

Type 
  tArchString = File Of String;
  tArchInt = File Of Integer;

Var 
  nomArch: String;
  archivoString: tArchString;
  archivoInt: tArchInt;
  archType: String;
  num: Integer;
  valorString: String;
Begin
  Write('Ingrese el tipo de archivo que quiere (Integer o String): ');
  ReadLn(archType);
  Write('Ingrese el nombre del archivo que quiere: ');
  ReadLn(nomArch);

  Case archType Of 
    'Integer':
               Begin
                 Assign(archivoInt, nomArch);
                 Rewrite(archivoInt);
                 WriteLn(




                     'La lectura termina cuando se ingresa -111 (No se incluye)'
                 );
                 WriteLn('Ingrese numero: ');
                 Read(num);
                 While (Not(num = -111)) Do
                   Begin
                     Write(archivoInt, num);
                     WriteLn('Ingrese numero: ');
                     Read(num);
                   End;
                 Write('Archivo Generado');
                 Close(archivoInt);

               End;
    'String':
              Begin
                Assign(archivoString, nomArch);
                Rewrite(archivoString);
                WriteLn(




                    'La lectura termina cuando se ingresa "zzz" (No se incluye)'
                );
                WriteLn('Ingrese string: ');
                Read(valorString);
                While (Not(valorString = 'zzz')) Do
                  Begin
                    Write(archivoString, valorString);
                    WriteLn('Ingrese String: ');
                    Read(valorString);
                  End;
                Write('Archivo Generado');
                Close(archivoString);
              End;
    Else
      Write('Tipo no valido');
  End;
End.
