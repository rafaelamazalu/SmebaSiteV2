snellen_level(0).

monocromatismo(0).

daltonismo_rv(0).

declara_ceguera(0).

declara_epilepsia_fotosensible(0).

+declara_ceguera(1)<-+discapacidad(ceguera);.print("Se detecta ceguera");.updateDatabaseProfile("CEGUERA").

+declara_epilepsia_fotosensible(1)<-+discapacidad(epilepsia_fotosensible);.print("Se detecta epilepsia fotosensible").

+snellen_level(X): X < 8 <- +discapacidad(agudeza_visual);.print("Se detecta problemas en la agudeza visual").

+ishihara2(X,Y): monocromatismo(Z) & daltonismo_rv(T) <- +monocromatismo(Z + X); -monocromatismo(Z);-daltonismo_rv(T);+daltonismo_rv(T+Y).
+ishihara3(X,Y): monocromatismo(Z) & daltonismo_rv(T) <- +monocromatismo(Z + X); -monocromatismo(Z);-daltonismo_rv(T);+daltonismo_rv(T+Y).
+ishihara4(X,Y): monocromatismo(Z) & daltonismo_rv(T) <- +monocromatismo(Z + X); -monocromatismo(Z);-daltonismo_rv(T);+daltonismo_rv(T+Y).
+ishihara5(X,Y): monocromatismo(Z) & daltonismo_rv(T) <- +monocromatismo(Z + X); -monocromatismo(Z);-daltonismo_rv(T);+daltonismo_rv(T+Y).
+ishihara6(X,Y): monocromatismo(Z) & daltonismo_rv(T) <- +monocromatismo(Z + X); -monocromatismo(Z);-daltonismo_rv(T);+daltonismo_rv(T+Y).
+ishihara7(X,Y): monocromatismo(Z) & daltonismo_rv(T) <- +monocromatismo(Z + X); -monocromatismo(Z);-daltonismo_rv(T);+daltonismo_rv(T+Y).
+ishihara8(X,Y): monocromatismo(Z) & daltonismo_rv(T) <- +monocromatismo(Z + X); -monocromatismo(Z);-daltonismo_rv(T);+daltonismo_rv(T+Y).
+ishihara9(X,Y): monocromatismo(Z) & daltonismo_rv(T) <- +monocromatismo(Z + X); -monocromatismo(Z);-daltonismo_rv(T);+daltonismo_rv(T+Y).
+ishihara10(X,Y): monocromatismo(Z) & daltonismo_rv(T) <- +monocromatismo(Z + X); -monocromatismo(Z);-daltonismo_rv(T);+daltonismo_rv(T+Y).
+ishihara11(X,Y): monocromatismo(Z) & daltonismo_rv(T) <- +monocromatismo(Z + X); -monocromatismo(Z);-daltonismo_rv(T);+daltonismo_rv(T+Y).
+ishihara12(X,Y): monocromatismo(Z) & daltonismo_rv(T) <- +monocromatismo(Z + X); -monocromatismo(Z);-daltonismo_rv(T);+daltonismo_rv(T+Y).
<<<<<<< HEAD

+monocromatismo(X) : X > 10 <- +discapacidad(monocromatismo);.print("Se detecta monocromatismo").
=======
+ishihara13(X,Y): monocromatismo(Z) & daltonismo_rv(T) <- +monocromatismo(Z + X); -monocromatismo(Z);-daltonismo_rv(T);+daltonismo_rv(T+Y).
+ishihara14(X,Y): monocromatismo(Z) & daltonismo_rv(T) <- +monocromatismo(Z + X); -monocromatismo(Z);-daltonismo_rv(T);+daltonismo_rv(T+Y).
+ishihara15(X,Y): monocromatismo(Z) & daltonismo_rv(T) <- +monocromatismo(Z + X); -monocromatismo(Z);-daltonismo_rv(T);+daltonismo_rv(T+Y).
+ishihara16(X,Y): monocromatismo(Z) & daltonismo_rv(T) <- +monocromatismo(Z + X); -monocromatismo(Z);-daltonismo_rv(T);+daltonismo_rv(T+Y).
+ishihara17(X,Y): monocromatismo(Z) & daltonismo_rv(T) <- +monocromatismo(Z + X); -monocromatismo(Z);-daltonismo_rv(T);+daltonismo_rv(T+Y).
+ishihara18(X,Y): monocromatismo(Z) & daltonismo_rv(T) <- +monocromatismo(Z + X); -monocromatismo(Z);-daltonismo_rv(T);+daltonismo_rv(T+Y).
+ishihara19(X,Y): monocromatismo(Z) & daltonismo_rv(T) <- +monocromatismo(Z + X); -monocromatismo(Z);-daltonismo_rv(T);+daltonismo_rv(T+Y).
+ishihara20(X,Y): monocromatismo(Z) & daltonismo_rv(T) <- +monocromatismo(Z + X); -monocromatismo(Z);-daltonismo_rv(T);+daltonismo_rv(T+Y).
+ishihara21(X,Y): monocromatismo(Z) & daltonismo_rv(T) <- +monocromatismo(Z + X); -monocromatismo(Z);-daltonismo_rv(T);+daltonismo_rv(T+Y).
+ishihara22(X,Y): monocromatismo(Z) & daltonismo_rv(T) <- +monocromatismo(Z + X); -monocromatismo(Z);-daltonismo_rv(T);+daltonismo_rv(T+Y).
+ishihara23(X,Y): monocromatismo(Z) & daltonismo_rv(T) <- +monocromatismo(Z + X); -monocromatismo(Z);-daltonismo_rv(T);+daltonismo_rv(T+Y).
+ishihara24(X,Y): monocromatismo(Z) & daltonismo_rv(T) <- +monocromatismo(Z + X); -monocromatismo(Z);-daltonismo_rv(T);+daltonismo_rv(T+Y).
+ishihara25(X,Y): monocromatismo(Z) & daltonismo_rv(T) <- +monocromatismo(Z + X); -monocromatismo(Z);-daltonismo_rv(T);+daltonismo_rv(T+Y).




+monocromatismo(X) : X > 1 <- +discapacidad(monocromatismo);.print("Se detecta monocromatismo").
>>>>>>> b8bbdb783c1aa74c5296c06ffbd9a681217a3145
+daltonimos_rv(X): X > 10 <- +discapacidad(daltonismo);.print("Se detecta daltonismo").
!startanalysis.

+!startanalysis: snellen_level(X) <-+snellen(1);+snellen(3);+snellen(7);+declara_epilepsia_fotosensible(1);+ishihara2(1,0);+ishihara3(1,1);!analysis.

+!analysis: snellen(X) & snellen_level(Y) & X > Y <- -snellen_level(Y);+snellen_level(X);.print("Nuevo nivel de snellen: ",X).