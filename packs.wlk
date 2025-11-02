import coordinadores.*
import beneficioEspecial.*


class Pack {
    var duracion
    var precioBase
    const beneficiosEspeciales = #{}
    var coordinador


    method esPremium()  
    method valorDelPack() = precioBase + beneficiosEspeciales.filter({e => e.estaVigente()}).sum({e => e.costo()})
}

class PackNacional inherits Pack{
    var provinciaDestino
    const actividades = []
    override method esPremium() = duracion > 10 and coordinador.esAltamenteCalificado()
}

class PackInternacional inherits Pack {
  var paisDestino
  var cantidadDeEscalas
  var esDeInteres
  var escalas
  override method valorDelPack() = super() * 1.20
  override method esPremium() = esDeInteres and duracion > 20 and escalas == 0
}

class PackProvincial inherits PackNacional {
  var ciudadesAVisitar []

  override method esPremium() = actividades.size() >= 4 and ciudadesAVisitar.size() > 5 and beneficiosEspeciales.count({b => b.estaVigente()}) >= 3
  override method valorDelPack() = if(self.esPremium()){
    super() * 1.05
  }else{
    super()
  }
}

