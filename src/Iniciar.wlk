import wollok.game.*
import arco.*
import example.*
import Menu.*
import contador.*

object empezar {
	
	method iniciar(){
		game.height(19)
    	game.width(37)
    	game.addVisual(jugador1)
   	 	game.addVisual(jugador2)
   	 	game.addVisual(pelota)
   		game.addVisual(arcoj1)
    	game.addVisual(arcoj2)
    	game.addVisual(contador)
    
	
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
	    
	    game.whenCollideDo(pelota, {p => p.colisionArco()})
		game.whenCollideDo(jugador1, {p => p.colision(jugador1)})
		game.whenCollideDo(jugador2, {p => p.colision(jugador2)})
		
}

}
