import wollok.game.*
import example.*
import contador.*


class Arco{
	const position
	const jugador
	method position() = position
	
	method colisionArco(){
		if(jugador == jugador2){
			jugador1.hizoGol()
			jugador1.cambiarPosicion(game.at(6,9))
		    jugador2.cambiarPosicion(game.center().right(1))
	    }
	    else{
	    	jugador2.hizoGol()
            jugador2.cambiarPosicion(game.at(30,9))
	        jugador1.cambiarPosicion(game.center().left(1))
			
	    }
	    contador.cambiarImagen()
		game.sound("silbido.mp3").play()
		pelota.nuevaPosicion(game.center())
	  }
	
	
	method colision(a){}
}

const arcoj1 = new Arco(position = game.at(2,9), jugador = jugador1)
const arcoj2 = new Arco(position = game.at(34,9), jugador = jugador2)


