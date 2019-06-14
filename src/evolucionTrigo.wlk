import wollok.game.*
import plantas.*

object nivel0Trigo {
	method imagen() = "wheat_0.png"
	
	method nivel() = 0
	
	method evolucion(trigo) { trigo.nivelDeTrigo(nivel1Trigo) }
}

object nivel1Trigo {
	method imagen() = "wheat_1.png"
	
	method nivel() = 1
	
	method evolucion(trigo) { trigo.nivelDeTrigo(nivel2Trigo) }
}

object nivel2Trigo {
	method imagen() = "wheat_2.png"
	
	method nivel() = 2
	
	method evolucion(trigo) { trigo.nivelDeTrigo(nivel3Trigo) }
}

object nivel3Trigo {
	method imagen() = "wheat_3.png"
	
	method nivel() = 3
	
	method evolucion(trigo) { trigo.nivelDeTrigo(nivel0Trigo) }
}