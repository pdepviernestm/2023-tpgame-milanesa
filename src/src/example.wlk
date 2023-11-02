import wollok.game.*
import arco.*


object pelota{
	var image = "pelota.png"
	var position = game.center()
	var property walkable = true
	
	method image() = image
	method position() = position

	
	method nuevaPosicion(pos){
		position = pos
	}
	
	method limite(posicionActual, proximaPosicion){
		
		var newPosition = proximaPosicion
		const jugador = jugador1
		const otroJugador = jugador2
		
		if((jugador.position() == posicionActual.left(1) and otroJugador.position() == posicionActual.right(1))
		or (jugador.position() == posicionActual.right(1) and otroJugador.position() == posicionActual.left(1))
		or (jugador.position() == posicionActual.up(1) and otroJugador.position() == posicionActual.down(1))
		or (jugador.position() == posicionActual.down(1) and otroJugador.position() == posicionActual.up(1))
		){
			newPosition = posicionActual
		}
		if(proximaPosicion.y() > 7 and proximaPosicion.y() < 11){
			if(proximaPosicion.x() <2 and posicionActual.x() >2)
		   		newPosition = game.at(2,9)
		   	else if(proximaPosicion.x() > 34 and posicionActual.x() < 34)
		   		newPosition = game.at(34,9)
		   }
		else if((proximaPosicion.y() < 7 and proximaPosicion.y() > 11) and
			(proximaPosicion.y() > 16 or proximaPosicion.y() < 2 or 
			proximaPosicion.x() > 33 or proximaPosicion.x() < 3 )
		) 
			newPosition = posicionActual
	   	return newPosition
	}
	
	method pelotaPateada(posicionActual, jugador){
		
		var jugadorContrario
		if(jugador == jugador1)
			jugadorContrario = jugador2
		else
			jugadorContrario = jugador1
			
		if(jugador.oldPosition() == self.position().left(1)){
			if(
				posicionActual.y() == jugadorContrario.position().y() and 
				posicionActual.x() < jugadorContrario.position().x() and 
				jugadorContrario.position().x() < posicionActual.right(5).x()
			)
				position = jugadorContrario.position().left(1)
			else
				self.rightkick()
				}
				
		else if(jugador.oldPosition() == self.position().right(1)){
			if(posicionActual.y() == jugadorContrario.position().y() and 
				posicionActual.x() > jugadorContrario.position().x() and 
				jugadorContrario.position().x() > posicionActual.left(5).x()
			)
				position = jugadorContrario.position().left(1)
			else
				self.leftkick()
				}
				
		else if(jugador.oldPosition() == self.position().down(1)){
			if(
				posicionActual.x() == jugadorContrario.position().x() 
				and posicionActual.y() < jugadorContrario.position().y() 
				and jugadorContrario.position().y() < posicionActual.up(5).y()
			)
				position = jugadorContrario.position().down(1)
			else
				self.upkick()
				}
				
				
		else if(jugador.oldPosition() == self.position().up(1)){
			if(posicionActual.x() == jugadorContrario.position().x() and 
				posicionActual.y() > jugadorContrario.position().y() and 
				jugadorContrario.position().y() > posicionActual.down(5).y()
			)
				position = jugadorContrario.position().up(1)
			else
				self.downkick()
				}
				
		jugador.patear()
	}
	
	method up(){
		position = self.limite(self.position(),self.position().up(1))
		game.sound("patadaSuave.mp3").play()
	}
	
	method down(){
		position = self.limite(self.position(),self.position().down(1))
		game.sound("patadaSuave.mp3").play()
	}
	
	method left(){
		position = self.limite(self.position(),self.position().left(1))
		game.sound("patadaSuave.mp3").play()
	}
	
	method right(){
		position = self.limite(self.position(),self.position().right(1))
		game.sound("patadaSuave.mp3").play()
	}
	
	method upkick(){
		position = self.limite(self.position(), self.position().up(5))
		game.sound("patadaFuerte.mp3").play()
	}
	
	method downkick(){
		position = self.limite(self.position(), self.position().down(5))
		game.sound("patadaFuerte.mp3").play()
	}
	
	method leftkick(){
		position = self.limite(self.position(), self.position().left(5))
		game.sound("patadaFuerte.mp3").play()
	}
	
	method rightkick(){
		position = self.limite(self.position(), self.position().right(5))
		game.sound("patadaFuerte.mp3").play()
	}
	
	method colision(jugador){
		if(jugador.tirar())
			self.pelotaPateada(self.position(), jugador)
		
		else if(jugador.oldPosition() == self.position().right(1))
				self.left()
		else if(jugador.oldPosition() == self.position().up(1))
				self.down()
		else if(jugador.oldPosition() == self.position().left(1))
				self.right()
		else if(jugador.oldPosition() == self.position().down(1))
				self.up()
		}
	  
	}
	
class Player{
	var position 
	var image  
	var goles = 0
	var tirar = false
	var oldPosition = game.center()
	var estaCorriendo = false
	
	method image() = image
	method position() = position
	method goles() = goles
	method tirar() = tirar
	method oldPosition() = oldPosition
	
	method cambiarPosicion(nuevaPosicion){
		position = nuevaPosicion
	}
	
	method cambiarImagen(nuevaImagen){
		image = nuevaImagen
	}
	
	method limite(posicionActual, proximaPosicion){
		var newPosition 
		if(
			proximaPosicion.y() > 18 or proximaPosicion.y() < 0 or 
			proximaPosicion.x() < 0 or proximaPosicion.x() > 36 or
			(proximaPosicion.y() < 11 and proximaPosicion.y() > 7 and  
			(proximaPosicion.x() == 2 or proximaPosicion.x() == 34))
			)
			newPosition = posicionActual
		else
	   		newPosition = proximaPosicion
	   	return newPosition
	}
	
	method up(){
		oldPosition = self.position()
		if(estaCorriendo)
			position = self.limite(self.oldPosition(), self.position().up(2))
		else
			position = self.limite(self.oldPosition(), self.position().up(1))
	}
	
	method down(){
		oldPosition = self.position()
		if(estaCorriendo)
			position = self.limite(self.oldPosition(), self.position().down(2))
		else
			position = self.limite(self.oldPosition(), self.position().down(1))
	}
	
	method left(){
		oldPosition = self.position()
		if(estaCorriendo)
			position = self.limite(self.oldPosition(), self.position().left(2))
		else
			position = self.limite(self.oldPosition(), self.position().left(1))
	}
	
	method right(){
		oldPosition = self.position()
		if(estaCorriendo)
			position = self.limite(self.oldPosition(), self.position().right(2))
		else
			position = self.limite(self.oldPosition(), self.position().right(1))
	}

	method patear(){
		tirar = not self.tirar()
	}
	
	method colision(jugador){
		position = self.oldPosition()
	}
	
	method hizoGol(){
		goles += 1
	}
	
	method colisionArco(){}
	
	method correr(){
		estaCorriendo = not estaCorriendo
	}
}

const jugador1 = new Player(image = "fichaarg.png", position = game.at(4,9))
const jugador2= new Player(image = "fichaalem.png", position = game.at(30,9))



	


	

	
