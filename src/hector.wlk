import wollok.game.*

object hector {
	var property position = game.at(8,5)
	
	method move(nuevaPosicion) { self.position(nuevaPosicion) }
	
	method image() = "player.png"
	
	method plantarSemilla(semilla) {
		if(self.noHayOtraPlanta(semilla)) semilla.generar(position)
	}
	
	method noHayOtraPlanta(semilla) = true
}