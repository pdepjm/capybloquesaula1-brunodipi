import wollok.game.*
import utilidades.*
import combustibles.*

object lataDeCerveza {
  var property position = posicionAleatoria.calcular()
  var property longitudCm = 10
  
  method impactoEnLaHuellaDeCarbono() = 5 * longitudCm
  method nombre() = "lata_roja"
  method image() = self.nombre() + ".png"

  method esReciclable() = true
  
  method tratar() {
    longitudCm *= 0.9
  }
  
  method colisionarCon(capy) {
    capy.recolectarBasura(self)

  }
}

object botellaDeGaseosa {
  var impactoEnHuellaDeCarbono = 100
  var property position = posicionAleatoria.calcular()
  
  method impactoEnLaHuellaDeCarbono() = impactoEnHuellaDeCarbono

  method nombre() = "lata_naranja"

  method image() = self.nombre() + ".png"  

  method esReciclable() = true
  
  method tratar() {
    impactoEnHuellaDeCarbono -= 5
  }
  
  method colisionarCon(capy) {
    capy.recolectarBasura(self)
  }
}

object barrilDeCombustible {
  var property position = posicionAleatoria.calcular()
  var combustibleActual = biogas
  var combustibleAnterior = gasoil
  
  method impactoEnLaHuellaDeCarbono() = combustibleActual.consumo()
  
  method esReciclable() = false
  method nombre() =  "barril"
  method image() = self.nombre() + "_" + combustibleActual.sufijo()+ "_" + ".png"

  method cambiarCombustible() {
    const aux = combustibleActual
    combustibleActual = combustibleAnterior
    combustibleAnterior = aux
  }
  
  method combustibleActual() = combustibleActual
  
  method colisionarCon(capy) {
    capy.recolectarBasura(self)
    game.removeTickEvent("cambiarCombustible")
  }
}

object cd{
  var impactoEnHuellaDeCarbono = 181
  var position = game.at(0,4)

  method position(nueva) {
    position = nueva
  }

  method position() = position

  method impactoEnLaHuellaDeCarbono() = impactoEnHuellaDeCarbono

  method nombre() = "cdGenerico"

  method image() = self.nombre() + ".jpg"  

  method esReciclable() = true
  
  method tratar() {
    impactoEnHuellaDeCarbono -= 15
  }
  
  method colisionarCon(capy) {
    capy.recolectarBasura(self)
    game.removeTickEvent("moverCD")
  }

}