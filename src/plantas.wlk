import hector.*
import wollok.game.*
import evolucionTrigo.*

class Planta {
	var property position
		
	method generar(lugar) {
		self.position(lugar)
		game.addVisual(self)
	}
	
	method cosechar(persona) {
		if(self.listaParaCosechar()){
			game.removeVisual(self)
			persona.agregarPlanta(self)
		}
		else error.throwWithMessage("No se puede cosechar")
	}
	
	method valor()
	
	method listaParaCosechar()
	
	//method decirAlgo(){ game.say(self,"Valgo " + self.valor().toString() + " monedas") }
}

class SemillaDeMaiz inherits Planta {
	var property regada = false
	
	method image() {
		if (self.regada()) return  "corn_adult.png"
		else return "corn_baby.png"
	}

	method seRego(){ self.regada(true) }
	
	override method listaParaCosechar() = self.regada()
	
	override method valor() = 150
}

class SemillaDeTrigo inherits Planta {
	var property nivelDeTrigo = nivel0Trigo
	
	method image() = nivelDeTrigo.imagen()
	
	method seRego() { nivelDeTrigo.evolucion(self) }
	
	override method listaParaCosechar() = self.nivelDeTrigo().nivel() > 1

	override method valor() = (nivelDeTrigo.nivel() - 1) * 100
}

class SemillaDeTomaco inherits Planta {
	method image() = "tomaco.png"
	
	method seRego() { 
		self.position(self.position().up(1))
		if (self.pasoLosLimites()) { self.position(self.position().down(game.height()))  }
	}
	
	method pasoLosLimites() = self.position().y() > game.height() - 1
	
	override method listaParaCosechar() = true
	
	override method valor() = 80
}


