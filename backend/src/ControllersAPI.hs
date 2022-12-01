module ControllersAPI where 
  import Types
  import ServicesAPI

  opcionesHars :: Mensajes
  opcionesHars =  Mensajes ["Espero que te haya sido de ayuda, ¿Quieres que haga otra cosa por ti?","A) Mas Informacion", "B) Realizar un ejercicio", "C) Porque te llamas HARS?", "D) Terminar servicio"]

  welcomeMessage :: Mensajes 
  welcomeMessage = Mensajes ["¡¡Hola!!, !Mi nombre es HARS y sere tu ayudante!. Tenemos varias opciones que puedes escoger:", "A) Mas Informacion", "B) Realizar un ejercicio", "C) Porque te llamas HARS?", "D) Terminar servicio"] 

  infoMessage :: Mensajes
  infoMessage = Mensajes ["Soy un bot encargado de mostrar las maravillas de el lenguaje de programacion haskell, muy poca gente usa este lenguaje y mas gente deberia aprenderlo :C", "Seleccionaste la opcion A, asi que te dare informacion de lo que puedo hacer, si? :)", "Tenemos varias opciones que te pueden gustar!", "Si seleccionas la opcion B podras ir al los ejercicios matematicos que puedo resolverte (Solo puedo resolver 3 problemas, cada uno de diferente dificultad, tenme paciencia, mi programador esta trabajando duro para darme mas funcionalidades para ti!).", "La opcion C te dira quien soy y porque fui creado, por si te interesa :)", "y la opcion D termina mi servicio hasta que quieras hablar conmigo de nuevo :)", "Ahora si, que quieres que haga por ti?", "A) Mas Informacion", "B) Realizar un ejercicio", "C) Porque te llamas HARS?", "D) Terminar servicio"]

  exercisesMessage :: Mensajes
  exercisesMessage = Mensajes ["Tenemos 3 opciones de ejercicios para hacer, ¡escoge el que mas te guste! (o     escoge los 3, ¡se puede!!","Opciones: ","Facil: Sumatoria e n numeros","Medio: Potencia de n numeros","Dificil: Regresion Lineal","¿O prefieres ver otra opcion?", "A) Mas Informacion", "B) Realizar un ejercicio", "C) Porque te llamas HARS?", "D) Terminar servicio"]

  exercisesMessageEasy :: Mensajes
  exercisesMessageEasy = Mensajes ["Este ejercicio es el facil, pero es muy util! te hare una suma con todos los numeros que me mandes!! tan solo separa por espacios los numero que quieres que sume!", "Vamos!!"]
  
  exercisesMessageMedium :: Mensajes
  exercisesMessageMedium = Mensajes ["Este si se me complica, pero se que puedo hacerlo, por ti amigo, dame todos los numeros que me mandes! separalos con comas, siempre lo potenciare al cuadrado, pero si pones una coma(,) y despues un numero, calculare la potecia de este!!", "Vamos Mandamelo!!"]

  exercisesMessageHard :: Mensajes 
  exercisesMessageHard = Mensajes ["Bueno, este si sera complicado de verdad, asi que hagamoslo.","Te Hare la regrsion lineal!", "Debes mandarme los numeros que requieres entre 2 variables (ejemplo X y Y), mandamelos separados por espacio y puedes poner una coma (,) para que diferencie de una lista de valores que me mandaste", "Te muestro un ejemplo","1 2 3 44 5 71,55 233 92 61 5 6", "Y por favor, que ambos lados tengan los mismos valores! :C", "Hare lo mejor que pueda, enviamelos!!"]

  whoIsHarsMessage :: Mensajes
  whoIsHarsMessage = Mensajes ["Gracias por preguntar por mi, no muchos lo hacen :c!", "Me llamo HARS! Es un acronimo al stack que mi creador se lo ocurrio!", "HA: Haskell.- Es un lenguaje de programacion del paradigma funcional, es muy interesante a la desafiante, si llegan a usarlo oestudiarlo les cambiara la manera de ver la programacion, ¡Es Increible!", "R: React.- Es la libreria mas popular de todo el ecosistema de JavaScript, donde podremos crear UI(Interfaz de usuario) de una manera super facil y divertiva. Antes de adentrarse les recomiendo primero Aprender JavaScript!", "S: Servant.- Servant es un framework web creado en haskell para crear servidores y servicios web, a diferencia de las demas es facil de usar y su documentacion es muy didactica, si quieren crear su servidor web Servant les sera muyy util!", "Y este soy yo, aun soy muy joven, estoy muy limitado y no puedo hacer muchas cosas, pero espero que pueda serles de ayuda en lo que necesiten!", "Ya me conoces, asi que, ¿Que puedo hacer por ti?", "A) Mas Informacion", "B) Realizar un ejercicio", "C) Porque te llamas HARS?", "D) Terminar servicio"]

  finishHars :: Mensajes
  finishHars = Mensajes ["Muchas gracias por Estar aqui!, espero poder haber sido de ayuda, te veo a la proxima :D!!", "Presiona Iniciar para volver a activar el servicio nuevamente"] 

  easyExcercise :: EjercicioFacil -> ResultadoFacil
  easyExcercise dataPost = ResultadoFacil resEasy'
    where resEasy' = sumArray (ArrayData (valuesEasy dataPost))
  
  mediumExcercise :: EjercicioMedio -> ResultadoMedio
  mediumExcercise dataPost = ResultadoMedio body' 
    where body' = powArray (ArrayDataInt (valuesMedium dataPost)) (IntData (powNumber dataPost))

  hardExcercise :: EjercicioDificil -> ResultadoDificil
  hardExcercise dataPost = ResultadoDificil body'
    where body' = getLinealRegression (ArrayData (x dataPost)) (ArrayData (y dataPost))