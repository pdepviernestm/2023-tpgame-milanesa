import wollok.game.*
import example.*
import Menu.*

const OpcEquipos = new Option(normalImage = "elegirEquipos.png", invertedImage = "elegirEquiposActivo.png", position = game.at(33,12))
const OpcMusica = new Option(normalImage = "OpcMusica.png", invertedImage = "OpcMusicaActivo.png", position = game.at(33,9))
const Atras = new Option(normalImage = "Atras.png", invertedImage = "AtrasActivo.png", position = game.at(33,6))

const WakaWaka = new Option(normalImage = "WakaWaka.png", invertedImage = "WakaWakaActivo.png", position = game.at(33,12))
const MosaMosa = new Option(normalImage = "mosaMosa.png", invertedImage = "mosaMosaActivo.png", position = game.at(33,9))
const WakeMeUp = new Option(normalImage = "WakeMeUp.png", invertedImage = "WakeMeUpActivo.png", position = game.at(27,12))
const DaleDaleBoca = new Option(normalImage = "daleDaleBoca.png", invertedImage = "daleDaleBocaActivo.png", position = game.at(27,9))
const Muchachos = new Option(normalImage = "Muchachos.png", invertedImage = "MuchachosActivo.png", position = game.at(27,6))

const Argentina = new Option(normalImage = "argentinaElegir.png", invertedImage = "argentinaElegirActivo.png", position = game.at(30,12))
const Alemania = new Option(normalImage = "alemaniaElegir.png", invertedImage = "alemaniaElegirActivo.png", position = game.at(30,7))
const Brasil = new Option(normalImage = "brasilElegir.png", invertedImage = "brasilElegirActivo.png", position = game.at(25,12))
const Belgica = new Option(normalImage = "belgicaElegir.png", invertedImage = "belgicaElegirActivo.png", position = game.at(25,7))
const Francia = new Option(normalImage = "franciaElegir.png", invertedImage = "franciaElegirActivo.png", position = game.at(25,2))
const Inglaterra = new Option(normalImage = "inglaterraElegir.png", invertedImage = "inglaterraElegirActivo.png", position = game.at(30,2))

const J1 = new Option(normalImage = "jugador1.png", invertedImage = "jugador1Activo.png", position = game.at(27,12))
const J2 = new Option(normalImage = "jugador2.png", invertedImage = "jugador2Activo.png", position = game.at(27,9))

object menuOpcional {
    
    
    
    method inicializar(){
    	game.clear()
    	menu.cambiarImagen("fondoOpciones.png")
    	game.addVisual(menu)
    	game.addVisual(OpcEquipos)
    	game.addVisual(OpcMusica)
    	game.addVisual(Atras)
    	keyboard.w().onPressDo {seleccionarOpciones.selectUp()}
		keyboard.s().onPressDo {seleccionarOpciones.selectDown()}
		keyboard.enter().onPressDo {seleccionarOpciones.seleccionar()}
    }

    method inicializarMusica(){
    	    game.clear()
    	    menu.cambiarImagen("fondoMusica.jpg")
    	    game.addVisual(menu)
		    game.addVisual(WakaWaka)
			game.addVisual(WakeMeUp)
			game.addVisual(DaleDaleBoca)
			game.addVisual(Muchachos)
			game.addVisual(MosaMosa)
			game.addVisual(Atras)
    		keyboard.w().onPressDo {seleccionarMusica.selectUp()}
			keyboard.s().onPressDo {seleccionarMusica.selectDown()}
			keyboard.a().onPressDo {seleccionarMusica.selectLeftAndRight()}
			keyboard.d().onPressDo {seleccionarMusica.selectLeftAndRight()}
			keyboard.enter().onPressDo {seleccionarMusica.seleccionar()}
			}
	
	method inicializarJugador(){
			game.clear()
			game.addVisual(menu)
		    game.addVisual(J1)
		    game.addVisual(J2)
		    keyboard.w().onPressDo {seleccionarJugador.selectUpAndDown()}
			keyboard.s().onPressDo {seleccionarJugador.selectUpAndDown()}
			keyboard.enter().onPressDo {seleccionarJugador.seleccionar()}
	}
	method inicializarEquipos(){
		    game.clear()
		    menu.cambiarImagen("fondoPersonajes.jpg")
    	    game.addVisual(menu)
		    game.addVisual(Argentina)
			game.addVisual(Belgica)
			game.addVisual(Alemania)
			game.addVisual(Francia)
			game.addVisual(Inglaterra)
			game.addVisual(Brasil)
    		keyboard.w().onPressDo {seleccionarEquipos.selectUp()}
			keyboard.s().onPressDo {seleccionarEquipos.selectDown()}
			keyboard.a().onPressDo {seleccionarEquipos.selectLeftAndRight()}
			keyboard.d().onPressDo {seleccionarEquipos.selectLeftAndRight()}
			keyboard.enter().onPressDo {seleccionarEquipos.seleccionar()}
	}

 }


