import wollok.game.*
import arco.*
import example.*
import Menu.*
import contador.*

object empezar {
	
	method pantallaDeEquipo(jugador){
		menu.cambiarImagen(jugador.banner())
	}
	
	method musicaEspecial(){
		menuPrincipal.cambiarMusica("soycordobes.mp3")
		jugador1.image("fichacordoba.png")
		jugador1.banner("ganoCordoba.jpg")
	}

	method iniciar(){
		jugador1.position(game.at(4,9))
		jugador2.position(game.at(30,9))
		pelota.nuevaPosicion(game.center())
		jugador1.resetearGoles()
		jugador2.resetearGoles()
		contJ1.cambiarImagen()
	    contJ2.cambiarImagen()
    	game.addVisual(jugador1)
   	 	game.addVisual(jugador2)
   	 	game.addVisual(pelota)
   		game.addVisual(arcoj1)
    	game.addVisual(arcoj2)
    	game.addVisual(contJ1)
    	game.addVisual(contJ2)
    	game.addVisual(guion)
    	game.sound("silbido.mp3").play()
	
		keyboard.w().onPressDo {jugador1.up()}
    	keyboard.s().onPressDo {jugador1.down()}
    	keyboard.a().onPressDo {jugador1.left()}
    	keyboard.d().onPressDo {jugador1.right()}
    	keyboard.c().onPressDo {jugador1.patear()}
    	keyboard.x().onPressDo {jugador1.correr()}
    	
		keyboard.up().onPressDo {jugador2.up()}
    	keyboard.down().onPressDo {jugador2.down()}
    	keyboard.left().onPressDo {jugador2.left()}
    	keyboard.right().onPressDo {jugador2.right()}
    	keyboard.shift().onPressDo {jugador2.patear()}
    	keyboard.control().onPressDo {jugador2.correr()}
	    
	    keyboard.p().onPressDo {menuPrincipal.inicializar()}
	    
	    keyboard.num0().onPressDo {self.musicaEspecial()}
	    
	    game.whenCollideDo(pelota, {p => p.colisionArco()})
		game.whenCollideDo(jugador1, {p => p.colision(jugador1)})
		game.whenCollideDo(jugador2, {p => p.colision(jugador2)})
		
	}

	method modoGolGana(){
		if(jugador1.goles() == 1){
			game.clear()
			self.pantallaDeEquipo(jugador1)
			game.addVisual(menu)
		    keyboard.space().onPressDo {menuPrincipal.inicializar()}
		    jugador1.resetearGoles()
		}
		else if(jugador2.goles() == 1){
			game.clear()
			self.pantallaDeEquipo(jugador2)
			game.addVisual(menu)
		    keyboard.space().onPressDo {menuPrincipal.inicializar()}
		    jugador2.resetearGoles()
			}
	}
	
	method modoA3(){
		if(jugador1.goles() == 3){
			game.clear()
			self.pantallaDeEquipo(jugador1)
			game.addVisual(menu)
		    keyboard.space().onPressDo {menuPrincipal.inicializar()}
		    jugador1.resetearGoles()
		}
		else if(jugador2.goles() == 3){
			game.clear()
			self.pantallaDeEquipo(jugador2)
			game.addVisual(menu)
		    keyboard.space().onPressDo {menuPrincipal.inicializar()}
		    jugador2.resetearGoles()
			}
	}
	
	method modoA5(){
		if(jugador1.goles() == 5){
			game.clear()
			self.pantallaDeEquipo(jugador1)
			game.addVisual(menu)
		    keyboard.space().onPressDo {menuPrincipal.inicializar()}
		    jugador1.resetearGoles()
		}
		else if(jugador2.goles() == 5){
			game.clear()
			self.pantallaDeEquipo(jugador2)
			game.addVisual(menu)
		    keyboard.space().onPressDo {menuPrincipal.inicializar()}
		    jugador2.resetearGoles()
			}
		}
	

}


