import hector.*
import wollok.game.*

class Planta {
	var property position
		
	method generar(lugar) {
		self.position(lugar)
		game.addVisual(self)
	}
}

class SemillaDeMaiz inherits Planta {
	method image() = "corn_baby.png"
}

class SemillaDeTrigo inherits Planta {
	method image() = "wheat_0.png"
}

class SemillaDeTomaco inherits Planta {
	method image() = "tomaco.png"
}


