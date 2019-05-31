import wollok.game.*

object hector {
	
	//ATRIBUTOS
	var property position = game.at(8,5)
	
	var property plantas = []
	
	var property billetera = 0
	//WOLLOK GAME
	method move(nuevaPosicion) { self.position(nuevaPosicion) }
	
	method image() = "player.png"
	
	//HECTOR
	method agregarMonedas(monedas) { billetera += monedas }
	
	method decirQueTengo() { 
		game.say(self,"Tengo " + self.billetera().toString() + 
		" monedas y " + self.cantidadDePlantas().toString() + " plantas." )
	}

	
	//PLANTAS
	method agregarPlanta(planta) { plantas.add(planta) }
	
	method cantidadDePlantas() = plantas.size()
	
	method plantarSemilla(semilla) { if(self.noHayOtraPlanta()) semilla.generar(position) }

	method noHayOtraPlanta() = game.colliders(self).isEmpty()
	
	method regar() { (game.colliders(self)).forEach { planta => planta.seRego() } }
	
	method cosechar() { (game.colliders(self)).forEach { planta => planta.cosechar(self) } }
	
	method valorDeTodasLasPlantas() = plantas.sum { planta => planta.valor() }
	
	method borrarPlantas() { plantas.clear() }
	
	//VENTA
	method vender() {
		self.agregarMonedas(self.valorDeTodasLasPlantas())
		self.borrarPlantas()
	}
}