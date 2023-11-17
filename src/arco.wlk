import wollok.game.*
import example.*
import contador.*


class Arco{
	const position
	const jugador
	method position() = position
	
	method colisionArco(){
		pelota.nuevaPosicion(game.at(40,40))
		jugador1.congelar()
		jugador2.congelar()
		if(jugador == jugador2){
			jugador1.hizoGol()
			game.schedule(1000, {jugador1.position(game.at(6,9))})
		    game.schedule(1000, {jugador2.position(game.center().right(1))})
	    }
	    else{
	    	jugador2.hizoGol()
            game.schedule(1000, {jugador2.position(game.at(30,9))})
	        game.schedule(1000, {jugador1.position(game.center().left(1))})
	    }
	    contJ1.cambiarImagen()
	    contJ2.cambiarImagen()
		game.schedule(1000, {game.sound("silbido.mp3").play()})
		game.schedule(1000, {pelota.nuevaPosicion(game.center())})
		game.schedule(1000, {jugador1.congelar()})
		game.schedule(1000, {jugador2.congelar()})
	  }
	
	
	method colision(a){}
}

const arcoj1 = new Arco(position = game.at(2,9), jugador = jugador1)
const arcoj2 = new Arco(position = game.at(34,9), jugador = jugador2)