object seleccionarOpciones{
	method selectDown(){
		if(OpcEquipos.invertido()){
			OpcMusica.invertir()			
			OpcEquipos.invertir()
		}
		else if(OpcMusica.invertido()){
			Atras.invertir()
			OpcMusica.invertir()
		}
		else if(Atras.invertido()){
			OpcEquipos.invertir()
			Atras.invertir()
		}
		else
			OpcEquipos.invertir()
	}
	
	method selectUp(){
		if(OpcEquipos.invertido()){
			OpcEquipos.invertir()
			Atras.invertir()
		}
		else if(OpcMusica.invertido()){
			OpcMusica.invertir()
			OpcEquipos.invertir()
		}
		else if(Atras.invertido()){
			Atras.invertir()
			OpcMusica.invertir()
		}
		else
			OpcEquipos.invertir()
	}
	
	method seleccionar(){
		if(OpcEquipos.invertido()){
	    	menuOpcional.inicializarJugador()
	    	OpcEquipos.invertir()
	    	}
		else if(OpcMusica.invertido()){
			 menuOpcional.inicializarMusica()
			 OpcMusica.invertir()
			 }
		else if(Atras.invertido()){
			menuPrincipal.inicializar()
			Atras.invertir()
			}
	}
}

object seleccionarMusica{
	method selectDown(){
		if(WakaWaka.invertido()){
			MosaMosa.invertir()			
			WakaWaka.invertir()
		}
		else if(MosaMosa.invertido()){
			Atras.invertir()
			MosaMosa.invertir()
		}
		else if(Atras.invertido()){
			WakaWaka.invertir()
			Atras.invertir()
		}
		else if(WakeMeUp.invertido()){
			DaleDaleBoca.invertir()
			WakeMeUp.invertir()
		}
		else if(DaleDaleBoca.invertido()){
			Muchachos.invertir()
			DaleDaleBoca.invertir()
		}
		else if(Muchachos.invertido()){
			WakeMeUp.invertir()
			Muchachos.invertir()
			}
		else
			WakeMeUp.invertir()
	}
	
	method selectUp(){
		if(WakaWaka.invertido()){
			Atras.invertir()			
			WakaWaka.invertir()
		}
		else if(MosaMosa.invertido()){
			WakaWaka.invertir()
			MosaMosa.invertir()
		}
		else if(Atras.invertido()){
			MosaMosa.invertir()
			Atras.invertir()
		}
		else if(WakeMeUp.invertido()){
			Muchachos.invertir()
			WakeMeUp.invertir()
		}
		else if(DaleDaleBoca.invertido()){
			WakeMeUp.invertir()
			DaleDaleBoca.invertir()
		}
		else if(Muchachos.invertido()){
			DaleDaleBoca.invertir()
			Muchachos.invertir()
			}
		else
			WakeMeUp.invertir()
	}
	
	method selectLeftAndRight(){
		if(WakaWaka.invertido()){
			WakeMeUp.invertir()			
			WakaWaka.invertir()
		}
		else if(MosaMosa.invertido()){
			DaleDaleBoca.invertir()
			MosaMosa.invertir()
		}
		else if(Atras.invertido()){
			Muchachos.invertir()
			Atras.invertir()
		}
		else if(WakeMeUp.invertido()){
			WakaWaka.invertir()
			WakeMeUp.invertir()
		}
		else if(DaleDaleBoca.invertido()){
			MosaMosa.invertir()
			DaleDaleBoca.invertir()
		}
		else if(Muchachos.invertido()){
			Atras.invertir()
			Muchachos.invertir()
			}
		else
			WakeMeUp.invertir()
	}
	
