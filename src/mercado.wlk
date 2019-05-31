import wollok.game.*
import plantas.*

class Mercado{
	//ATRIBUTOS
	var property inventario= []
	
	var property monedas = null

	var property position
	
	//WOLLOK
	method image() = "market.png"
	
	method seRego() {}
	
	method cosechar(algo) {}
	
	//PLANTAS
	method agregarPlantasAlInventario(plantas) { inventario.addAll(plantas)}
	
	method cantidadDePlantasEnVenta() = inventario.size() 
	
	method decirStock() { game.say(self,"Tengo " + self.cantidadDePlantasEnVenta().toString() + " plantas en venta y " + self.monedas() + " monedas") }
	
	//COMPRA
	method restarMonedas(nuevasMonedas) { monedas-= nuevasMonedas }
	
	method noMeAlcanza() { error.throwWithMessage("No le alcanzan las monedas") }
	
	method comprar(persona) {
		if(persona.valorDeTodasLasPlantas() < monedas){
			persona.agregarMonedas(persona.valorDeTodasLasPlantas())
			self.restarMonedas(persona.valorDeTodasLasPlantas())
			self.agregarPlantasAlInventario(persona.mostrarPlantas())
			persona.borrarPlantas()
			self.decirStock()
		}
		else self.noMeAlcanza() 
	}
}