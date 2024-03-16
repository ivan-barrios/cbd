
Program ex5;

Type 
  tRegisterFlowers = Record
    spNum: Integer;
    maxHeight: Real;
    scientificName: String;
    vulgarName: String;
    color: String;
  End;
  tArchFlowers = File Of tRegisterFlowers;

Const 
  READ_END = 'zzz';

Var 
  arch: tArchFlowers;
  flower: tRegisterFlowers;
  opt: Integer;


Procedure cargarArchFlowers(Var arch:tArchFlowers);

Var 
  fileName: String;
  flower: tRegisterFlowers;
Begin
  Write('Ingrese nombre del archivo: ');
  ReadLn(fileName);
  Assign(arch, fileName);
  Rewrite(arch);
  WriteLn('Ingrese numero de especie: ');
  ReadLn(flower.spNum);
  WriteLn('Ingrese altura maxima: ');
  ReadLn(flower.maxHeight);
  WriteLn('Ingrese nombre cientifico: ');
  ReadLn(flower.scientificName);
  WriteLn('Ingrese nombre vulgar: ');
  ReadLn(flower.vulgarName);
  WriteLn('Ingrese color: ');
  ReadLn(flower.color);
  While (Not(flower.scientificName = READ_END)) Do
    Begin
      Write(arch, flower);
      WriteLn('Ingrese numero de especie: ');
      ReadLn(flower.spNum);
      WriteLn('Ingrese altura maxima: ');
      ReadLn(flower.maxHeight);
      WriteLn('Ingrese nombre cientifico: ');
      ReadLn(flower.scientificName);
      WriteLn('Ingrese nombre vulgar: ');
      ReadLn(flower.vulgarName);
      WriteLn('Ingrese color: ');
      ReadLn(flower.color);
    End;

  Close(arch);

End;

Procedure countAndMinMax(Var arch:tArchFlowers);

Var 
  total: Integer;
  min,max: Real;
  flower: tRegisterFlowers;
Begin
  total := 0;
  min := 9999;
  max := -1;
  Reset(arch);
  While (Not eof(arch)) Do
    Begin
      Read(arch, flower);
      total := total + 1;
      If (flower.maxHeight > max) Then
        max := flower.maxHeight;
      If (flower.maxHeight < min) Then
        min := flower.maxHeight;
    End;
  Write('El total de flores es de: ');
  WriteLn(total);
  Write('La maxima altura es de: ');
  WriteLn(max);
  Write('La minima altura es de: ');
  WriteLn(min);
  Close(arch);

End;

Procedure printAll(Var arch:tArchFlowers);

Var 
  flower: tRegisterFlowers;
Begin
  Reset(arch);
  While (Not eof(arch)) Do
    Begin
      Read(arch, flower);
      Write(flower.spNum, flower.maxHeight, flower.scientificName, flower.
            vulgarName, flower.color);
    End;
  Close(arch);
End;

Procedure modifyVic(Var arch: tArchFlowers);

Var 
  flower: tRegisterFlowers;
Begin
  Reset(arch);
  While (Not eof(arch)) Do
    Begin
      Read(arch, flower);
      If (flower.scientificName = 'Victoria Amazonia') Then
        flower.scientificName := 'Victoria Amazónica';
      Seek(arch, filepos(arch) - 1 );

      Write(arch, flower);
    End;
  Close(arch);
End;

Procedure nuevaCarga(Var arch: tArchFlowers);
Begin
  reset(arch);
  Seek(arch, FileSize(arch));
  WriteLn('Ingrese numero de especie: ');
  ReadLn(flower.spNum);
  WriteLn('Ingrese altura maxima: ');
  ReadLn(flower.maxHeight);
  WriteLn('Ingrese nombre cientifico: ');
  ReadLn(flower.scientificName);
  WriteLn('Ingrese nombre vulgar: ');
  ReadLn(flower.vulgarName);
  WriteLn('Ingrese color: ');
  ReadLn(flower.color);
  While (Not(flower.scientificName = READ_END)) Do
    Begin
      Write(arch, flower);
      WriteLn('Ingrese numero de especie: ');
      ReadLn(flower.spNum);
      WriteLn('Ingrese altura maxima: ');
      ReadLn(flower.maxHeight);
      WriteLn('Ingrese nombre cientifico: ');
      ReadLn(flower.scientificName);
      WriteLn('Ingrese nombre vulgar: ');
      ReadLn(flower.vulgarName);
      WriteLn('Ingrese color: ');
      ReadLn(flower.color);
    End;

  Close(arch);
End;

Procedure listarContenido(Var arch:tArchFlowers);

Var 
  txtArch: Text;
  flor: tRegisterFlowers;
Begin
  reset(arch);
  Assign(txtArch, 'flores.txt');
  Rewrite(txtArch);
  While (Not eof(arch)) Do
    Begin
      read(arch, flor);
      WriteLn(txtArch, flor.spNum);
      WriteLn(txtArch, flor.maxHeight);
      WriteLn(txtArch, flor.scientificName);
      WriteLn(txtArch, flor.vulgarName);
      WriteLn(txtArch, flor.color);
    End;
  close(arch);
  close(txtArch);
End;

Begin
  cargarArchFlowers(arch);
  WriteLn('---------------------------------------------------------------');
  WriteLn('Seleccione una opcion: ');
  WriteLn(




'1: Reportar en pantalla la cantidad total de especies y la especie de menor y de mayor altura a alcanzar.'
  );
  WriteLn('2: Listar todo el contenido del archivo de a una especie por línea.'
  );
  WriteLn('3: Modificar el nombre científico de la especie flores cargada.');
  WriteLn(




'4: Añadir más especies al final del archivo. La carga finaliza al recibir especie “zzz”'
  );
  WriteLn('5:Listar todo el contenido del archivo');
  WriteLn('6:Salir');
  Read(opt);

  While (Not (opt = 6)) Do
    Begin
      Case opt Of 
        1: countAndMinMax(arch);
        2: printAll(arch);
        3: modifyVic(arch);
        4: nuevaCarga(arch);
        5: listarContenido(arch);
        6: Write('Saliendo...');
      End;
      Read(opt);
    End;

End.
