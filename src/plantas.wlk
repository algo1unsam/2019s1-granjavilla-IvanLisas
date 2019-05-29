import hector.*
import wollok.game.*

class Planta {
	var property regar = false
	var property position
		
	method generar(lugar) {
		self.position(lugar)
		game.addVisual(self)
	}
}

class SemillaDeMaiz inherits Planta {
	method image() {
		if (self.regar()) return  "corn_adult.png"
		else return "corn_baby.png"
	}
	
	override method generar(lugar){
		self.regar(true)
		super(lugar)
		game.whenCollideDo(self, { alguien => alguien.colicionasteConSemilla(self) })
	}
	
}

class SemillaDeTrigo inherits Planta {
	method image() = "wheat_0.png"
}

class SemillaDeTomaco inherits Planta {
	method image() = "tomaco.png"
}


