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

const golGana = new Option(normalImage = "golGana.png", invertedImage = "golGanaActivo.png", position = game.at(33,12))
const a3 = new Option(normalImage = "a3.png", invertedImage = "a3Activo.png", position = game.at(33,9))
const a5 = new Option(normalImage = "a5.png", invertedImage = "a5Activo.png", position = game.at(33,6))

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
		game.boardGround("cancha.jpg")
		menu.cambiarImagen("fondoMenu.png")
		keyboard.w().onPressDo {seleccionarPrincipal.selectup()}
		keyboard.s().onPressDo {seleccionarPrincipal.selectdown()}
		keyboard.enter().onPressDo {seleccionarPrincipal.seleccionar()}
		game.height(19)
	    game.width(37)
	    game.title("Wollokball")
	    game.addVisual(menu)
	    game.addVisual(nuevaPartida)
	    game.addVisual(configuracion)
	    game.addVisual(cerrarJuego)
	    }
	 
	 
	method inicializarModos(){
		game.clear()
		menu.cambiarImagen("fondoMenu.png")
		keyboard.w().onPressDo {seleccionarModoDeJuego.selectup()}
		keyboard.s().onPressDo {seleccionarModoDeJuego.selectdown()}
		keyboard.enter().onPressDo {seleccionarModoDeJuego.seleccionar()}
	    game.addVisual(menu)
	    game.addVisual(golGana)
	    game.addVisual(a3)
	    game.addVisual(a5)
			
	}
	method iniciar(){
		game.start()
	}
}

object seleccionarModoDeJuego{
	
	var modo = 0
	
	method modo() = modo
	
	method selectdown(){
		if(golGana.invertido()){
			a3.invertir()			
			golGana.invertir()
		}
		else if(a3.invertido()){
			a5.invertir()
			a3.invertir()
		}
		else if(a5.invertido()){
			golGana.invertir()
			a5.invertir()
		}
		else
			golGana.invertir()
	}
	
	method selectup(){
		if(golGana.invertido()){
			golGana.invertir()
			a5.invertir()
		}
		else if(a3.invertido()){
			a3.invertir()
			golGana.invertir()
		}
		else if(a5.invertido()){
			a5.invertir()
			a3.invertir()
		}
		else
			golGana.invertir()
	}
	
	method seleccionar(){
		if(golGana.invertido()){
			game.clear()
			modo = 0
			empezar.iniciar()
		}
		else if(a3.invertido()){
			game.clear()
			modo = 1
			empezar.iniciar()
		}
		else if(a5.invertido()){
			game.clear()
			modo = 2
			empezar.iniciar()
		}
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
			menuPrincipal.inicializarModos()
		}
		else if(configuracion.invertido()){
			menuOpcional.inicializar()
		}
		else if(cerrarJuego.invertido()){
			game.stop()
		}
	}
}
