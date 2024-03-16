
Program ex6;

Type 
  tBook = Record
    id: Integer;
    title: string;
    genero: string;
    editorial: string;
    year: string;
  End;
  tArchBinBook = File Of tBook;
  tArchTxtBook = Text;

Var 
  arch: tArchBinBook;
  txtArch: tArchTxtBook;


Procedure createBinFromText(Var arch: tArchBinBook; Var txtArch: tArchTxtBook);

Var 
  book: tBook;
Begin

  Reset(txtArch);
  Rewrite(arch);
  While (Not eof(txtArch)) Do
    Begin
      ReadLn(txtArch, book.id);
      ReadLn(txtArch, book.title);
      ReadLn(txtArch, book.genero);
      ReadLn(txtArch, book.editorial);
      ReadLn(txtArch, book.year);
      //write(book.id, book.title, book.genero, book.editorial, book.year);
      write(arch, book);
    End;
  close(txtArch);
  close(arch);

End;

Procedure imprimir(Var arch:tArchBinBook);

Var 
  book: tBook;
Begin
  reset(arch);
  While (Not eof(arch)) Do
    Begin
      Read(arch, book);
      WriteLn(book.id, book.title, book.genero, book.editorial, book.year);
      WriteLn('----------');
    End;
  close(arch);
End;

Procedure agregar(Var arch:tArchBinBook);

Var 
  book: tBook;
Begin
  reset(arch);
  seek(arch, FileSize(arch));
  Write('Ingrese ISBN');
  ReadLn(book.id);
  Write('Ingrese Titulo');
  ReadLn(book.title);
  Write('Ingrese Genero');
  ReadLn(book.genero);
  Write('Ingrese Editorial');
  ReadLn(book.editorial);
  Write('Ingrese year');
  ReadLn(book.year);
  Write(arch, book);
  close(arch);
End;
Procedure modify(Var arch:tArchBinBook);

Var 
  bookUpdated: tBook;
  book: tBook;
  id: Integer;
Begin
  reset(arch);
  Write('Ingrese ISBN del archivo a modificar');
  ReadLn(id);
  bookUpdated.id := id;
  Write('Ingrese Nuevo Titulo');
  ReadLn(bookUpdated.title);
  Write('Ingrese Nuevo Genero');
  ReadLn(bookUpdated.genero);
  Write('Ingrese Nuevo Editorial');
  ReadLn(bookUpdated.editorial);
  Write('Ingrese Nuevo year');
  ReadLn(bookUpdated.year);

  While (Not eof(arch)) Do
    Begin
      Read(arch, book);
      If (book.id = bookUpdated.id) Then
        Begin
          seek(arch, FilePos(arch) - 1);
          Write(arch, bookUpdated);
        End
      Else
        write('No se encontro el libro con ese ISBN');


    End;




  close(arch);
End;
Begin
  Assign(txtArch, 'libros.txt');
  Assign(arch, 'binlibros');
  createBinFromText(arch, txtArch);
  imprimir(arch);
  agregar(arch);
  imprimir(arch);
  modify(arch);
  imprimir(arch);
End.
