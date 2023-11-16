import wollok.game.*
import example.*

class Contador{
	var image = "0.png"
	const property position 
	const jugador
	
	method image() = image
	method position() = position
	
	method cambiarImagen(){
		image = jugador.golesSTR() + ".png"
	}
	
	method colision(parametro){}
	method colisionArco(){}
}

object guion{
	var property image = "guion.png"
	var property position = game.at(18,17)
}

const contJ1 = new Contador(position = game.at(16,17), jugador = jugador1)
const contJ2 = new Contador(position = game.at(20,17), jugador = jugador2)