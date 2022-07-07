class Minions{
	var property bananas
	var armas=[]
	var property color = amarillo
	var property maldades=0
	method nuevaArma(a){
		armas.add(a)
	}
	method nuevaMaldad(){
		maldades+=1
	}
	method alimentar(){
		bananas+=1
	}
	method peligroso(){
	return	armas.size()>2
	}
	method tomarSuero(){
		color.tomar(self)
		
	}
	method potenciaArma(){
		return armas.max({e=>e.poder()})
	}
	method tieneArma(nombre){
		return armas.any({e=>e.nombre()==nombre})
	}
	method perderBanana(){bananas-=1}
	method perderArmas(){armas.clear()}
	method nivelConcentracion(){
		return color.concentracion(self)
	}
}
object amarillo{
	method tomar(minion){
		minion.perderArmas()
		minion.perderBanana()
	    minion.color(violeta)
	}
	method concentracion(minion){
	minion.potenciaArma()	
	}
}
object violeta{
	method tomar(minion){
		minion.color(amarillo)
		minion.perderBanana()
	}
	method concentracion(minion){
		minion.bananas()
	}
}
class Armas{
	var property poder
	var property nombre
}
class Villanos{
	var minions=[]
	
	method nuevoMinion(minion){
		minions.add(minion)
	}
	method otorgarArma(minion,arma){
	minion.nuevaArma(arma)
}
    method alimentar(cantidad,minion){
    minion.bananas(cantidad)
}
    method nivelConcentracion(minion){
    	minion.nivelConcentracion()
    }
    method masUtil(){
    	return minions.max({x=>x.maldades()})
    }
    method masInutil(){
    	return minions.min({x=>x.maldades()})
    }
}
class Maldades{
	var capacitados=[]
	method asignarMinion(minion){
		capacitados.addAll(minion)
	}
	method esApto(minion)
	method realizarCon(minion)
}
class Congelar inherits Maldades{
	override method esApto(minion){
		minion.tieneArma("rayoCongelante")
		minion.concentracion(500)
	}
	method realizarEn(ciudad,minion){
		ciudad.disminuirTemperatura(30)
        minion.alimentar(30)       
	}
}
class Robar inherits Maldades{
	var property objetivo
	override method esApto(minion)=
	return 	minion.esPeligroso()&&objetivo.concentracion(minion)
	
	override method realizarCon(minion)=
		minion.realizarCon(minion)
	
	
}
object piramide{
	var altura
	method concentracion(){
		return altura/2
	}
}
object suero{
	method concentracion(minion){
    return  minion.concentracion()>23 && minion.bananas()>100
	}
	method realizarCon(minion){
		minion.tomarSuero()
	}
}
object luna{
	method concentracion(minion){
	return 	minion.tieneArma("rayoEncoger")
	}
	method realizarCon(minion){
	minion.nuevaArma(new Armas(nombre = "rayoCongelante",poder=10))
	}
}