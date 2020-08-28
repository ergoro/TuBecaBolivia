*Structure dataset
use "tbb_edu_survey_teams.dta", clear
*Rename vars
quietly{
rename Username email
rename NombreCompleto name
rename CelularConcÃdigodepaÃs phonenum
rename CiudaddeResidencia city
rename SeleccionaelÃreadetrabajoe forces
rename ÂEnquÃtipodeproyectotegu f1
rename ÂTienesalgunaotraideaoprop f1o
rename I f2
rename J f2o
rename K f3
rename L f3o
rename M f4
rename N f4o
rename O f5
rename P f5o
}
*Re-assign values
quietly{
tab forces
replace forces="Alianzas" if forces=="Alianzas"
replace forces="Contenido" if forces=="Contenido"
replace forces="Difusión" if forces=="DifusiÃ³n"
replace forces="Formación" if forces=="FormaciÃ³n"
replace forces="Investigación" if forces=="InvestigaciÃ³n"
split f1, p(;)
replace f11="contenido" if f11=="InvestigaciÃ³n de Contenido AcadÃ©mico MÃ­nimo (Ministerio Edu., Benchmarking con otros paÃ­ses, etc.)."
replace f11="métodos" if f11=="InvestigaciÃ³n sobre plantillas de ejercicios, metodologÃ­as, etc. para el proceso aprendizaje/enseÃ±anza de contenidos."
replace f11="material" if f11=="CreaciÃ³n o PreparaciÃ³n de material educativo (Libros, Ebooks, Videos, Plantillas, etc.)."
replace f11="adaptación" if f11=="AdaptaciÃ³n de contenido a diferentes necesidades (rural, discapacidades, virtual, offline, etc.)."
replace f12="contenido" if f12=="InvestigaciÃ³n de Contenido AcadÃ©mico MÃ­nimo (Ministerio Edu., Benchmarking con otros paÃ­ses, etc.)."
replace f12="métodos" if f12=="InvestigaciÃ³n sobre plantillas de ejercicios, metodologÃ­as, etc. para el proceso aprendizaje/enseÃ±anza de contenidos."
replace f12="material" if f12=="CreaciÃ³n o PreparaciÃ³n de material educativo (Libros, Ebooks, Videos, Plantillas, etc.)."
replace f12="adaptación" if f12=="AdaptaciÃ³n de contenido a diferentes necesidades (rural, discapacidades, virtual, offline, etc.)."
replace f13="contenido" if f13=="InvestigaciÃ³n de Contenido AcadÃ©mico MÃ­nimo (Ministerio Edu., Benchmarking con otros paÃ­ses, etc.)."
replace f13="métodos" if f13=="InvestigaciÃ³n sobre plantillas de ejercicios, metodologÃ­as, etc. para el proceso aprendizaje/enseÃ±anza de contenidos."
replace f13="material" if f13=="CreaciÃ³n o PreparaciÃ³n de material educativo (Libros, Ebooks, Videos, Plantillas, etc.)."
replace f13="adaptación" if f13=="AdaptaciÃ³n de contenido a diferentes necesidades (rural, discapacidades, virtual, offline, etc.)."
replace f14="contenido" if f14=="InvestigaciÃ³n de Contenido AcadÃ©mico MÃ­nimo (Ministerio Edu., Benchmarking con otros paÃ­ses, etc.)."
replace f14="métodos" if f14=="InvestigaciÃ³n sobre plantillas de ejercicios, metodologÃ­as, etc. para el proceso aprendizaje/enseÃ±anza de contenidos."
replace f14="material" if f14=="CreaciÃ³n o PreparaciÃ³n de material educativo (Libros, Ebooks, Videos, Plantillas, etc.)."
replace f14="adaptación" if f14=="AdaptaciÃ³n de contenido a diferentes necesidades (rural, discapacidades, virtual, offline, etc.)."
drop f1
gen f1contenidos=1 if f11=="contenido" | f12=="contenido" | f13=="contenido" | f14=="contenido"
gen f1métodos=1 if f11=="métodos" | f12=="métodos" | f13=="métodos" | f14=="métodos"
gen f1materiales=1 if f11=="material" | f12=="material" | f13=="material" | f14=="material"
gen f1adaptación=1 if f11=="adaptación" | f12=="adaptación" | f13=="adaptación" | f14=="adaptación"
gen f1curricula=.
drop f11 f12 f13 f14
split f2, p(;)
replace f21="formación" if f21=="FormaciÃ³n a Estudiantes (Clases de reforzamiento acadÃ©mico)"
replace f21="padres" if f21=="FormaciÃ³n a Padres/Madres de familia (Capacitaciones, Webinar, etc.)"
replace f21="profesores" if f21=="FormaciÃ³n a Profesores (Mejores prÃ¡cticas, Soporte pedagÃ³gico, TransiciÃ³n a lo virtual)"
replace f21="reconocimientos" if f21=="Reconocimiento a los Profesores en este aÃ±o escolar."
replace f21="vocación" if f21=="FormaciÃ³n a Estudiantes (OrientaciÃ³n vocacional)"
replace f22="formación" if f22=="FormaciÃ³n a Estudiantes (OrientaciÃ³n vocacional)"
replace f22="padres" if f22=="FormaciÃ³n a Padres/Madres de familia (Capacitaciones, Webinar, etc.)"
replace f22="profesores" if f22=="FormaciÃ³n a Profesores (Mejores prÃ¡cticas, Soporte pedagÃ³gico, TransiciÃ³n a lo virtual)"
replace f22="reconocimientos" if f22=="Reconocimiento a los Profesores en este aÃ±o escolar."
replace f22="vocación" if f22=="FormaciÃ³n a Estudiantes (OrientaciÃ³n vocacional)"
replace f23="formación" if f23=="FormaciÃ³n a Estudiantes (OrientaciÃ³n vocacional)"
replace f23="padres" if f23=="FormaciÃ³n a Padres/Madres de familia (Capacitaciones, Webinar, etc.)"
replace f23="profesores" if f23=="FormaciÃ³n a Profesores (Mejores prÃ¡cticas, Soporte pedagÃ³gico, TransiciÃ³n a lo virtual)"
replace f23="reconocimientos" if f23=="Reconocimiento a los Profesores en este aÃ±o escolar."
replace f23="vocación" if f23=="FormaciÃ³n a Estudiantes (OrientaciÃ³n vocacional)"
replace f24="formación" if f24=="FormaciÃ³n a Estudiantes (OrientaciÃ³n vocacional)"
replace f24="padres" if f24=="FormaciÃ³n a Padres/Madres de familia (Capacitaciones, Webinar, etc.)"
replace f24="profesores" if f24=="FormaciÃ³n a Profesores (Mejores prÃ¡cticas, Soporte pedagÃ³gico, TransiciÃ³n a lo virtual)"
replace f24="reconocimientos" if f24=="Reconocimiento a los Profesores en este aÃ±o escolar."
replace f24="vocación" if f24=="FormaciÃ³n a Estudiantes (OrientaciÃ³n vocacional)"
drop f2
gen f2formación=1 if f21=="formación" | f22=="formación" | f23=="formación" | f24=="formación"
gen f2vocación=1 if f21=="vocación" | f22=="vocación" | f23=="vocación" | f24=="vocación"
gen f2profesores=1 if f21=="profesores" | f22=="profesores" | f23=="profesores" | f24=="profesores"
gen f2reconocimientos=1 if f21=="reconocimientos" | f22=="reconocimientos" | f23=="reconocimientos" | f24=="reconocimientos"
gen f2padres=1 if f21=="padres" | f22=="padres" | f23=="padres" | f24=="padres"
drop f21 f22 f23 f24
split f3, p(;)
replace f31="difusión" if f31=="ColaboraciÃ³n en la difusiÃ³n de proyectos, informaciÃ³n."
replace f31="recursos" if f31=="CreaciÃ³n de base de datos y/o guÃ­a de recursos educativos."
replace f31="web" if f31=="CreaciÃ³n o rediseÃ±o PÃ¡gina Web."
replace f31="medios" if f31=="Podcast, Videos, Radio, TV, Medios Escritos, etc."
replace f32="difusión" if f32=="ColaboraciÃ³n en la difusiÃ³n de proyectos, informaciÃ³n."
replace f32="recursos" if f32=="CreaciÃ³n de base de datos y/o guÃ­a de recursos educativos."
replace f32="web" if f32=="CreaciÃ³n o rediseÃ±o PÃ¡gina Web."
replace f32="medios" if f32=="Podcast, Videos, Radio, TV, Medios Escritos, etc."
replace f33="difusión" if f33=="ColaboraciÃ³n en la difusiÃ³n de proyectos, informaciÃ³n."
replace f33="recursos" if f33=="CreaciÃ³n de base de datos y/o guÃ­a de recursos educativos."
replace f33="web" if f33=="CreaciÃ³n o rediseÃ±o PÃ¡gina Web."
replace f33="medios" if f33=="Podcast, Videos, Radio, TV, Medios Escritos, etc."
drop f3
gen f3difusión=1 if f31=="difusión" | f32=="difusión" | f33=="difusión"
gen f3recursos=1 if f31=="recursos" | f32=="recursos" | f33=="recursos"
gen f3web=1 if f31=="web" | f32=="web" | f33=="web"
gen f3medios=1 if f31=="medios" | f32=="medios" | f33=="medios"
drop f31 f32 f33
split f4, p(;)
replace f41="investigar" if f41=="InvestigaciÃ³n Educativa en Bolivia"
replace f41="exámen" if f41=="Bases para el desarrollo de un examen estandarizado."
replace f41="PISA" if f41=="Sugerencias para implementaciÃ³n del PISA en Bolivia"
replace f41="indicadores" if f41=="GeneraciÃ³n indicadores para TBB EducaciÃ³n"
replace f42="investigar" if f42=="InvestigaciÃ³n Educativa en Bolivia"
replace f42="exámen" if f42=="Bases para el desarrollo de un examen estandarizado."
replace f42="PISA" if f42=="Sugerencias para implementaciÃ³n del PISA en Bolivia"
replace f42="indicadores" if f42=="GeneraciÃ³n indicadores para TBB EducaciÃ³n"
replace f43="investigar" if f43=="InvestigaciÃ³n Educativa en Bolivia"
replace f43="exámen" if f43=="Bases para el desarrollo de un examen estandarizado."
replace f43="PISA" if f43=="Sugerencias para implementaciÃ³n del PISA en Bolivia"
replace f43="indicadores" if f43=="GeneraciÃ³n indicadores para TBB EducaciÃ³n"
replace f44="investigar" if f44=="InvestigaciÃ³n Educativa en Bolivia"
replace f44="exámen" if f44=="Bases para el desarrollo de un examen estandarizado."
replace f44="PISA" if f44=="Sugerencias para implementaciÃ³n del PISA en Bolivia"
replace f44="indicadores" if f44=="GeneraciÃ³n indicadores para TBB EducaciÃ³n"
drop f4
gen f4investigar=1 if f41=="investigar" | f42=="investigar" | f43=="investigar" | f44=="investigar"
gen f4exámen=1 if f41=="recursos" | f42=="recursos" | f43=="recursos" | f44=="recursos"
gen f4PISA=1 if f41=="PISA" | f42=="PISA" | f43=="PISA" | f44=="PISA"
gen f4indicadores=1 if f41=="indicadores" | f42=="indicadores" | f43=="indicadores" | f44=="indicadores"
drop f41 f42 f43 f44
split f5, p(;)
replace f51="otros" if f51=="BÃºsqueda de Alianzas en bÃºsqueda de financiamiento (ONGs, CooperaciÃ³n, Embajadas, Estado, etc.)"
replace f51="educativas" if f51=="Alianzas EstratÃ©gicas con Instituciones Educativas."
replace f52="otros" if f52=="BÃºsqueda de Alianzas en bÃºsqueda de financiamiento (ONGs, CooperaciÃ³n, Embajadas, Estado, etc.)"
replace f52="educativas" if f52=="Alianzas EstratÃ©gicas con Instituciones Educativas."
drop f5
gen f5otros=1 if f51=="otros" | f52=="otros"
gen f5educativas=1 if f51=="educativas" | f52=="educativas"
drop f51 f52
}
tab f1o
*fixing names
tab name
replace name="Ana Lucía Mamani Espinal" if name=="Ana LucÃ­a Mamani Espinal "
replace name="Carmen Paola Cárdenas Díaz" if name=="Carmen Paola CÃ¡rdenas DÃ­az"
replace name="Carla Daniela Andrade Catacora" if name=="Carla Daniela Andrade Catacora "
replace name="Carmelo Branimir España Villegas" if name=="Carmelo Branimir EspaÃ±a Villegas"
replace name="Diegi Andrés Silva Vera" if name=="Diegi AndrÃ©s Silva Vera"
replace name="Fany Beatríz Ramos Quispe" if name=="Fany BeatrÃ­z Ramos Quispe"
replace name="Nélida Victoria Nina Mamani" if name=="NÃ©lida Victoria Nina Mamani"
replace name="Alejandra Yhamel Canaviri Condori" if name=="Alejandra Yhamel Canaviri Condori "