	method seleccionar(){
		if(WakaWaka.invertido()){
			menuPrincipal.cambiarMusica("WakaWaka.mp3")
			}
		else if(MosaMosa.invertido()){
			menuPrincipal.cambiarMusica("mosamosa.mp3")
			}
		else if(WakeMeUp.invertido()){
			menuPrincipal.cambiarMusica("wakeMeUp.mp3")
			}
		else if(DaleDaleBoca.invertido()){
			menuPrincipal.cambiarMusica("DaleDaleBoca.mp3")
			}
		else if(Muchachos.invertido()){
			menuPrincipal.cambiarMusica("Muchachos.mp3")
			}
		else if(Atras.invertido()){
			game.clear()
			Atras.invertir()
			menuOpcional.inicializar()
		}
	
	}
}
	
object seleccionarEquipos{
	
	var jugador = jugador1
	
	method cambiarJugador(nuevoJugador){
		jugador = nuevoJugador
	}
	
	method selectDown(){
		if(Argentina.invertido()){
			Alemania.invertir()			
			Argentina.invertir()
		}
		else if(Alemania.invertido()){
			Inglaterra.invertir()
			Alemania.invertir()
		}
		else if(Inglaterra.invertido()){
			Argentina.invertir()
			Inglaterra.invertir()
		}
		else if(Brasil.invertido()){
			Belgica.invertir()
			Brasil.invertir()
		}
		else if(Belgica.invertido()){
			Francia.invertir()
			Belgica.invertir()
		}
		else if(Francia.invertido()){
			Brasil.invertir()
			Francia.invertir()
			}
		else
			Brasil.invertir()
	}
	
	method selectUp(){
		if(Argentina.invertido()){
			Inglaterra.invertir()			
			Argentina.invertir()
		}
		else if(Alemania.invertido()){
			Argentina.invertir()
			Alemania.invertir()
		}
		else if(Inglaterra.invertido()){
			Alemania.invertir()
			Inglaterra.invertir()
		}
		else if(Brasil.invertido()){
			Francia.invertir()
			Brasil.invertir()
		}
		else if(Belgica.invertido()){
			Brasil.invertir()
			Belgica.invertir()
		}
		else if(Francia.invertido()){
			Belgica.invertir()
			Francia.invertir()
			}
		else
			Brasil.invertir()
	}
	
	method selectLeftAndRight(){
		if(Argentina.invertido()){
			Brasil.invertir()			
			Argentina.invertir()
		}
		else if(Alemania.invertido()){
			Belgica.invertir()
			Alemania.invertir()
		}
		else if(Inglaterra.invertido()){
			Francia.invertir()
			Inglaterra.invertir()
		}
		else if(Brasil.invertido()){
			Argentina.invertir()
			Brasil.invertir()
		}
		else if(Belgica.invertido()){
			Alemania.invertir()
			Belgica.invertir()
		}
		else if(Francia.invertido()){
			Inglaterra.invertir()
			Francia.invertir()
			}
		else
			Brasil.invertir()
	}
	
	method seleccionar(){
		if(Argentina.invertido()){
			jugador.cambiarImagen("fichaarg.png")
			Argentina.invertir()
			menuOpcional.inicializar()
			}
		else if(Alemania.invertido()){
			jugador.cambiarImagen("fichaalem.png")
			Alemania.invertir()
			menuOpcional.inicializar()
			}
		else if(Brasil.invertido()){
			jugador.cambiarImagen("fichabrasil.png")
			Brasil.invertir()
			menuOpcional.inicializar()
			}
		else if(Belgica.invertido()){
			jugador.cambiarImagen("fichabelgica.png")	
			Belgica.invertir()
			menuOpcional.inicializar()
			}
		else if(Francia.invertido()){
			jugador.cambiarImagen("fichafrancia.png")
			Francia.invertir()
			menuOpcional.inicializar()
			}
		else if(Inglaterra.invertido()){
			jugador.cambiarImagen("fichaInglaterra.png")
			Inglaterra.invertir()
			menuOpcional.inicializar()
			}
	}
}

object seleccionarJugador{
	method selectUpAndDown(){
		if(J1.invertido()){
			J2.invertir()			
			J1.invertir()
		}
		else if(J2.invertido()){
			J1.invertir()
			J2.invertir()
		}
		else
			J1.invertir()
	}
	
	method seleccionar(){
		if(J1.invertido()){
			 menuOpcional.inicializarEquipos()
			 seleccionarEquipos.cambiarJugador(jugador1)
			 }
		else if(J2.invertido()){
			 menuOpcional.inicializarEquipos()
			 seleccionarEquipos.cambiarJugador(jugador2)
			 }
	}
}