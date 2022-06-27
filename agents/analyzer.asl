+error(X) <- .print("Error: ",X).
//getById(X) :- .print("Obteniendo: ",X).
//+!getImageTag(X)<- .print("Obteniendo Image Tag: ", X); +newTag("Identificador",[["ALT","texto alternativo"],["SRC","/url"]]); +image("Identificador").

//barrera 1: Imágenes ricas que carecen de un texto equivalente

+attribute(Xpath, Attribute, Value) <-.print("Nuevo atributo para: ",Xpath, Attribute, Value).
+loadAttributes(Xpath,[]).
+loadAttributes(Xpath,[[Attribute,Value]|Tail]) <- +attribute(Xpath, Attribute, Value); loadAttributes(Xpath, Tail).

+newTag(Xpath, Attributes) <- !loadAttributes(Xpath, Attributes).


+image(Xpath):attribute(Xpath,"ARIA-LABEL",X) & empty(X)<- .error(Xpath, "1.1.1").
+image(Xpath):attribute(Xpath,"ALT","")<-.error(Xpath, "1.1.1").
+image(Xpath):attribute(Xpath,"ARIA-LABELLEDBY","")<-.error(Xpath, "1.1.1").
+image(Xpath):attribute(Xpath,"ARIA-LABELLEDBY",X)<-.getById(X).
+image(Xpath):not attribute(Xpath,"ARIA-LABELLEDBY",_) & not attribute(Xpath,"ARIA-LABEL",_) & not attribute(Xpath,"ALT",_)<-+error(Xpath, "1.1.1").

+criterio(X): X=="1.1.1" <- .getImageTag("img");.getImageTag("input").

+!barrera(X): X==1 <- +criterio("1.1.1").
+barrera(X): X==2 <- .print("se agrega conocimiento");.getImageTag("IMG").