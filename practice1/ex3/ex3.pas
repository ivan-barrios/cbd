
Program ex3;

Var 
  dinosaurio: String;
  carga: Text;
  archName: String;
Begin
  Write('Ingrese nombre del archivo de texto a crear: ');
  Read(archName);
  Assign(carga, archName);
  Rewrite(carga);

  Write('Ingrese primer nombre de dinosaurio: ');

  ReadLn(dinosaurio);

  While ( Not (dinosaurio = 'zzz')) Do
    Begin
      WriteLn(carga, dinosaurio);
      WriteLn('Ingrese otro nombre de dinosaurio: ');
      ReadLn(dinosaurio);
    End;

  Close(carga);
End.
