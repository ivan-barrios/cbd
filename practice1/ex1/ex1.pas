
Program ex1;

Type 
  tArchMat = File Of String;

Var 
  material, nomArch: String;
  archivo: tArchMat;
Begin

  Write('Ingrese el nombre del archivo: ');
  ReadLn(nomArch);
  //Asigno el archivo a la variable archivo
  Assign(archivo, nomArch);
  //Creo el archivo vacio
  Rewrite(archivo);

  Repeat
    Write('Ingrese material: ');
    ReadLn(material);
    Write(archivo, material);
  Until material = 'cemento';


  //Para verificar, imprimo todo
  Reset(archivo);
  While (Not eof(archivo)) Do
    Begin
      Read(archivo, material);
      WriteLn(material);
    End;
  Close(archivo);

End.
