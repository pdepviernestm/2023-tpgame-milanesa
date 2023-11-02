import wollok.game.*
import example.*

object contador{
	var image = "0-0 .png"
	var position = game.at(16,16)
	
	method image() = image
	method position() = position
	
	method cambiarImagen(){
		if(jugador2.goles() == 1 and jugador1.goles() == 0)
			image = "1-0 .png"
		else if(jugador2.goles() == 2 and jugador1.goles() == 0)
			image = "2-0.png"
		else if(jugador2.goles() == 3 and jugador1.goles() == 0)
			image = "3-0.png"
		else if(jugador2.goles() == 1 and jugador1.goles() == 1)
			image = "1-1.png"
		else if(jugador2.goles() == 2 and jugador1.goles() == 1)
			image = "2-1.png"
		else if(jugador2.goles() == 3 and jugador1.goles() == 1)
			image = "3-1.png"
		else if(jugador2.goles() == 2 and jugador1.goles() == 2)
			image = "2-2.png"
		else if(jugador2.goles() == 3 and jugador1.goles() == 2)
			image = "3-2.png"
		else if(jugador2.goles() == 3 and jugador1.goles() == 3)
			image = "3-3.png"
		else if(jugador2.goles() == 0 and jugador1.goles() == 1)
			image = "0-1.png"
		else if(jugador2.goles() == 0 and jugador1.goles() == 2)
			image = "0-2.png"
		else if(jugador2.goles() == 0 and jugador1.goles() == 3)
			image = "0-3.png"
		else if(jugador2.goles() == 1 and jugador1.goles() == 2)
			image = "1-2.png"
		else if(jugador2.goles() == 1 and jugador1.goles() == 3)
			image = "1-3.png"
		else if(jugador2.goles() == 2 and jugador1.goles() == 3)
			image = "2-3.png"
	}
	
	method colision(parametro){}
	method colisionArco(){}
}
