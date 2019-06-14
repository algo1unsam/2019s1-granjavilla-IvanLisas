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
	
	method regar() { 
		if(not(self.noHayNadaParaRegar())) { (game.colliders(self)).forEach { planta => planta.seRego() } }
		else self.decirNoHayNadaParaRegar()	 
	}
	
	method decirNoHayNadaParaRegar() = game.say(self,"No hay nada para regar")
	
	method noHayNadaParaRegar() = (game.colliders(self)).isEmpty()
	
	method cosechar() { (game.colliders(self)).forEach { planta => planta.cosechar(self) } }
	
	method valorDeTodasLasPlantas() = plantas.sum { planta => planta.valor() }
	
	method mostrarPlantas() = plantas
	
	method borrarPlantas() { plantas.clear() }
	
	//VENTA
	method vender() { (game.colliders(self)).forEach { mercado => mercado.comprar(self) } }
}