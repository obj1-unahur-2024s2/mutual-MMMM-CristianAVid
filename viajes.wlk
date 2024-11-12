class Actividad{
  const property idioma = []
  method esInteresante() = idioma.size() > 2
  method esRecomendado(unSocio) = self.esInteresante() and ! unSocio.leAtrae(self) and unSocio.actividadesRealizadas().contains(self)

}
class ViajesDePlaya inherits Actividad{
  const largoDeLaPlaya 
  
  method  implicaEsfuerso() = largoDeLaPlaya>1200
  method sirveParaBronsearese() = true
  method diasDeActividad() = largoDeLaPlaya/500
}

class EscurcioanALaCidad inherits Actividad{
  var atraccionesAVisitar

  method  implicaEsfuerso() = atraccionesAVisitar.between(5, 8)
  method sirveParaBronsearese() = false
  method diasDeActividad() = atraccionesAVisitar/2
  override method esInteresante() = super() || atraccionesAVisitar == 5
}

class CiudadTropical inherits EscurcioanALaCidad{
  override method diasDeActividad() = super() + 1
  override method sirveParaBronsearese() = true
}

class Trekking inherits Actividad{
  const kmDeSenderos
  const diasdeSol
  method  implicaEsfuerso() = kmDeSenderos > 80
  method sirveParaBronsearese() = diasdeSol > 200 ||
                                diasdeSol.between(100, 200) and
                                kmDeSenderos > 120
  method diasDeActividad() =kmDeSenderos/50
  override method esInteresante() = super() and diasdeSol > 140
  

}

class ClasesDeGimnacia inherits Actividad{
  method initialize(){
    idioma.clear()
    idioma.add("español")
 }
 method implicaEsfuerso() = true
 method diasDeActividad() = 1
 method sirveParaBronsearese() = false
}

class Socios{
  var property actividadesRealizadas = []
  var maximodeActividades
  var edad 
  const property idioma =#{}
  
  method esRecomendado(unaActividad){ unaActividad.esInteresante() and 
  actividadesRealizadas.}
  method leAtrae(unaActividad)
  method esAdoradorDelSol() = actividadesRealizadas.all({a=>a.sirveParaBronsearese()})
  method actividadEsforzadas()= actividadesRealizadas.filter({a=>a.implicaEsfuerso()})
  method registrarActividad(unaActividad) {if(actividadesRealizadas.size() == maximodeActividades) self.error("llego al maximo")
  actividadesRealizadas.add(unaActividad)
  }
 
  }
  class SocioTranquilo inherits Socios{
    override method leAtrae(unaActividad) = unaActividad.diasDeActividad() >= 4
  
  }   
  class SocioCoherente inherits Socios{
    override method leAtrae(unaActividad){
      if(self.esAdoradorDelSol()) {
        unaActividad.sirveParaBronsearese()
      }else{
        unaActividad.implicaEsfuerso()
      }
    } 
    }

    class SocioRelajado inherits Socios{
      override method leAtrae(unaActividad){
        return !idioma.interseccion(unaActividad.idiomas()).isEmpty()
      }
    
  }