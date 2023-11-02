import wollok.game.*
import Iniciar.*
import Opciones.*

class Option{
	var normalImage
	var invertedImage
	var image = normalImage
	const position
	var invertido = false
	
	method image() = image
	method position() = position
	method invertido() = invertido
	
	method invertir(){
		if(self.invertido())
			image = normalImage
		if(not invertido)
			image = invertedImage
		invertido = not invertido
	}
	
	
	
}

object menu{
	
	var imagen = "fondoMenu.png"
	
	method image() = imagen
	method position() = game.at(0,0)
	
	method cambiarImagen(imagenNueva){
		imagen = imagenNueva
	}
}

const nuevaPartida = new Option(normalImage = "partida.png", invertedImage = "partidaActivo.png", position = game.at(33,12))
const configuracion = new Option(normalImage = "Opciones.png", invertedImage = "OpcionesActivado.png", position = game.at(33,9))
const cerrarJuego = new Option(normalImage = "cerrarJuego.png", invertedImage = "cerrarJuegoActivo.png", position = game.at(33,6))

object menuPrincipal {
	var musica = game.sound("mosamosa.mp3")
	
	
	method cambiarMusica(musicaNueva){
		if(musica.played())
			musica.stop()
		musica = game.sound(musicaNueva)
		musica.shouldLoop(true)
		musica.volume(1 / 3)
		musica.play()
	}

	method inicializar(){
		game.clear()
		menu.cambiarImagen("fondoMenu.png")
		keyboard.w().onPressDo {seleccionarPrincipal.selectup()}
		keyboard.s().onPressDo {seleccionarPrincipal.selectdown()}
		keyboard.enter().onPressDo {seleccionarPrincipal.seleccionar()}
		game.height(19)
	    game.width(37)
	    game.boardGround("cancha.jpg")
	    game.title("Wollokball")
	    game.addVisual(menu)
	    game.addVisual(nuevaPartida)
	    game.addVisual(configuracion)
	    game.addVisual(cerrarJuego)
	    }
	
	method iniciar(){
		game.start()
	}
}

object seleccionarPrincipal{
	
	method selectdown(){
		if(nuevaPartida.invertido()){
			configuracion.invertir()			
			nuevaPartida.invertir()
		}
		else if(configuracion.invertido()){
			cerrarJuego.invertir()
			configuracion.invertir()
		}
		else if(cerrarJuego.invertido()){
			nuevaPartida.invertir()
			cerrarJuego.invertir()
		}
		else
			nuevaPartida.invertir()
	}
	
	method selectup(){
		if(nuevaPartida.invertido()){
			nuevaPartida.invertir()
			cerrarJuego.invertir()
		}
		else if(configuracion.invertido()){
			configuracion.invertir()
			nuevaPartida.invertir()
		}
		else if(cerrarJuego.invertido()){
			cerrarJuego.invertir()
			configuracion.invertir()
		}
		else
			nuevaPartida.invertir()
	}
	
	method seleccionar(){
		if(nuevaPartida.invertido()){
			game.clear()
			empezar.iniciar()
		}
		else if(configuracion.invertido()){
			menuOpcional.inicializar()
		}
		else if(cerrarJuego.invertido()){
			game.stop()
		}
	}
}


