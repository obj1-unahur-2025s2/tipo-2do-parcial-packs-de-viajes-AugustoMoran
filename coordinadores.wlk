class Coordinador {
  var cantidadDeViajes
  var estaMotivado
  var rol
  var experiencia
  const rolesDisponibles = #{guia, asistenteLogistico, acompaniante}
  method experiencia() = experiencia
  method estaMotivado() = estaMotivado
  method cambiarRol(unRol) {
    if (rolesDisponibles.contains(unRol)){
        rol = unRol
    }else {
        self.error("rol invalido")
    }
  }
  method rol() = rol
  method esAltamenteCalificado() = cantidadDeViajes > 20 and rol.condicionAdicional(self)
}

object guia {
  method condicionAdicional(unCoordinador) = unCoordinador.estaMotivado()
} 
object asistenteLogistico {
method condicionAdicional(unCoordinador) = unCoordinador.experiencia() >= 3
}
object acompaniante {
  method condicionAdicional(unCoordinador) = true
}