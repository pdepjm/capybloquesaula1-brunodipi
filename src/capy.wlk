import wollok.game.*

object capy {
  var property position = game.origin()
  var impactoEnLaHuellaDeCarbonoTotal = 0 
  
  method recolectarBasura(basura){
    game.removeVisual(basura)
    game.say(self, "Recolecté: barril de " + basura.nombre())
    impactoEnLaHuellaDeCarbonoTotal += basura.impactoEnLaHuellaDeCarbono()
  }
  
  method tratar(){
    impactoEnLaHuellaDeCarbonoTotal = (impactoEnLaHuellaDeCarbonoTotal - 20).max(0)
  }
  
  method impactoEnLaHuellaDeCarbono() = impactoEnLaHuellaDeCarbonoTotal
  
  method image() = "capy_tranqui.png"
}

object hornet {
  var property position = game.at(5,5)
  var impactoEnLaHuellaDeCarbonoTotal = 100 
  
  method recolectarBasura(basura){
    game.removeVisual(basura)
    game.say(self, "KARANA " + basura.nombre())
    impactoEnLaHuellaDeCarbonoTotal += basura.impactoEnLaHuellaDeCarbono()
  }
  
  method tratar(){
    impactoEnLaHuellaDeCarbonoTotal = (impactoEnLaHuellaDeCarbonoTotal - 10).max(0)
  }

  method colisionarCon(capy) {
    game.say(self, "ashankaa")
  }
  
  method impactoEnLaHuellaDeCarbono() = impactoEnLaHuellaDeCarbonoTotal
  
  method image() = "hornet.png"
}