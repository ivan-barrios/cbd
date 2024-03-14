
Program ex2;

Type 
  tArchNum = File Of Integer;

Var 
  archive: tArchNum;
  votes, minVotes, maxVotes: Integer;
  archName: String;
Begin
  //Leo el nombre del archivo
  Write('Ingrese el nombre del archivo a leer: ');
  ReadLn(archName);
  //Lo asigno a la variable archive
  Assign(archive, archName);
  //Lo abro al principio para leer
  Reset(archive);

  minVotes := 32767;
  maxVotes := -1;

  While (Not eof(archive)) Do
    Begin
      //Leo de archivo
      Read(archive, votes);
      //Actualizo minimo y maximo
      If (votes < minVotes) Then
        minVotes := votes;
      If (votes > maxVotes) Then
        maxVotes := votes;

      //Imprimo
      Write('Votos: ');
      WriteLn(votes);

    End;

  Close(archive);

  Write('Minimo de votos: ');
  WriteLn(minVotes);
  Write('Maximo de votos: ');
  WriteLn(maxVotes);

End.
